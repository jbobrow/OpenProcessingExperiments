
  size(1090, 755);
     background(217, 213, 184);
     smooth();
     



     
     
     
//weiße Fläche im Hauptmotiv
noStroke();
fill(238,228,216);
triangle(649,10,795,507,518,507);

//Dreieck links
noStroke();
fill(157,198,200);
triangle(364,186,197,359,667,450);

stroke(0);
line(364,186,197,359);
line(364,186,667,450);
line(504,260,116,366);

//farblich geteiltes Dreieck mitte
noStroke();
fill(168,124,63);
triangle(579,409,765,409,735,302);

fill(85,123,82);
quad(765,409,735,302,749,294,822,409);

//Halbkreise
fill(246,240,246);

stroke(0);
strokeWeight(2);
arc(505, 507, 90, 90, PI,2*PI);

stroke(150);
strokeWeight(3);
arc(505, 507, 87, 87, PI,2*PI);

stroke(0);
strokeWeight(2);
arc(596, 507, 90, 90, PI,2*PI);

stroke(246,228,120);
strokeWeight(3);
arc(596, 507, 87, 87, PI,2*PI);

stroke(190,78,56);
strokeWeight(2);
arc(687, 507, 90, 90, PI,2*PI);

stroke(190,78,56);
strokeWeight(3);
arc(687, 507, 87, 87, PI,2*PI);

stroke(0);
strokeWeight(2);
arc(778, 507, 90, 90, PI,2*PI);

stroke(217, 213, 184);
strokeWeight(3);
arc(778, 507, 87, 87, PI,2*PI);

stroke(0);
strokeWeight(2);
line(355,507,939,507);

//ellipseMode(CORNER);
//ellipse(465,507,90,90);
//ellipseMode(CORNER);
//ellipse(555,507,90,90);
//ellipseMode(CORNER);
//ellipse(645,507,90,90);
//ellipseMode(CORNER);
//ellipse(735,507,90,90);

//winkel bildmitte
noStroke();
fill(155,177,128);
quad(535,371,647,224,817,319,647,231);
fill(0);
quad(535,371,647,217,811,314,647,224);

//UNTERE Bögen
noFill();
stroke(180,180,173);
strokeWeight(3);
arc(560, 553, 88, 88, PI,2*PI);

noFill();
stroke(0);
strokeWeight(1);
arc(560, 553, 90, 90, PI,2*PI);

noFill();
stroke(0);
strokeWeight(1);
arc(651, 553, 90, 90, PI,2*PI);

noFill();
stroke(0);
strokeWeight(1);
arc(696, 598, 90, 90, PI,2*PI);

noFill();
stroke(180,180,146);
strokeWeight(4);
arc(741, 643, 88, 88, PI,2*PI);

noFill();
stroke(0);
strokeWeight(1);
arc(741, 643, 90, 90, PI,2*PI);

//Langer farbiger Balken

strokeWeight(1);
stroke(0);
fill(0);
quad(586,553,590,558,604,548,602,542);
fill(240);
quad(604,548,602,542,641,511,644,518);
fill(161,157,119);
quad(641,511,644,518,716,464,707,462);
fill(0);
quad(716,464,707,462,741,436,746,443);
fill(157,44,26);
quad(741,436,746,443,855,359,850,352);
fill(105,119,96);
quad(855,359,850,352,913,315,909,308);
fill(0);
quad(913,315,909,308,1033,214,1038,220);




//Kreisfigur oben links
noStroke();

fill(234,178,57);
ellipseMode(CENTER);
ellipse(213,255,110,110);

fill(212, 140, 116);
ellipseMode(CENTER);
ellipse(130,143, 266, 266);

fill(186, 36, 0);
ellipseMode(CENTER);
ellipse(213,255,85,85);

fill(25, 19, 23);
ellipseMode(CENTER);
ellipse(130,143, 223, 223);

fill(81,44,85);
ellipseMode(CENTER);
ellipse(130,143, 105,105);

//gitterfigur links.........

strokeWeight(1.3);
stroke(0);
fill(0);
quad(140,465,313,566,323,553,144,458);

//erste Reihe

fill(151,90,30);
quad(242,509,277,528,299,494,261,458);

fill(180,220,213);
quad(277,528,282,530,310,505,299,494);

fill(200);
quad(282,530,304,542,325,519,310,505);

fill(171,183,97);
quad(304,542,323,553,340,533,325,519);

//zweite Reihe
fill(220);
quad(261,458,299,494,318,468,271,433);

