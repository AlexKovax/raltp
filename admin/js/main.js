//////////////
// main.js //
////////////


//////////////////////
// MODELS
var Station = Backbone.Model.extend({
    urlRoot: "/api/stations",
        saveDetails:function(details){
        console.log(details);
        this.set(details);
        this.save();
        //app.navigate("",{trigger: true});
        //Todo alert qui confirme eventuellement
    }
});

var ListeStations = Backbone.Collection.extend({
    model: Station,
    url: "/api/stations"
})

var Ligne = Backbone.Model.extend({
    urlRoot: "/api/lignes",
    defaults:{
        id:null,
        nom:"",
        description:"",
        couleur:"ffffff",
        numero:0,
        //visible:1,
        stations:[]
    },
    saveDetails:function(details){
        this.set(details);
        this.save();
    },
    deleteLigne:function(){
        this.destroy({
            success:function () {
                console.log('Ligne deleted successfully');
                window.history.back();
            }
        });
        return false
    }
});

var Reseau = Backbone.Collection.extend({
    model: Ligne,
    url: "/api/lignes"
});


///////////////////////////
// VIEWS
var StationView = Backbone.View.extend({
    el: "div#edit_station",
    initialize: function(){
        this.render();
    },
    events: {
        "click button.edit": function(){
            this.editClick();
        },
        "click button.addtoligne": function(){
            //console.log("<li><a data-id='"+this.model.get("id")+"' href='#'>"+this.model.get("nom")+"</a></li>");
            //todo ajouté dans le model et verifier que ca existe pas déjà maybe
            $("ul#traceLigne").append("<li><a data-id='"+this.model.get("id")+"' href='#'>"+this.model.get("nom")+"</a></li>");
            var t=app.ligne.get("stations");
            console.log(t);
            t.push(this.model.toJSON());
            console.log(t);
            t[t.length - 1].position = t.length;
            console.log(t);
        }
    },
    render:function(){
        var template = _.template( $("#station_template").html(), this.model.toJSON() );
        this.$el.html( template );
        if(app.detailsLigne)
            this.$el.find('button.addtoligne').removeAttr("disabled");
        return this;
    },
    close:function () {
        $(this.el).unbind();
        $(this.el).empty();
    },
    editClick: function(){
        var details = {
            nom: this.$el.find('input[name="nom"]').val(),
            wikipedia: this.$el.find('input[name="wikipedia"]').val(),
            description: this.$el.find('textarea[name="description"]').val()
        }
        this.model.saveDetails(details);
    }
});

var LigneView = Backbone.View.extend({
    tagName: 'li',
    template: _.template("<a href='#/lignes/<%= id %>'><%= nom %></a>"),
    initialize: function(){
    //
    },
    render:function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }
});

var DetailsLigneView = Backbone.View.extend({
    el: "div#edit_ligne",
    initialize: function(){
        this.render();
    },
    events: {
        "click button.edit": function(){
            this.editClick();
        },
        "click button.delete": function(){
            this.deleteClick();
        },
        "click ul#traceLigne a": function(e){
            //console.log($(this).data("id"));
            e.preventDefault();
            if(window.confirm("Voulez-vous enlever la station "+$(e.currentTarget).text())){
                var id = $(e.currentTarget).data("id");
                var index = $(e.currentTarget).data("index");
                var tabStations = this.model.get("stations");
                tabStations.splice(index,1);
                this.render();//pour maj les index, etc...
            }
        }
    },
    render:function(){
        var template = _.template( $("#ligne_template").html(), this.model.toJSON() );
        this.$el.html( template );
        //color picker init
        var myPicker = new jscolor.color(document.getElementById('colorPicker'), {})
        myPicker.fromString(this.model.get("couleur"));  // now you can access API via 'myPicker' variable
        //affichage de la liste des stations
        tabStations = this.model.get("stations");
        htmlStations ="";
        var index=0;
        tabStations.forEach(function(s){
            htmlStations+="<li><a data-index='"+index+"' data-id='"+s.id+"' href='#'>"+s.nom+"</a></li>";
            index++;
        });
        $("ul#traceLigne").html(htmlStations);
        //drag & drop
        $( "ul#traceLigne" ).sortable({
            update:function(){
                var t=app.detailsLigne.model.get("stations");
                $("ul#traceLigne li a").each(function(index,item){
                    for(i in t)
                        if(t[i].id==$(this).data("id"))
                            t[i].position = (index+1);
                });
            }
        });
        $( "ul#traceLigne" ).disableSelection();
        if(app.stationView)
            app.stationView.$el.find('button.addtoligne').removeAttr("disabled");
    },
    editClick: function(){
        var details = {
            nom: this.$el.find('input[name="nom"]').val(),
            description: this.$el.find('textarea[name="description"]').val(),
            couleur: this.$el.find('input[name="couleur"]').val(),
            visible: parseInt(this.$el.find('input[name="visible"]').val()),
            numero: parseInt(this.$el.find('input[name="numero"]').val())
        }
        this.model.saveDetails(details);
    },
    deleteClick: function(){
        this.model.deleteLigne();
    },
    close:function () {
        $(this.el).unbind();
        $(this.el).empty();
    }
});

var ReseauView = Backbone.View.extend({
    el : "ul#liste_lignes",
    initialize: function(){
        //_.bindAll(this);//for loss of context
        this.collection.on("all",this.render,this);
    },
    render: function(){
        this.addAll()
        return this;
    },
    addAll: function(){
        this.$el.empty();
        this.collection.forEach(this.addOne, this);
    },
    addOne: function(ligne){
        var ligneView = new LigneView({
            model: ligne
        });
        this.$el.append(ligneView.render().el);
    }
});


////////////////////////
// ROUTER
var AppRouter = Backbone.Router.extend({
    routes:{
        "":"home",
        "lignes/:id":"showDetailsLigne",
        "add/ligne":"addLigne"
    },
    initialize:function(){
        this.reseau = new Reseau();
        this.reseauView = new ReseauView({
            collection: this.reseau
        });        

        //typeahead
        this.allStations = new ListeStations();
        this.allStations.fetch({
            success:function(){
                if(app.allStations)
                    $( '.typeahead' ).typeahead( {
                        source : app.allStations.pluck( 'nom' ),
                        updater: function(selection){
                            var tmp = app.allStations.filter(function(item){
                                return item.get("nom") == selection;
                            });
                            app.station = tmp[0];
                            if(app.stationView) app.stationView.close();
                            app.stationView = new StationView({
                                model: app.station
                                });
                        }
                    } );
            }
        });
    },
    home: function(){
        if(this.detailsLigne) this.detailsLigne.close();
        if(this.stationView) this.stationView.close();
        
        this.reseau.fetch();
    },
    showDetailsLigne:function(id){
        //TODO -> bug car reseau n'est pas encore defined...
        this.ligne = this.reseau.get(id);
        if(this.detailsLigne) this.detailsLigne.close();
        this.detailsLigne = new DetailsLigneView({
            model: this.ligne
        });
    },
    addLigne:function(){
        this.ligne = new Ligne();
        if(this.detailsLigne) this.detailsLigne.close();
        this.detailsLigne = new DetailsLigneView({
            model: this.ligne
        });
    }
});

//(function($){
/////////
//RUN
var app = new AppRouter();
Backbone.history.start();

//})(jQuery);