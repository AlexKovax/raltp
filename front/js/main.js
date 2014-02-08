//////////////
// main.js //
////////////

///////////
// VAR

var mapCenter = new L.LatLng(48.856614,2.352222);//Paris sera toujours Paris...
var globalGroup = new L.LayerGroup();
var tabMarkersObj=[];
var modeFull = 1;
var dispLignes = [];
var tabDataLignes = [];
var tabStationsInterlignes = [];

var polygonParis, template_lignes, template_popup;


///////////////
// FUNCTIONS
function openPopup(id){
    tabMarkersObj[id].openPopup();
}

function clearMap(){
    globalGroup.clearLayers();
    map.closePopup();
    tabMarkersObj=[];
    dispLignes = [];
}

function isDisplayedLigne(ligne){
    return (ligne in dispLignes);
}

function removeLigne(ligne){

    //On commence par effacer la polyline qui constitue la ligne
    globalGroup.removeLayer(dispLignes[ligne]);
    delete dispLignes[ligne];

    //Puis on efface toutes les stations
    $.getJSON( '/api/lignes/'+ligne, function(data){
        for(i in data.stations){
            var idstation = data.stations[i].id;
            //Verification que la station n'appartient pas à une ligne encore affichée
            for (j in tabStationsInterlignes[idstation]){
                if(isDisplayedLigne(tabStationsInterlignes[idstation][j])){
                    break;
                }
                if(idstation in tabMarkersObj){
                    globalGroup.removeLayer(tabMarkersObj[idstation]);
                    delete tabMarkersObj[idstation];
                }
            }
        }
    });

}

function computeInterlignes(){
    for(ligne in tabDataLignes){
        for(i in tabDataLignes[ligne].stations){
            station = tabDataLignes[ligne].stations[i];
            if(station.id in tabStationsInterlignes){
                tabStationsInterlignes[station.id].push(ligne);
            }else{
                tabStationsInterlignes[station.id] = [ligne];
            }
        }
    }
}

function drawMarker(d){
    var markerLocation = new L.LatLng(d.lat, d.lon);
    var circleParams = {
        radius: 6,
        fillColor: "#"+d.couleur,
        color: "#"+d.couleur,
        weight: 1,
        opacity: 1,
        fillOpacity: 1
    };
    var marker = new L.CircleMarker(markerLocation,circleParams);
    var html = template_popup(d);
    marker
    .bindPopup(html,{
        minWidth: 350,
        maxWidth: 400
    })
    .addTo(globalGroup)
    .bringToFront();

    marker.on("popupopen",function(){
        //nav par touches
        $(document).off("keyup").on("keyup",function(e){
            var code = e.keyCode || e.which;
            if(code == 39 && d.next) {
                openPopup(d.next);
            }else if(code == 37 && d.prev){
                openPopup(d.prev);
            }
        });

        //affichage des lignes connectées
        if(! modeFull){
            //draw connected lines
            jQuery.ajaxSetup({
                async:false
            });//On doit attendre la fin du dessin des lignes dans le code qui suit <- TODO (on peut eviter en ajoutant dans le tableau a la main)
            var interlignes = tabStationsInterlignes[d.id];
            for(i in interlignes){
                if(interlignes[i] != d.ligne && !(interlignes[i] in dispLignes))
                    getLigne(interlignes[i]);
            }
            //cleaning
            for(j in dispLignes){
                if(interlignes.indexOf(j) == -1){
                    removeLigne(j);
                }
            }
            jQuery.ajaxSetup({
                async:true
            });//On retablit le param par défaut

        }else{
            clearMap();
            for(i in tabStationsInterlignes[d.id])
                getLigne(tabStationsInterlignes[d.id][i]);
        }

    });

    tabMarkersObj[d.id]= marker;

}

function drawLigne(data){
    modeFull = 0;
    //stations
    for( var i=0;i<data.stations.length;i++ ) {
        station=data.stations[i];
        if(! (station.id in tabMarkersObj)) {
            station["couleur"]=data.couleur;
            station["numero"]=data.numero;
            station["terminus1"]=data.terminus1.nom;
            station["terminus2"]=data.terminus2.nom;
            station["ligneid"]=data.id;
            if((i-1) >= 0)
                station["prev"]=data.stations[i-1].id;
            if((i+1) < data.stations.length)
                station["next"]=data.stations[i+1].id;
            drawMarker(station);
        }
    }
    //path
    var polyline = L.polyline(data.path, {
        color: "#"+data.couleur,
        opacity: 1
    }).addTo(globalGroup).bringToBack();

    dispLignes[parseInt(data.id)] = polyline;

    polygonParis.bringToBack();
}

function getLigne(id){
    $.getJSON( '/api/lignes/'+id, function(data){
        if(data.visible == 1)
            drawLigne(data);
    })
}

function getAllLignes(){
    $.getJSON( '/api/lignes', function(data){
        var html = template_lignes({
            objects:data
        });
        $("ul#listLignes").html(html);

        //handlers
        $("ul#listLignes li a").on("click",function(e){
            clearMap();
            $("ul#listLignes li ul").slideUp();
            if(! $(this).siblings("ul").is(":visible")){
                getLigne($(this).data("id"));
                $(this).siblings("ul").slideDown();
                modeFull = 0;
            }
        });
    })
}

function drawAllLines(){
    $.getJSON( '/api/lignes', function(data){
        for(i in data){
            if(data[i].visible == "1"){
                drawLigne(data[i]);
                tabDataLignes[data[i].id] = data[i];
            }
        }

        modeFull = 1;
        computeInterlignes();
    });
}

/////////////////////////////
// INIT

$(document).ready(function () {
    //INIT MAP
    map = new L.Map('map');
    L.tileLayer(
        'https://{s}.tiles.mapbox.com/v3/benetco.ggeffhde/{z}/{x}/{y}.png',
        {
            attribution: '',
            maxZoom: 18
        }
        ).addTo(map);
    map.addLayer(globalGroup);
    map.setView(mapCenter, 13);
    map.keyboard.disable();

    //polygon representant Paris (à peu près...)
    polygonParis = L.polygon([
        [48.89948 ,2.30997],
        [48.89948, 2.39185],
        [48.88074, 2.40764],
        [48.83489, 2.40970],
        [48.81929, 2.37194],
        [48.81929,2.325454],//
        [48.84393, 2.25727],
        [48.86832, 2.27306],
        ],{
            color: "#F0EBD8",
            opacity: 0,
            fillColor: '#F0EBD8',
            fillOpacity: 0.6
        }).addTo(map).bringToBack();

    //display
    getAllLignes();

    //draw all the lines
    drawAllLines();

    //templates compilation
    template_lignes = Handlebars.compile($("#template-lignes").html());
    template_popup = Handlebars.compile($("#template-popup").html());

    //slimscroll
    var h=$(window).height();
    $('ul#listLignes').slimScroll({
        height: h+"px"
    });

    /////////
    // nav
    $("nav#about li img").click(function(){
        $("div.subtitle").hide();
        $("div." + $(this).data("btn")).show();
    });

});