fill(0);
quad(299,494,310,505,334,480,318,468);

fill(230,218,170);
quad(310,505,325,519,349,492,334,480);

fill(230);
quad(325,519,340,533,364,505,349,492);

//dritte Reihe
fill(117,137,76);
quad(271,433,318,468,338,438,282,408);

fill(230,225,200);
quad(318,468,334,480,362,451,338,438);

fill(220);
quad(334,480,349,492,378,460,362,451);

fill(200,220,210);
quad(349,492,364,505,394,469,378,460);

//vierte Reihe
fill(230,225,200);
quad(282,408,338,438,352,414,294,377);

fill(125,180,180);
quad(338,438,362,451,380,432,353,415);

fill(220,220,200);
quad(362,451,378,460,395,441,380,432);

fill(250,190,160);
quad(378,460,394,469,410,450,395,441);

//fünfte Reihe
fill(0);
quad(294,377,353,415,367,393,309,338);

fill(227,215,190);
quad(353,415,380,432,394,418,367,393);

fill(100,150,90);
quad(380,432,395,441,406,429,394,418);

fill(230,225,200);
quad(395,441,410,450,418,441,406,429);

//sechste Reihe
fill(0);
quad(367,393,394,418,406,406,378,377);

fill(230,225,200);
quad(394,418,406,429,417,416,406,406);

fill(0);
quad(406,429,418,441,430,427,416,415);

//siebte Reihe
fill(230,225,200);
quad(378,377,406,406,416,396,385,366);

fill(0);
quad(406,406,417,415,426,405,416,396);

fill(150,86,24);
quad(426,405,438,417,450,402,439,394);

fill(230,225,200);
quad(417,415,430,427,438,417,426,405);

//achte Reihe

fill(0);
quad(385,366,416,396,430,381,396,347);

fill(230,225,200);
quad(416,396,426,405,439,390,430,381);

fill(150,86,24);
quad(426,405,438,417,450,402,439,390);

//neunte Reihe und so weiter
fill(230,230,200);
quad(430,381,439,390,466,362,458,353);

fill(230,220,200);
quad(439,390,450,402,475,373,466,362);

fill(230,225,200);
quad(458,353,466,362,484,343,476,335);

fill(0);
quad(466,362,475,373,494,352,484,343);

fill(0);
quad(476,335,484,343,500,326,492,319);

fill(230,225,200);
quad(484,343,494,352,508,335,500,326);

fill(0);
quad(498,326,508,336,521,321,510,313);

fill(230,225,200);
quad(510,313,521,321,543,294,534,286);

fill(0);
quad(534,286,543,294,552,283,543,276);


//kreisfigur klein unten links

noStroke();
fill(160,165,161);
ellipseMode(CENTER);
ellipse(110,534, 120,120);

fill(103,159,176);
ellipseMode(CENTER);
ellipse(110,534, 105,105);

stroke(2);
strokeWeight(2);
fill(230,188,76);
ellipseMode(CENTER);
ellipse(110,534, 77,77);
 
 
//Mondelement unten mitte

noStroke();

fill(240,204,94);
ellipseMode(CENTER);
ellipse(427,659,89,89);

fill(234,184,149);
ellipseMode(CENTER);
ellipse(427,659,75,75);

fill(73,124,143);
ellipseMode(CENTER);
ellipse(424,659,59,59);

fill(142,111,155);
ellipseMode(CENTER);
ellipse(818,579,64,64);

//grauer Kreis oben,mitte

fill(135,150,155);
ellipseMode(CENTER);
ellipse(600,63,30,30);

//roter Kreis, oben mitte
stroke(0);
fill(175,55,40);
ellipseMode(CENTER);
ellipse(540,150,16,16);

// überlagerter Kreis blau-grau oben rechts
strokeWeight(1);
stroke(0);
fill(185,185,160);
ellipseMode(CENTER);
ellipse(730,105,35,35);

stroke(255);
fill(83,97,136);
ellipseMode(CENTER);
ellipse(730,105,26,26);


//Kreis in großen Linien

noStroke();
fill(201,204,175);
ellipseMode(CENTER);
ellipse(651,158,38,38);

strokeWeight(1);
stroke(0);
fill(226,218,197);
ellipseMode(CENTER);
ellipse(651,158,30,30);

//Mehfacher Kreis links von Hauptmotiv
strokeWeight(1);
stroke(0);
fill(255,255,255,200);
ellipseMode(CENTER);
ellipse(542,225,75,75);

