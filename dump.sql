-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: raltpdb
-- ------------------------------------------------------
-- Server version	5.5.52-0+deb7u1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lignes`
--

DROP TABLE IF EXISTS `lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(127) CHARACTER SET utf8 NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `couleur` varchar(8) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes`
--

LOCK TABLES `lignes` WRITE;
/*!40000 ALTER TABLE `lignes` DISABLE KEYS */;
INSERT INTO `lignes` VALUES (1,'Révolution',1,'La ligne des révolutionnaires de ouf','ED1C24',1),(35,'Internationale',2,'Le monde il est international man !','29ABE2',1),(37,'Résistance',3,'','F7931E',NULL),(38,'Royale',8,'defze','0071BC',1),(40,'Antique',4,'','8C6239',1),(43,'Sciences',5,'','662D91',1),(44,'Bagarres',6,'','9E005D',1),(45,'Arts & Lettres',7,'','FCD721',1),(46,'Couleurs',3,'','C99716',1),(48,'Province',0,'','5DBFC3',NULL),(51,'Cosmos',9,'','000000',NULL),(52,'Champètre',11,'','22B573',NULL),(53,'Business',9,'','006837',NULL),(54,'Sociococo',14,'','EEA4A1',NULL);
/*!40000 ALTER TABLE `lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_ligne` int(11) NOT NULL,
  `fk_station` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (44,24,1918,1),(45,24,1917,2),(1738,35,1789,2),(1739,35,1838,3),(1740,35,1811,4),(1741,35,1622,4),(1742,35,1639,5),(1743,35,1986,6),(1744,35,1915,7),(1745,35,1804,8),(1746,35,1670,9),(1747,35,1984,10),(1748,35,51923,11),(1749,35,1627,12),(1750,35,1894,13),(1751,35,1900,14),(1752,35,1864,15),(1917,54,1806,1),(1918,54,1831,2),(1919,54,1865,3),(1920,54,1851,4),(1921,54,22443,5),(1922,54,1807,6),(1923,54,1949,7),(1924,54,1798,8),(1925,54,5606,9),(1926,54,1650,10),(1927,54,1889,11),(1928,54,1829,12),(1929,54,2018,13),(1995,48,2006,1),(1996,48,1631,2),(1997,48,1661,3),(1998,48,1644,4),(1999,48,1635,5),(2000,48,1852,6),(2001,48,1628,7),(2002,48,1963,8),(2003,48,55330,9),(2004,48,1839,10),(2005,48,54244,11),(2006,48,1720,12),(2007,52,1860,1),(2008,52,57293,2),(2009,52,57295,3),(2010,52,1872,4),(2011,52,1706,5),(2012,52,142790,6),(2013,52,1737,7),(2014,52,1736,8),(2015,52,1958,9),(2016,52,2003,10),(2017,52,136246,13),(2018,52,1848,14),(2019,52,1768,15),(2158,37,136241,1),(2159,37,1889,2),(2160,37,1952,3),(2161,37,1953,4),(2162,37,22443,5),(2163,37,1851,6),(2164,37,1859,7),(2165,37,1972,8),(2166,37,1888,9),(2167,37,433651,10),(2168,37,142789,11),(2169,37,142785,12),(2184,46,1860,1),(2185,46,1635,2),(2186,46,2009,3),(2187,46,1960,4),(2188,46,51923,5),(2189,46,1806,6),(2190,46,1736,7),(2191,46,1958,8),(2192,46,1715,9),(2193,46,1820,11),(2194,46,1968,12),(2195,40,5600,1),(2196,40,1949,2),(2197,40,1885,3),(2198,40,1632,4),(2199,40,1770,5),(2200,40,1969,6),(2201,40,1738,7),(2202,40,1670,8),(2203,40,1634,9),(2204,40,171507,10),(2205,43,1997,1),(2206,43,1781,2),(2207,43,1751,3),(2208,43,1660,4),(2209,43,1944,6),(2210,43,1788,7),(2211,43,1866,8),(2212,43,1711,9),(2213,43,1676,10),(2214,43,1779,11),(2215,43,1735,12),(2216,43,1666,13),(2217,43,1879,14),(2218,43,1931,15),(2219,44,1850,1),(2220,44,1658,2),(2221,44,51923,3),(2222,44,1627,4),(2223,44,1894,5),(2224,44,1937,6),(2225,44,1673,7),(2226,44,1838,8),(2227,44,1941,9),(2228,44,1981,10),(2229,44,1622,11),(2230,44,1909,12),(2231,44,5601,13),(2232,44,1858,14),(2233,44,1639,15),(2234,44,5600,16),(2235,44,2007,17),(2236,45,1860,1),(2237,45,1836,2),(2238,45,1837,3),(2239,45,1994,4),(2240,45,2012,5),(2241,45,1648,6),(2242,45,1990,7),(2243,45,1826,8),(2244,45,1982,9),(2245,45,1787,10),(2246,45,228266,11),(2247,45,142795,12),(2248,45,2010,13),(2249,45,2011,14),(2250,45,1849,15),(2251,45,1657,16),(2252,45,1978,17),(2253,45,1917,18),(2254,45,1662,19),(2255,45,1649,20),(2256,45,1910,21),(2257,45,1918,22),(2258,45,136237,23),(2259,38,1846,1),(2260,38,1774,2),(2261,38,1809,3),(2262,38,1893,4),(2263,38,1784,5),(2264,38,1962,6),(2265,38,1800,7),(2266,38,1713,8),(2267,38,1720,9),(2268,38,2020,10),(2269,38,1732,11),(2270,51,5600,1),(2271,51,1953,2),(2272,51,142805,3),(2287,1,1746,1),(2288,1,1887,2),(2289,1,1643,3),(2290,1,1989,4),(2291,1,1885,5),(2292,1,1744,6),(2293,1,1679,7),(2294,1,2000,8),(2295,1,1788,9),(2296,1,1761,10),(2297,1,1803,11),(2298,1,1667,12),(2327,53,1850,1),(2328,53,228266,2),(2329,53,1852,3),(2330,53,1795,4),(2331,53,1930,5),(2332,53,1801,6),(2333,53,1914,7),(2334,53,1769,8),(2335,53,1664,9),(2336,53,1933,10),(2337,53,1800,11),(2338,53,2017,12),(2339,53,302757,13),(2340,53,1862,14);
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `nom` varchar(127) NOT NULL,
  `wikipedia` varchar(127) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433656 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1620,48.9355,2.53441,'Sevran Livry','',''),(1621,48.8946,2.34709,'Simplon','http://fr.wikipedia.org/wiki/Col_du_Simplon','Description de la station...'),(1622,48.8586,2.32268,'Solférino','',''),(1624,48.8063,2.47211,'Saint-Maur Créteil','',''),(1626,48.7031,2.07107,'Saint-Rémy-lès-Chevreuse','',''),(1627,48.8843,2.36708,'Stalingrad','',''),(1628,48.8692,2.3541,'Strasbourg-Saint-Denis','',''),(1629,48.7711,2.50784,'Sucy Bonneuil','',''),(1630,48.851,2.36187,'Sully-Morland','',''),(1631,48.8468,2.30782,'Ségur','',''),(1632,48.8512,2.32587,'Sèvres-Babylone','',''),(1633,48.8451,2.31018,'Sèvres-Lecourbe','',''),(1634,48.8664,2.36108,'Temple','',''),(1635,48.8781,2.29803,'Ternes','',''),(1636,48.8265,2.35724,'Tolbiac','',''),(1637,48.8395,2.65577,'Torcy','',''),(1638,48.8765,2.33306,'Trinité-d\'Estienne d\'Orves','',''),(1639,48.863,2.28702,'Trocadéro','',''),(1640,48.8645,2.33031,'Tuileries','',''),(1642,48.8533,2.48744,'Val de Fontenay','',''),(1643,48.8489,2.32193,'Vaneau','',''),(1644,48.8575,2.31553,'Varenne','',''),(1645,48.8396,2.30098,'Vaugirard (Adolphe Chérioux)','',''),(1646,48.842,2.329,'Vavin','',''),(1647,48.9446,2.56669,'Vert-Galant','',''),(1648,48.8697,2.28527,'Victor Hugo','',''),(1649,48.787,2.36697,'Villejuif-Louis Aragon','',''),(1650,48.8042,2.36394,'Villejuif-Léo Lagrange','http://fr.wikipedia.org/wiki/L%C3%A9o_Lagrange',''),(1651,48.7959,2.36797,'Villejuif-Paul Vaillant Couturier (Hôpital Paul Brousse)','',''),(1652,48.9534,2.60231,'Villeparisis','',''),(1653,48.9627,2.51221,'Villepinte','',''),(1654,48.8811,2.31527,'Villiers','',''),(1655,48.8472,2.43107,'Vincennes','',''),(1656,48.8417,2.30804,'Volontaires','',''),(1657,48.8579,2.37988,'Voltaire (Léon Blum)','',''),(1658,48.8839,2.30465,'Wagram','http://fr.wikipedia.org/wiki/Bataille_de_Wagram',''),(1659,48.8554,2.26998,'Ranelagh','',''),(1660,48.839,2.33058,'Raspail','',''),(1661,48.8481,2.32808,'Rennes','',''),(1662,48.8472,2.38612,'Reuilly-Diderot','',''),(1664,48.8609,2.3721,'Richard-Lenoir','https://fr.wikipedia.org/wiki/Richard_Lenoir',''),(1665,48.872,2.33909,'Richelieu-Drouot','',''),(1666,48.8881,2.37449,'Riquet','',''),(1667,48.8556,2.42356,'Robespierre','',''),(1668,48.7804,2.28117,'Robinson','',''),(1669,49.011,2.56323,'Aeroport Charles de Gaulle 1','',''),(1670,48.8825,2.32098,'Rome','',''),(1671,48.8714,2.3432,'Grands Boulevards','',''),(1672,48.8641,2.27763,'Rue de la Pompe (Avenue Georges Mandel)','',''),(1673,48.8521,2.38914,'Rue des Boulets','',''),(1674,48.8558,2.32557,'Rue du Bac','',''),(1675,48.8872,2.17091,'Rueil-Malmaison','',''),(1676,48.8663,2.35204,'Réaumur-Sébastopol','',''),(1679,48.8675,2.36367,'République','https://fr.wikipedia.org/wiki/R%C3%A9publique',''),(1680,48.8612,2.3741,'Saint-Ambroise','',''),(1681,48.8747,2.32043,'Saint-Augustin','',''),(1684,48.872,2.40486,'Saint-Fargeau','',''),(1685,48.8519,2.31403,'Saint-Francois-Xavier','',''),(1686,48.8785,2.33759,'Saint-Georges','',''),(1687,48.8535,2.33237,'Saint-Germain des Prés','',''),(1688,48.8333,2.33622,'Saint-Jacques','',''),(1689,48.8756,2.32619,'Saint-Lazare','',''),(1690,48.8463,2.41867,'Saint-Mandé','',''),(1691,48.8395,2.36141,'Saint-Marcel','',''),(1693,48.864,2.38007,'Rue Saint-Maur','',''),(1694,48.8533,2.34347,'Saint-Michel','',''),(1695,48.8551,2.36065,'Saint-Paul (Le Marais)','',''),(1696,48.8722,2.30982,'Saint-Philippe du Roule','',''),(1697,48.8466,2.32693,'Saint-Placide','',''),(1698,48.8508,2.33087,'Saint-Sulpice','',''),(1699,48.8613,2.36702,'Saint-Sébastien-Froissart','',''),(1700,48.9379,2.1572,'Sartrouville','',''),(1701,48.7814,2.2972,'Sceaux','',''),(1702,48.8674,2.34661,'Sentier','',''),(1703,48.9475,2.52483,'Sevran-Beaudottes','',''),(1705,48.8318,2.31407,'Plaisance','',''),(1706,48.8773,2.34961,'Poissonnière','',''),(1707,48.9329,2.04151,'Poissy','',''),(1708,48.8971,2.28049,'Pont de Levallois-Bécon','',''),(1709,48.8845,2.25989,'Pont de Neuilly','',''),(1710,48.8296,2.23025,'Pont de Sèvres','',''),(1711,48.8533,2.35746,'Pont Marie (Cité des Arts)','',''),(1712,48.8584,2.34195,'Pont Neuf','',''),(1713,48.839,2.33704,'Port Royal','',''),(1714,48.8716,2.27665,'Porte Dauphine (Maréchal de Lattre de Tassigny)','',''),(1715,48.8354,2.40602,'Porte Dorée','',''),(1716,48.878,2.28184,'Porte Maillot','',''),(1717,48.8481,2.25865,'Porte d\'Auteuil','',''),(1718,48.8189,2.35986,'Porte d\'Italie','',''),(1719,48.8213,2.36909,'Porte d\'Ivry','',''),(1720,48.8226,2.32481,'Porte d\'Orléans (Général Leclerc)','',''),(1721,48.8644,2.408,'Porte de Bagnolet','',''),(1722,48.8856,2.29274,'Porte de Champerret','',''),(1723,48.8325,2.3997,'Porte de Charenton','',''),(1724,48.8201,2.36435,'Porte de Choisy','',''),(1725,48.8944,2.31374,'Porte de Clichy','',''),(1726,48.8973,2.34478,'Porte de Clignancourt','',''),(1727,48.8535,2.41043,'Porte de Montreuil','',''),(1728,48.8883,2.39147,'Porte de Pantin','',''),(1729,48.8379,2.2568,'Porte de Saint-Cloud','',''),(1730,48.8973,2.32884,'Porte de Saint-Ouen','',''),(1731,48.8277,2.30534,'Porte de Vanves','',''),(1732,48.8325,2.288,'Porte de Versailles','',''),(1733,48.8473,2.40888,'Porte de Vincennes','',''),(1734,48.8981,2.35909,'Porte de la Chapelle','',''),(1735,48.8978,2.38581,'Porte de la Villette','',''),(1736,48.8771,2.40639,'Porte des Lilas','',''),(1737,48.8799,2.39908,'Pré-Saint-Gervais','',''),(1738,48.8669,2.33367,'Pyramides','',''),(1740,48.8846,2.29752,'Péreire','',''),(1741,48.8626,2.38672,'Père-Lachaise','',''),(1742,48.8374,2.37378,'Quai de la Gare','',''),(1743,48.8458,2.36704,'Quai de la Rapée','',''),(1744,48.8694,2.33574,'Quatre Septembre','http://fr.wikipedia.org/wiki/Quatre-Septembre',''),(1745,48.8614,2.3535,'Rambuteau','',''),(1746,48.8473,2.27341,'Mirabeau','',''),(1747,48.8737,2.3152,'Miromesnil','',''),(1748,48.976,2.64254,'Mitry-Claye','',''),(1749,48.8806,2.30897,'Monceau','',''),(1750,48.8442,2.3898,'Montgallet','',''),(1751,48.843,2.32263,'Montparnasse-Bienvenue','',''),(1753,48.8313,2.32943,'Mouton-Duvernet','',''),(1754,48.8659,2.38339,'Ménilmontant','',''),(1755,48.8954,2.2234,'Nanterre-Préfecture','',''),(1756,48.9013,2.21569,'Nanterre-Université','',''),(1757,48.8953,2.19581,'Nanterre-Ville','',''),(1758,48.8485,2.39591,'Nation','',''),(1759,48.8483,2.39595,'Nation','',''),(1761,48.8327,2.36205,'Nationale','',''),(1762,48.8534,2.51352,'Neuilly-Plaisance','',''),(1763,48.835,2.47217,'Nogent-sur-Marne','',''),(1764,48.8435,2.61663,'Noisiel','',''),(1765,48.8427,2.57801,'Noisy-Champs','',''),(1766,48.8411,2.54794,'Noisy-le-Grand (Mont d\'Est)','',''),(1767,48.8766,2.33845,'Notre-Dame de Lorette','',''),(1768,48.8449,2.32885,'Notre-Dame des Champs','',''),(1769,48.8645,2.36867,'Oberkampf','',''),(1770,48.8522,2.33856,'Odéon','',''),(1771,48.8707,2.33181,'Opéra','',''),(1772,48.6975,2.18237,'Orsay-Ville','',''),(1773,48.887,2.38603,'Ourcq','',''),(1774,48.8628,2.33582,'Palais-Royal (Musée du Louvre)','',''),(1775,48.718,2.24646,'Palaiseau','',''),(1776,48.7079,2.23737,'Palaiseau Villebon','',''),(1777,48.9736,2.51436,'Parc des Expositions','',''),(1778,48.7707,2.31032,'Parc de Sceaux','',''),(1779,48.8652,2.37585,'Parmentier','',''),(1780,48.8576,2.28587,'Passy','',''),(1781,48.8429,2.31266,'Pasteur','',''),(1782,48.8685,2.40135,'Pelleport','',''),(1783,48.8338,2.31766,'Pernéty','',''),(1784,48.8584,2.38939,'Philippe Auguste','',''),(1785,48.8453,2.40126,'Picpus','',''),(1786,48.8157,2.37729,'Pierre et Marie Curie','',''),(1787,48.8826,2.33779,'Pigalle','',''),(1788,48.8432,2.35218,'Place Monge (Jardin des Plantes)','',''),(1789,48.8314,2.35572,'Place d\'Italie','',''),(1790,48.8836,2.32731,'Place de Clichy','',''),(1792,48.8768,2.39347,'Place des Fêtes','',''),(1793,48.8104,2.36161,'Le Kremlin-Bicêtre','',''),(1794,48.8051,2.48575,'Le Parc de Saint-Maur','',''),(1795,48.8749,2.3398,'Le Peletier','',''),(1798,48.8512,2.37595,'Ledru-Rollin','http://fr.wikipedia.org/wiki/Ledru-Rollin',''),(1799,48.7395,2.28733,'Les Baconnets','',''),(1800,48.8366,2.35164,'Les Gobelins','https://fr.wikipedia.org/wiki/Manufacture_des_Gobelins',''),(1801,48.8622,2.34584,'Les Halles','',''),(1802,48.8809,2.27254,'Les Sablons (Jardin d\'acclimatation)','',''),(1803,48.8258,2.40693,'Liberté','',''),(1804,48.8796,2.32652,'Liège','',''),(1805,48.8391,2.63376,'Lognes','',''),(1806,48.881,2.36556,'Louis Blanc','',''),(1807,48.8888,2.28814,'Louise Michel','',''),(1808,48.8385,2.28176,'Lourmel','',''),(1809,48.8605,2.341,'Louvre-Rivoli','',''),(1810,48.7062,2.21133,'Lozère','',''),(1811,48.8459,2.34061,'Luxembourg','',''),(1812,48.8528,2.33541,'Mabillon','',''),(1813,48.8701,2.32516,'Madeleine','',''),(1814,48.8248,2.2735,'Mairie d\'Issy','',''),(1815,48.8112,2.38381,'Mairie d\'Ivry','',''),(1816,48.9037,2.30557,'Mairie de Clichy','',''),(1817,48.8624,2.44166,'Mairie de Montreuil','',''),(1818,48.9121,2.33416,'Mairie de Saint-Ouen','',''),(1819,48.8798,2.41624,'Mairie des Lilas','',''),(1820,48.8226,2.35819,'Maison Blanche','',''),(1823,48.9458,2.14417,'Maisons-Laffitte','',''),(1826,48.8828,2.30969,'Malesherbes','',''),(1828,48.8909,2.34984,'Marcadet-Poissonniers','',''),(1829,48.8339,2.24408,'Marcel Sembat','http://fr.wikipedia.org/wiki/Marcel_Sembat',''),(1830,48.8714,2.78309,'Marne-la-Vallée Chessy','',''),(1831,48.8903,2.36021,'Marx-Dormoy','',''),(1832,48.7245,2.25881,'Massy-Palaiseau','',''),(1833,48.7349,2.27344,'Massy-Verrières','',''),(1834,48.8499,2.3485,'Maubert-Mutualité','',''),(1835,48.8367,2.40297,'Michel Bizot','',''),(1836,48.8477,2.2643,'Michel-Ange-Auteuil','',''),(1837,48.8449,2.26205,'Michel-Ange-Molitor','',''),(1838,48.8431,2.36431,'Gare d\'Austerlitz','',''),(1839,48.8447,2.37407,'Gare de Lyon','',''),(1840,48.8448,2.37407,'Gare de Lyon','',''),(1841,48.8761,2.35792,'Gare de l\'Est (Verdun)','',''),(1842,48.88,2.3547,'Gare du Nord','',''),(1843,48.88,2.35455,'Gare du Nord','',''),(1844,48.906,2.33173,'Garibaldi','',''),(1845,48.8156,2.34074,'Gentilly','',''),(1846,48.872,2.30046,'George V','',''),(1847,48.6985,2.13695,'Gif-sur-Yvette','',''),(1848,48.8314,2.34394,'Glacière','',''),(1849,48.8697,2.37127,'Goncourt (Hôpital Saint-Louis)','',''),(1850,48.8919,2.23788,'La Défense (Grande Arche)','https://fr.wikipedia.org/wiki/La_D%C3%A9fense',''),(1851,48.8925,2.32723,'Guy-Môquet','',''),(1852,48.8733,2.32851,'Havre-Caumartin','https://fr.wikipedia.org/wiki/Antoine-Louis_Lefebvre_de_Caumartin',''),(1853,48.8913,2.4032,'Hoche','',''),(1854,48.9206,2.18501,'Houilles Carrières-sur-Seine','',''),(1855,48.8568,2.35149,'Hôtel de Ville','',''),(1857,48.8617,2.31436,'Invalides','',''),(1858,48.8645,2.2938,'Iéna','',''),(1859,48.871,2.36054,'Jacques-Bonsergent','',''),(1860,48.8523,2.26791,'Jasmin','',''),(1861,48.8825,2.37023,'Jaurès','',''),(1862,48.8461,2.27846,'Javel-André-Citroen','',''),(1863,48.821,2.46386,'Joinville-le-Pont','',''),(1864,48.8752,2.38919,'Jourdain','',''),(1865,48.8925,2.34446,'Jules Joffrin','',''),(1866,48.8458,2.35469,'Jussieu','',''),(1867,48.8711,2.29308,'Kléber','',''),(1868,48.884,2.3585,'La Chapelle','',''),(1869,48.9209,2.41046,'La Courneuve-8-Mai-1945','',''),(1870,48.762,2.30411,'La Croix-de-Berny','',''),(1871,48.8919,2.23778,'La Défense (Grande Arche)','',''),(1872,48.8874,2.32604,'La Fourche','',''),(1873,48.695,2.15338,'La Hacquinière','',''),(1874,48.8492,2.29795,'La Motte-Picquet-Grenelle','',''),(1876,48.8579,2.27412,'La Muette','',''),(1877,48.9178,2.3617,'La Plaine-Stade de France','',''),(1878,48.7948,2.51292,'La Varenne-Chennevières','',''),(1879,48.8898,2.33889,'Lamarck-Caulaincourt','',''),(1880,48.8079,2.3335,'Laplace','',''),(1882,48.885,2.3796,'Laumière','',''),(1883,48.9309,2.42587,'Le Bourget','',''),(1884,48.7047,2.19178,'Le Guichet','',''),(1885,48.8662,2.3233,'Concorde','',''),(1887,48.8375,2.2969,'Convention','',''),(1888,48.8949,2.38245,'Corentin-Cariou','',''),(1889,48.8272,2.27931,'Corentin-Celton','http://fr.wikipedia.org/wiki/Corentin_Celton',''),(1890,48.8296,2.34944,'Corvisart','',''),(1891,48.7002,2.09936,'Courcelle-sur-Yvette','',''),(1892,48.8792,2.30361,'Courcelles','',''),(1893,48.869,2.37987,'Couronnes','',''),(1894,48.8907,2.37682,'Crimée','',''),(1896,48.8579,2.4361,'Croix-de-Chavaux (Jacques Duclos)','',''),(1897,48.7965,2.44906,'Créteil-L\'Echat (Hôpital Henri Mondor)','',''),(1898,48.7797,2.45914,'Créteil-Préfecture (Hôtel de Ville)','',''),(1899,48.7894,2.45145,'Créteil-Université','',''),(1900,48.882,2.3927,'Danube','',''),(1901,48.8394,2.39585,'Daumesnil (Félix Eboué)','',''),(1902,48.8336,2.33189,'Denfert-Rochereau','',''),(1904,48.8336,2.33189,'Denfert-Rochereau','',''),(1905,48.933,2.45519,'Drancy','',''),(1906,48.8389,2.38895,'Dugommier','',''),(1907,48.8508,2.29277,'Dupleix','',''),(1908,48.8468,2.31672,'Duroc','',''),(1909,48.8545,2.30554,'Ecole Militaire','',''),(1910,48.8403,2.32617,'Edgar-Quinet','',''),(1911,48.8472,2.2689,'Eglise d\'Auteuil','',''),(1912,48.8931,2.41329,'Eglise de Pantin','',''),(1913,48.8878,2.25044,'Esplanade de la Défense','',''),(1914,48.8635,2.34867,'Etienne Marcel','',''),(1915,48.8787,2.32282,'Europe','',''),(1916,48.8424,2.25974,'Exelmans','',''),(1917,48.8502,2.38427,'Faidherbe-Chaligny','',''),(1918,48.8446,2.3175,'Falguière','',''),(1919,48.8633,2.36645,'Filles du Calvaire','',''),(1920,48.7438,2.29699,'Fontaine-Michalon','',''),(1921,48.7877,2.29164,'Fontenay-aux-Roses','',''),(1922,48.8438,2.46465,'Fontenay-sous-Bois','',''),(1923,48.9147,2.40418,'Fort d\'Aubervilliers','',''),(1924,48.8693,2.30831,'Franklin-Roosevelt','',''),(1925,48.843,2.292,'Félix Faure','',''),(1927,48.8385,2.32258,'Gaité','',''),(1928,48.8633,2.41568,'Gallieni (Parc de Bagnolet)','',''),(1929,48.8648,2.39846,'Gambetta','',''),(1930,48.8688,2.34123,'Bourse','',''),(1931,48.8904,2.32003,'Brochant','',''),(1932,48.8443,2.52619,'Bry-sur-Marne','',''),(1933,48.8565,2.37094,'Bréguet-Sabin','http://fr.wikipedia.org/wiki/Abraham_Breguet',''),(1934,48.6959,2.16312,'Bures-sur-Yvette','',''),(1935,48.8369,2.70934,'Bussy-Saint-Georges','',''),(1936,48.8778,2.38113,'Buttes-Chaumont','',''),(1937,48.8517,2.40102,'Buzenval','',''),(1938,48.8453,2.42924,'Bérault','',''),(1939,48.8755,2.34306,'Cadet','',''),(1940,48.8475,2.30181,'Cambronne','',''),(1941,48.8358,2.35815,'Campo-Formio','',''),(1942,48.8464,2.35148,'Cardinal-Lemoine','',''),(1944,48.8405,2.35143,'Censier-Daubenton','',''),(1948,48.8069,2.51014,'Champigny','',''),(1949,48.8674,2.31396,'Champs-Elysées-Clémenceau','',''),(1950,48.8447,2.26654,'Chardon-Lagache','',''),(1951,48.8214,2.41407,'Charenton-Ecoles','',''),(1952,48.8463,2.28633,'Charles Michels','',''),(1953,48.8744,2.29576,'Charles de Gaulle-Etoile','',''),(1954,48.8741,2.29483,'Charles de Gaulle-Etoile','',''),(1955,48.8548,2.38527,'Charonne','',''),(1956,48.8853,2.15515,'Chatou-Croissy','',''),(1957,48.8729,2.3335,'Chaussée d\'Antin (La Fayette)','',''),(1958,48.8576,2.36793,'Chemin Vert','',''),(1959,48.8344,2.36717,'Chevaleret','',''),(1960,48.8872,2.34983,'Château Rouge','',''),(1961,48.8726,2.35547,'Château d\'Eau','',''),(1962,48.8445,2.43951,'Château de Vincennes','',''),(1963,48.8783,2.3623,'Château Landon','',''),(1964,48.8585,2.34712,'Châtelet','',''),(1967,48.8611,2.34663,'Chatelet-Les Halles','',''),(1968,48.8103,2.30125,'Châtillon Montrouge','',''),(1969,48.8553,2.34676,'Cité','',''),(1970,48.82,2.34098,'Cité Universitaire','',''),(1972,48.8779,2.37015,'Colonel Fabien','',''),(1973,48.8448,2.29335,'Commerce','',''),(1975,48.8844,2.33871,'Abbesses','',''),(1978,48.8562,2.39499,'Alexandre-Dumas','',''),(1980,48.8646,2.30088,'Alma-Marceau','',''),(1981,48.8284,2.32675,'Alésia','',''),(1982,48.8925,2.28537,'Anatole-France','',''),(1983,48.755,2.3012,'Antony','',''),(1984,48.8831,2.34397,'Anvers','',''),(1985,48.799,2.32783,'Arcueil-Cachan','',''),(1986,48.8755,2.28932,'Argentine','',''),(1988,48.8653,2.35638,'Arts-et-Métiers','',''),(1989,48.8609,2.32063,'Assemblée Nationale','',''),(1990,48.8728,2.3298,'Auber','',''),(1991,48.9239,2.38451,'La Courneuve-Aubervilliers','',''),(1992,48.9038,2.39202,'Aubervilliers Pantin (4 Chemins)','',''),(1993,48.9317,2.49379,'Aulnay-sous-Bois','',''),(1994,48.847,2.29494,'Avenue Emile-Zola','',''),(1995,48.851,2.39798,'Avron','',''),(1996,48.7935,2.32113,'Bagneux','',''),(1997,48.8363,2.27822,'Balard','',''),(1999,48.8836,2.34974,'Barbès-Rochechouart','',''),(2000,48.8528,2.36918,'Bastille','https://fr.wikipedia.org/wiki/Bastille',''),(2003,48.8419,2.40121,'Bel-Air','',''),(2004,48.872,2.37681,'Belleville','',''),(2005,48.8404,2.37958,'Bercy','',''),(2006,48.8319,2.23811,'Billancourt','',''),(2007,48.8543,2.28878,'Bir-Hakeim (Grenelle)','',''),(2008,48.9323,2.47732,'Blanc-Mesnil','',''),(2009,48.8837,2.33167,'Blanche','',''),(2010,48.907,2.44962,'Bobigny-Pablo-Picasso','',''),(2011,48.8953,2.4248,'Bobigny-Pantin (Raymond Queneau)','',''),(2012,48.867,2.29047,'Boissière','',''),(2013,48.7531,2.50526,'Boissy-Saint-Léger','',''),(2014,48.8806,2.37398,'Bolivar','',''),(2015,48.8706,2.34868,'Bonne Nouvelle','',''),(2016,48.8793,2.38873,'Botzaris','',''),(2017,48.8412,2.28763,'Boucicaut','http://fr.wikipedia.org/wiki/Aristide_Boucicaut',''),(2018,48.8422,2.23884,'Boulogne-Jean-Jaurès','',''),(2019,48.8408,2.22821,'Boulogne Pont de Saint-Cloud','',''),(2020,48.7801,2.31228,'Bourg-la-Reine','',''),(2021,48.8844,2.3434,'Funiculaire Gare basse','',''),(2022,48.8856,2.34335,'Funiculaire Gare haute','',''),(5560,48.9356,2.34577,'Saint-Denis','',''),(5561,48.964,2.37203,'Pierrefitte Stains','',''),(5562,48.9767,2.39074,'Garges-Sarcelles','',''),(5563,48.994,2.41617,'Villiers-le-Bel (Gonesse - Arnouville)','',''),(5564,49.0238,2.46306,'Goussainville','',''),(5565,49.0325,2.47664,'Les Noues','',''),(5566,49.0497,2.50173,'Louvres','',''),(5567,49.0995,2.52492,'Survilliers-Fosses','',''),(5572,49.0074,2.19836,'Montigny-Beauchamp','',''),(5573,48.9931,2.23623,'Franconville Plessis-Bouchard','',''),(5574,48.9852,2.25715,'Cernay','',''),(5575,48.9801,2.27086,'Ermont-Eaubonne','',''),(5576,48.9643,2.28448,'Saint-Gratien','',''),(5577,48.954,2.30232,'Epinay-sur-Seine','',''),(5578,48.9337,2.30725,'Gennevilliers','',''),(5579,48.9198,2.31404,'Les Grésillons','',''),(5580,48.9054,2.32233,'Saint-Ouen','',''),(5581,48.8939,2.31354,'Porte de Clichy','',''),(5584,48.8711,2.27568,'Avenue Foch','',''),(5585,48.8643,2.27217,'Avenue Henri-Martin','',''),(5586,48.8564,2.27486,'Boulainvilliers','',''),(5587,48.8533,2.28036,'Kennedy Radio-France','',''),(5588,48.7878,2.04539,'Saint-Quentin-en-Yvelines','',''),(5589,48.7988,2.07218,'Saint-Cyr','',''),(5590,48.7958,2.13673,'Versailles-Chantiers','',''),(5591,48.8007,2.12915,'Versailles-Rive Gauche','',''),(5592,48.7972,2.15358,'Porchefontaine','',''),(5593,48.8003,2.17132,'Viroflay-Rive Gauche','',''),(5594,48.7999,2.18373,'Chaville-Vélizy','',''),(5596,48.8195,2.25904,'Issy','',''),(5597,48.8295,2.26306,'Issy-Val de Seine','',''),(5598,48.8392,2.27024,'Boulevard Victor','',''),(5599,48.8462,2.27706,'Javel','',''),(5600,48.8552,2.28948,'Champ de Mars-Tour Eiffel','',''),(5601,48.8624,2.30129,'Pont de l\'alma','',''),(5602,48.8626,2.31399,'Invalides','',''),(5603,48.8604,2.326,'Musée d\'Orsay','',''),(5604,48.8527,2.34502,'Saint-Michel Notre-Dame','',''),(5605,48.8435,2.36516,'Gare d\'Austerlitz','',''),(5606,48.8302,2.37696,'Bibliotheque-Francois Mitterrand','http://fr.wikipedia.org/wiki/Mitterrand',''),(5607,48.8141,2.39111,'Ivry-sur-Seine','',''),(5608,48.8009,2.40249,'Vitry-sur-Seine','',''),(5609,48.7826,2.40776,'Les Ardoines','',''),(5610,48.7658,2.41019,'Choisy-le-Roi','',''),(5611,48.7463,2.41736,'Les Saules','',''),(5612,48.7416,2.40297,'Orly-Ville','',''),(5613,48.7469,2.37002,'Pont de Rungis Aéroport d\'Orly','',''),(5614,48.74,2.35264,'Rungis-La Fraternelle','',''),(5615,48.747,2.31501,'Chemin d\'Antony','',''),(5617,48.7396,2.42583,'Villeneuve-le-Roi','',''),(5618,48.7251,2.41888,'Ablon','',''),(5619,48.7127,2.40295,'Athis-Mons','',''),(5620,48.6884,2.38225,'Juvisy-sur-Orge','',''),(5621,48.6763,2.35229,'Savigny-sur-Orge','',''),(5622,48.6693,2.33115,'Epinay-sur-Orge','',''),(5623,48.6531,2.31431,'Sainte-Geneviève-des-Bois','',''),(5624,48.6362,2.30654,'Saint-Michel-sur-Orge','',''),(5625,48.6063,2.30215,'Brétigny-sur-Orge','',''),(5626,48.5923,2.26539,'La Norville Saint-Germain-lès-Arpajon','',''),(5628,48.586,2.24095,'Arpajon','',''),(5629,48.5822,2.22203,'Egly','',''),(5630,48.5772,2.19196,'Breuillet Bruyères-le-Châtel','',''),(5631,48.5648,2.17133,'Breuillet-Village','',''),(5632,48.5511,2.12523,'Saint-Chéron','',''),(5633,48.5357,2.06892,'Sermaise','',''),(5634,48.5339,2.00879,'Dourdan','',''),(5635,48.5649,2.29062,'Marolles-en-Hurepoix','',''),(5636,48.5335,2.29041,'Bouray','',''),(5637,48.5191,2.24924,'Lardy','',''),(5638,48.5116,2.21262,'Chamarande','',''),(5639,48.4865,2.19378,'Etréchy','',''),(5640,48.4366,2.15889,'Etampes','',''),(5641,48.4275,2.14504,'Saint-Martin d\'Etampes','',''),(5642,48.8853,2.29787,'Péreire','',''),(5643,48.8778,2.28431,'Porte Maillot','',''),(5644,48.5358,1.99408,'Dourdan-la-Forêt','',''),(8337,49.2236,2.45046,'La Borne-Blanche','',''),(8338,49.2603,2.42812,'Orry-la-Ville Coye','',''),(11037,48.7547,2.30131,'Antony','',''),(11038,48.7285,2.35872,'Orly-Ouest','',''),(11039,48.7278,2.36796,'Orly-Sud','',''),(15517,49.0494,2.03528,'Cergy-Saint-Christophe','',''),(15518,49.0362,2.0801,'Cergy-Préfecture','',''),(15519,48.9909,2.07428,'Conflans-Fin d\'Oise','',''),(15520,48.9699,2.07744,'Achères-Ville','',''),(15522,48.8984,2.09514,'Saint-Germain-en-Laye','',''),(15523,48.8984,2.12187,'Le Vésinet-Le Pecq','',''),(15524,48.89,2.1348,'Le Vésinet-Centre','',''),(16500,48.8077,2.2409,'Meudon-Val-Fleury','',''),(16502,48.6757,2.33411,'Petit-Vaux','',''),(16503,48.6848,2.31739,'Gravigny-Balizy','',''),(16504,48.7009,2.30746,'Chilly-Mazarin','',''),(16505,48.7019,2.29423,'Longjumeau','',''),(16539,49.3194,2.38923,'Chantilly-Gouvieux','',''),(16540,49.4348,2.31394,'Creil','',''),(16814,49.0484,2.01222,'Cergy-Le-Haut','',''),(16815,49.004,2.56677,'Aeroport Charles de Gaulle 2 TGV','',''),(16817,49.0143,2.0788,'Neuville-Université','',''),(20952,48.8448,2.37407,'Gare de Lyon (Banlieue)','',''),(20953,48.8019,2.42734,'Maisons-Alfort Alfortville','',''),(20954,48.7885,2.43273,'Le Vert de Maisons','',''),(20955,48.7656,2.4346,'Villeneuve-Prairie','',''),(20956,48.7464,2.43824,'Villeneuve-Triage','',''),(20957,48.729,2.446,'Villeneuve-Saint-Georges','',''),(20958,48.7087,2.41446,'Vigneux-sur-Seine','',''),(20959,48.6759,2.38613,'Viry-Châtillon','',''),(20964,48.6589,2.41504,'Ris-Orangis','',''),(20965,48.6481,2.43551,'Grand-Bourg','',''),(20966,48.6343,2.45165,'Evry Val de Seine','',''),(20967,48.653,2.39536,'Grigny-Centre','',''),(20971,48.636,2.4079,'Orangis Bois de l\'Epine','',''),(20972,48.6255,2.4287,'Evry Courcouronnes','',''),(20973,48.6225,2.45042,'Le Bras-de-Fer','',''),(20974,48.6141,2.47397,'Corbeil-Essonnes','',''),(20975,48.5863,2.4732,'Moulin-Galant','',''),(20976,48.5712,2.43348,'Mennecy','',''),(20977,48.5319,2.37123,'Ballancourt','',''),(20978,48.4805,2.35025,'La Ferté-Alais','',''),(20979,48.4346,2.37666,'Boutigny','',''),(20980,48.3923,2.39639,'Maisse','',''),(20981,48.3701,2.38919,'Buno-Gironville','',''),(20982,48.3454,2.38016,'Boigneville','',''),(20983,48.2885,2.38733,'Malesherbes','',''),(20984,48.7081,2.46201,'Montgeron Crosne','',''),(20985,48.7064,2.48325,'Yerres','',''),(20986,48.6988,2.50596,'Brunoy','',''),(20987,48.6799,2.53432,'Boussy-Saint-Antoine','',''),(20988,48.6657,2.54861,'Combs-la-Ville Quincy','',''),(20989,48.6286,2.56991,'Lieusaint Moissy','',''),(20990,48.5968,2.58377,'Savigny-le-Temple Nandy','',''),(20991,48.5655,2.59392,'Cesson','',''),(20992,48.5394,2.62426,'Le Mee','',''),(20993,48.5277,2.65511,'Melun','',''),(21582,48.8084,2.43558,'Maisons-Alfort-Stade','',''),(21583,48.8031,2.44499,'Maisons-Alfort-Les Juilliottes','',''),(22439,48.9296,2.35741,'Saint-Denis-Porte de Paris','',''),(22441,48.8147,2.297,'Malakoff-Rue Etienne Dolet','',''),(22442,48.8231,2.29702,'Malakoff-Plateau de Vanves','',''),(22443,48.9162,2.29492,'Gabriel-Péri','http://fr.wikipedia.org/wiki/Gabriel_Peri',''),(22616,48.7404,2.23112,'Igny','',''),(22617,48.7515,2.21621,'Bièvres','',''),(22618,48.7581,2.1923,'Vauboyen','',''),(22619,48.7649,2.16283,'Jouy-en-Josas','',''),(22620,48.7713,2.14708,'Petit-Jouy-les-Loges','',''),(23674,48.8152,2.42076,'Ecole Vétérinaire de Maisons-Alfort','',''),(23870,48.8832,2.23314,'PUTEAUX','',''),(23876,48.8286,2.2253,'MUSEE DE SEVRES','',''),(23877,48.8219,2.23169,'BRIMBORION','',''),(23878,48.8192,2.23997,'MEUDON SUR SEINE','',''),(23879,48.8215,2.25144,'LES MOULINEAUX','',''),(49183,48.9173,2.35084,'Stade de France-Saint-Denis','',''),(50047,48.8669,2.33367,'Pyramides','',''),(50055,48.8335,2.38761,'Cour Saint-Emilion','',''),(50399,48.9456,2.36236,'Saint-Denis-Universite','',''),(50622,48.9366,2.35941,'Basilique de Saint-Denis','',''),(51020,48.8296,2.37609,'Bibliotheque-Francois Mitterrand','',''),(51922,48.8752,2.32888,'Haussmann-Saint-Lazare','',''),(51923,48.88,2.35799,'Magenta','',''),(51924,48.8976,2.39985,'Pantin','',''),(51925,48.8961,2.4597,'Noisy-le-Sec','',''),(51926,48.8946,2.47786,'Bondy','',''),(51927,48.8895,2.51053,'Le Raincy Villemomble Montfermeil','',''),(51928,48.8834,2.52645,'Gagny','',''),(51930,48.8741,2.58273,'Chelles Gournay','',''),(51931,48.8825,2.48136,'Rosny-Bois-Perrier','',''),(51932,48.8705,2.48555,'Rosny-sous-Bois','',''),(51933,48.8385,2.49355,'Nogent Le-Perreux','',''),(51934,48.8248,2.51072,'Les Boullereaux Champigny','',''),(51935,48.823,2.54103,'Villiers-sur-Marne Plessis-Trévise','',''),(53960,48.8552,2.77459,'Val d\'europe','',''),(54086,49.0469,2.09599,'Pontoise','',''),(54087,49.045,2.10697,'Saint-Ouen-l\'Aumône','',''),(54088,49.0195,2.1536,'Pierrelaye','',''),(54166,48.8574,2.3096,'La Tour-Maubourg','',''),(54244,48.851,2.34522,'Cluny-La Sorbonne','',''),(54339,48.8768,2.55244,'Le Chênay Gagny','',''),(55329,48.8754,2.39859,'Telegraphe','',''),(55330,48.8739,2.38489,'Pyrenees','',''),(55372,48.8527,2.40623,'Maraichers','',''),(55488,49.0347,2.12771,'Saint-Ouen-l\'Aumone-Liesse','',''),(57288,48.8292,2.26256,'ISSY-VAL DE SEINE-RER','',''),(57291,48.8432,2.22179,'PARC DE SAINT CLOUD','',''),(57292,48.8514,2.2207,'LES MILONS','',''),(57293,48.8567,2.22035,'Les Coteaux','',''),(57294,48.868,2.2214,'SURESNES-LONGCHAMP','',''),(57295,48.8765,2.22603,'Belvédère','',''),(57296,48.8918,2.23622,'LA DEFENSE-METRO-RER-GRANDE ARCHE','',''),(57356,48.824,2.2592,'JACQUES HENRI LARTIGUE','',''),(57998,48.8233,2.57922,'Les Yvris Noisy-le-Grand','',''),(57999,48.8059,2.61764,'Emerainville Pontault-Combault','',''),(58000,48.7956,2.64961,'Roissy-en-Brie','',''),(58001,48.7732,2.68858,'Ozoir-la-Ferrière','',''),(58002,48.7449,2.72884,'Gretz-Armainvilliers','',''),(58003,48.7398,2.75795,'Tournan','',''),(109708,48.6061,2.46348,'Essonnes-Robinson','',''),(109709,48.5931,2.4614,'Villabé','',''),(109710,48.5731,2.48003,'Le Plessis-Chenet-IBM','',''),(109711,48.5662,2.49295,'Coudray-Montceaux','',''),(109712,48.5646,2.54281,'Saint-Fargeau','',''),(109713,48.5352,2.54382,'Ponthierry Pringy','',''),(109714,48.5299,2.57204,'Boissise-le-Roi','',''),(109715,48.5134,2.61252,'Vosves','',''),(136232,48.8383,2.26997,'PONT DU GARIGLIANO (HOPITAL G.POMPIDOU)','',''),(136234,48.8361,2.27778,'BALARD','',''),(136235,48.8345,2.2832,'DESNOUETTES','',''),(136236,48.8327,2.28775,'PORTE DE VERSAILLES (PARC DES EXPOSITIONS)','',''),(136237,48.8299,2.29495,'Georges Brassens','',''),(136238,48.8284,2.30162,'BRANCION','',''),(136239,48.8274,2.30631,'PORTE DE VANVES','',''),(136240,48.8259,2.31301,'DIDOT','',''),(136241,48.8244,2.31984,'Jean Moulin','',''),(136242,48.8231,2.32545,'PORTE D\'ORLEANS','',''),(136243,48.8214,2.33315,'MONTSOURIS','',''),(136244,48.8199,2.34066,'CITE UNIVERSITAIRE','',''),(136245,48.8194,2.34522,'STADE CHARLETY (PORTE DE GENTILLY)','',''),(136246,48.8207,2.35016,'Poterne des Peupliers','',''),(136247,48.819,2.35987,'PORTE D\'ITALIE','',''),(136248,48.8198,2.36431,'PORTE DE CHOISY','',''),(136249,48.8218,2.36967,'PORTE D\'IVRY','',''),(139439,48.9322,2.49365,'GARE D\'AULNAY SOUS BOIS','',''),(139440,48.9314,2.51378,'ROUGEMONT CHANTELOUP','',''),(139441,48.9269,2.51892,'GARE DE FREINVILLE SEVRAN','',''),(139442,48.9224,2.5166,'GARE DE L ABBAYE','',''),(139443,48.9177,2.51459,'LYCEE HENRY SELLIER','',''),(139444,48.9083,2.51706,'GARE DE GARGAN','',''),(139445,48.9019,2.5112,'GARE DES PAVILLONS SOUS BOIS','',''),(139446,48.8964,2.50555,'GARE D\'ALLEE DE LA TOUR RENDEZ VOUS','',''),(139447,48.8922,2.49797,'GARE DES COQUETIERS','',''),(139448,48.8928,2.48741,'LA REMISE A JORELLE','',''),(139449,48.8945,2.47899,'GARE DE BONDY','',''),(142782,48.8954,2.45947,'NOISY-LE-SEC RER','',''),(142783,48.9001,2.46506,'PETIT NOISY','',''),(142784,48.9053,2.46983,'PONT DE BONDY','',''),(142785,48.9067,2.45944,'Auguste Delaune','',''),(142786,48.9078,2.45386,'JEAN ROSTAND','',''),(142789,48.9068,2.43852,'Libération','',''),(142790,48.9098,2.4373,'La Ferme','',''),(142792,48.9147,2.43014,'GASTON ROULAUD','',''),(142793,48.9155,2.42545,'HOPITAL AVICENNE','',''),(142794,48.9178,2.41704,'DRANCY-AVENIR','',''),(142795,48.9188,2.41415,'Maurice Lachatre','',''),(142796,48.9148,2.43028,'GASTON ROULAUD','',''),(142797,48.9158,2.42571,'HOPITAL AVICENNE','',''),(142798,48.918,2.41718,'DRANCY-AVENIR','',''),(142799,48.9191,2.41427,'Maurice Lachatre','',''),(142801,48.9226,2.40659,'Danton','https://fr.wikipedia.org/wiki/Danton',''),(142802,48.9245,2.40115,'STADE GEO ANDRE','',''),(142803,48.9272,2.39277,'HOTEL DE VILLE DE LA COURNEUVE','',''),(142805,48.9316,2.37764,'Cosmonautes','',''),(142806,48.932,2.37742,'Cosmonautes','',''),(142807,48.9339,2.3702,'HOPITAL DELAFONTAINE','',''),(142808,48.9361,2.36394,'CIMETIERE DE SAINT-DENIS','',''),(142810,48.9385,2.35567,'MARCHE DE SAINT-DENIS','',''),(142811,48.9372,2.35023,'THEATRE GERARD PHILIPE','',''),(171507,48.8269,2.3673,'Olympiades','',''),(202749,48.5358,1.99408,'Dourdan-la Forêt','',''),(225436,48.9229,2.28583,'Les Agnettes','',''),(225437,48.9302,2.28407,'Asnieres-Gennevilliers Les Courtilles','',''),(226221,48.8438,2.36496,'Gare d\'Austerlitz Grandes Lignes','',''),(228266,48.9195,2.3432,'Carrefour-Pleyel','',''),(302754,48.8323,2.2875,'PORTE DE VERSAILLES-PARC DES EXPOSITIONS','',''),(302755,48.8318,2.28087,'PORTE D\'ISSY-ELIANNE JEANNIN-GARREAU','',''),(302756,48.8336,2.27628,'SUZANNE LENGLEN','',''),(302757,48.835,2.27269,'Henri Farman - Porte de Seine','',''),(341403,48.955,2.09261,'Acheres Grand Cormier','',''),(397629,48.768,2.46599,'Pointe du Lac','',''),(414501,48.8768,2.35786,'Gare de l\'Est','',''),(433649,48.9066,2.4498,'BOBIGNY - PABLO PICASSO','',''),(433650,48.9065,2.44346,'HOTEL DE VILLE DE BOBIGNY','',''),(433651,48.9132,2.43513,'Escadrille Normandie-Niemen','',''),(433652,48.9207,2.41065,'La Courneuve - 8 Mai 1945','',''),(433653,48.9301,2.38426,'la Courneuve - 6 routes','',''),(433654,48.9376,2.36182,'Basilique de Saint-Denis','',''),(433655,48.9359,2.34538,'Gare de Saint-Denis TER','','');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