strokeWeight(4);
stroke(135,26,21);
noFill();
ellipseMode(CENTER);
ellipse(542,225,38,38);

strokeWeight(5);
stroke(70,65,46);
noFill();
ellipseMode(CENTER);
ellipse(542,225,46,46);

//weißer Kreis rechts oben
strokeWeight(2);
stroke(0);
fill(227,228,214);
ellipseMode(CENTER);
ellipse(1050,152,37,37);

//gelbes Dreieck oben rechts
noStroke();
fill(252,197,42);
triangle(686,51,658,93,708,93);

//blau-gelber Kreis rechts oben
stroke(0);
noFill();
ellipseMode(CENTER);
ellipse(969,132,50,50);

noStroke();
fill(221,197,127);
ellipseMode(CENTER);
ellipse(970,131,50,50);

noStroke();
fill(120,185,205);
ellipseMode(CENTER);
ellipse(970,131,40,40);

//rot-violleter Kreismond rechts oben
noStroke();
fill(178,81,39);
ellipseMode(CENTER);
ellipse(973,195,50,50);

noStroke();
fill(180,170,170);
ellipseMode(CENTER);
ellipse(970,192,45,45);

//blauer kreis oben rechts
noStroke();
fill(60,140,185);
ellipseMode(CENTER);
ellipse(877,324,73,73);

//Olivgrüner Kreis unten rechts
strokeWeight(0.5);
stroke(0);
fill(152,160,120);
ellipseMode(CENTER);
ellipse(940,635,105,105);

//Rotes Quadrat rechts unten
strokeWeight(2);
stroke(0);
fill(125,36,28);
quad(987,662,987,697,1027,697,1027,662);

strokeWeight(1);
line(1010,677,1038,677);
line(1010,684,1038,684);

//dreieck gelb unten rechts
noStroke();
fill(212,164,64);
triangle(934,513,866,590,960,617);

 //linien Bildmitte    

stroke(0);
strokeWeight(3);
line(649, 10, 476, 665);
line(649, 10, 851, 699);

strokeWeight(1);
line(548,67,739,189);
line(556,110,739,189);

//F formende Linien oben links

line(364,64,361,262);
line(323,70,455,133);
line(337,136,401,134);
line(341,149,406,148);

//zwei schräge linien unten links
strokeWeight(2);
line(284,690,478,560);
strokeWeight(1);
line(317,734,453,603);

//zwei Linien unten rechts
line(740,578,913,579);
line(793,663,923,660);

line(649,476,649,755);

line(622,642,740,514);
line(625,645,744,516);
line(628,654,747,517);

//Linienkonstrukt oben rechts vom Hauptmotiv
line(755,0,755,135);
line(760,0,760,135);
stroke(137,120,48);
line(740,24,775,24);
line(740,26,775,26);
line(740,122,773,122);
line(740,124,773,124);
line(740,126,773,126);
noFill();
arc(765, 55, 40, 38, 2.5*PI, 3.5*PI);

stroke(0);

strokeWeight(2);
fill(231,204,123);
quad(900,41,900,56,917,56,917,41);

//GITTER
noStroke();
fill(224,227,220,190);
quad(1018,290,1017,316,1043,316,1045,288);
quad(1043,316,1044,343,1071,345,1071,319);

fill(197,76,68);
quad(1045,290,1043,316,1071,319,1071,290);
fill(197,76,68,150);
quad(1017,316,1017,345,1044,343,1043,316);

stroke(0);
strokeWeight(2);
line(1020,250,1017,387);
line(1045,250,1042,387);
line(1070,250,1070,387);
line(975,289,1100,292);
line(970,315,1100,318);
line(971,342,1100,345);

//linien im Hauptmotiv
stroke(0);
strokeWeight(1);
line(565,277,680,220);
line(566,281,681,224);

stroke(241,142,137);
strokeWeight(5);
line(557,308,730,210);
stroke(0);
strokeWeight(2);
line(557,309,730,211);

stroke(0);
strokeWeight(1);
line(653,293,772,193);
line(620,346,782,195);

stroke(248,216,56);
strokeWeight(6);
line(684,306,773,239);

stroke(0);
strokeWeight(3);
line(682,304,773,235);

//dicke Linien
strokeWeight(7);
strokeCap(SQUARE);
line(824,365,1042,435);
line(667,400,345,464);
stroke(131,74,55);
line(332,510,631,421);

strokeWeight(4);
stroke(0);
line(740,418,937,625);

