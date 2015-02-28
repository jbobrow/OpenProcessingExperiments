
size(612,820);
background (0);

smooth ();


//Wellen
noFill();

beginShape();
stroke (#836872); //Farbe hinter dem Grün
strokeWeight (24);
curveVertex(55,496+7);
curveVertex(55,496+7);
curveVertex(72,489+7);
curveVertex(100,500+7);
curveVertex(130,488+7);
curveVertex(159,502+7);
curveVertex(186,486+7);
curveVertex(219,502+7);
curveVertex(234,496+7);
curveVertex(234,496+7);
endShape();

beginShape();
stroke (#AFD89D); //hell grün
strokeWeight (3);
curveVertex(55,496);
curveVertex(55,496);
curveVertex(72,489);
curveVertex(100,500);
curveVertex(130,488);
curveVertex(159,502);
curveVertex(186,486);
curveVertex(219,502);
curveVertex(234,496);
curveVertex(234,496);
endShape();

beginShape();
stroke (#AFD89D); //hell grün
strokeWeight (3);
curveVertex(55,496+20);
curveVertex(55,496+20);
curveVertex(72,489+20);
curveVertex(100,500+20);
curveVertex(130,488+20);
curveVertex(159,502+20);
curveVertex(186,486+20);
curveVertex(219,502+20);
curveVertex(234,496+20);
curveVertex(234,496+20);
endShape();

beginShape();
stroke (#6F7752); //mattes grün
strokeWeight (15);
curveVertex(55,496+40);
curveVertex(55,496+40);
curveVertex(72,489+40);
curveVertex(100,500+40);
curveVertex(130,488+40);
curveVertex(159,502+40);
curveVertex(186,486+40);
curveVertex(219,502+40);
curveVertex(234,496+40);
curveVertex(234,496+40);
endShape();

beginShape();
stroke (#AFD89D); //hell grün
strokeWeight (3);
curveVertex(55,496+40);
curveVertex(55,496+40);
curveVertex(72,489+40);
curveVertex(100,500+40);
curveVertex(130,488+40);
curveVertex(159,502+40);
curveVertex(186,486+40);
curveVertex(219,502+40);
curveVertex(234,496+40);
curveVertex(234,496+40);
endShape();




//Kreis oben rechts
noStroke();
fill (#F8D529); //hell gelb
ellipse (525,95,72,72);
fill (#008F47); //grün
ellipse (525,95,69,69);
fill (#06ACE1); //blau
ellipse (525,95,52,52);
fill (#F8DD51); //gelb
ellipse (525,95,35,35);
fill (#EB680A); //orange
ellipse (525,95,29,29);


//Kreise links
fill (9,179,231);
ellipse ( 250,295,116,116);
ellipse(210,392,13,13);
fill (241,109,9);
ellipse (172,427,5,5);
ellipse (202,423,7,7);
ellipse (245,400,12,12);
ellipse (196,390,3,3);
fill (172,31,64);
ellipse (191,375,20,20);
fill (236,63,5);
ellipse (221,366,8,8);
ellipse (163,395,4,4);
fill (255,255,148);
ellipse (183,355,9,9);
ellipse (153,425,4,4);
ellipse (195,477,12,12);
ellipse (276,503,13,13);
ellipse (179,454,3,3);
fill (237,141,130);
ellipse (222,422,8,8);
fill (37,163,68);
ellipse (183,406,30,30);
fill (255);
ellipse (187,434,12,12);
fill (95,197,203);
stroke(255);
strokeWeight(4);
ellipse (161,444,16,16);




//Häuser links

//unteres Haus
noStroke();
fill (78,179,64);
triangle (110,338,167,416,59,416);
stroke (224,2,5);
strokeWeight (6);
line (73,426,130,426);
noStroke();
fill(165,222,250);
rect (82,415,64,66);
strokeCap(PROJECT);
stroke (250);
strokeWeight (6);
line (84,415,142,415);
stroke (250,226,135);
strokeWeight (5);
line (84,410,143,410);
stroke (255,251,128);
strokeWeight (3);
line (84,406,144,406);
stroke (224,2,5);
strokeWeight (3);
line (84,403,144,403);
noStroke();
fill (253,193,81);
ellipse (99,431,19,19);
ellipse (128,431,19,19);
fill (255);
stroke (93,199,238);
strokeWeight (4);
ellipse(115,440,2,2);
stroke (255);
strokeWeight(5);
line (88,457,104,457);
stroke (253,193,81);
strokeWeight(3);
line (88,446,103,446);
stroke (224,2,5);
strokeWeight (3);
line (128,474,161,474);
stroke (189,176,143);
strokeWeight (3);
line (128,468,161,468);

//oberes Haus
noStroke();
fill (223,243,253);
triangle (145,259,92,338,196,338);
fill(37,163,68);
rect(144-28,322-8,56,71);
fill (230,167,0);
rect (144-28,338-24,56,24);
stroke (255,248,87);
strokeWeight (4);
line (106,380,122,380);
strokeWeight (3);
line (106,366,122,366);
noStroke();
fill (224,2,5,220);
triangle (116,347,145,386,116,386);
fill (255,248,87);
ellipse (131,328,19,19);
ellipse (158,328,19,19);
ellipse (159,370,19,19);
ellipse (134,370,19,19);
fill(0);
ellipse (153,343,4,4);
noStroke ();
fill (9,179,231);
arc (134,370,19,19,1,4.1);


//Dreiecke links oben
fill (#F7AC00);
quad (124,170,211,170,211,216,105,218);
fill (#FFFB90);
triangle (78,185,208,54,211,184);
fill (#FFE816);
triangle (245,48,377,184,245,230);
fill (#F7AC00,240);
triangle (131,160,223,70,306,158);
fill (#E21800);
triangle (245,93,245,158,306,158);
stroke (#E21800,190);
strokeWeight (7);
line(35,150,185,143);
strokeWeight (4);
line(71,130,184,124);
strokeWeight (2);
line(94,107,193,103);



//Rechtecke links
noStroke();
fill (255);
quad (159,160,280,158,280,190,159,192);
//erste Reihe
fill (#01B0EF);
rect (159,159,16,16);
fill (#E51900);
rect (195,158,16,16);
fill (#039B43);
rect (211,158,16,16);
fill (#F7AC00);
rect (245,158,19,16);
//zweite Reihe
rect (159,174,16,10);
rect (195,174,16,10);
fill (#7EAE39);
rect (175,174,20,10);
fill (#FFCA70);
rect (211,174,16,10);
fill (#01B0EF);
rect (227,174,18,10);
fill (#FFF880);
rect (245,174,19,10);
//dritte Reihe
fill (#E51900);
rect (175,184,20,8);
fill (#01B0EF);
rect (195,184,16,8);
fill (#FFF880);
rect (211,184,16,8);
fill (#FFCA70);
rect (227,184,18,8);
fill (#E51900);
rect (245,184,19,8);
fill (#01B0EF);
rect (264,184,16,8);


//Punkte
fill (#01B0EF);
ellipse (214,136,2,2);
fill (#E51900);
ellipse (223,120,14,14);
ellipse (210,128,4,4);
ellipse (219,149,9,9);
ellipse (166,153,3,3);
fill (#6A1605);
ellipse (203,153,3,3);
ellipse (193,114,3,3);
fill (#FFDC13);
ellipse (208,140,4,4);
ellipse (215,129,4,4);
ellipse (223,134,4,4);
ellipse (254,140,4,4);
ellipse (248,115,4,4);
fill(#DEC095);
ellipse (235,140,16,16);
fill (#01B0EF);
ellipse (255,123,12,12);
fill (255);
ellipse (200,134,11,11);


//Überschneidungen daneben
fill (#D89E11);
rect (245,206,125,24);
fill(#C8DAD2);
triangle (246,230,245,206,313,206);

//Dreiecke rechts
fill (#FAED0E);
triangle (434,93,493,220,371,220);
fill (#E21A01);
triangle (346,262,346,110,494,262);
fill (#E21A01);
triangle (486,112,556,364,440,362);
fill (#A63F17);
triangle (474,179,493,220,468,220);
fill (255);
rect (432-45,246-54,91,108);
fill (#571C14);
triangle (399,164,427,192,386,193);
fill (#C3550F);
triangle (386,193,386,222,371,222);
fill (#C3550F,250);
quad (427,192,471,192,466,220,454,222);
fill (#00AAE3,220);
triangle (422,161,540,283,422,361);

//bunter Streifen links unter den oberen Dreiecken
fill (#E21A01); //rot
rect (243-40,204-7,81,15);
fill (#009137); //grün
rect (243-40,204-7,8,15);
fill (#F79000); //orange
rect (243-32,204-7,2,15);
fill (255);
rect (243-23,204-7,4,15);
fill (#F79000); //orange
rect (243-19,204-7,5,15);
fill (#599730); //grün
rect (243-14,204-7,4,15);
fill (#F79000); //orange
rect (243-3,204-7,5,15);
fill (#599730); //grün
rect (245,204-7,39,10);


//rechts über den Dreiecken
fill (#FAED0E,150);
quad (386,193,427,192,454,222,386,222);
stroke (#00A9EF);
strokeWeight (5);
line (438,129,440,160);
stroke (#521D1A);
strokeWeight (3);
line (434,128,436,161);
noStroke();
fill (#599730);
rect (346,206,26,24);
fill (#5B1D12);
triangle (346,152,377,184,346,195);
fill (255);
triangle (531,274,540,283,535,287);
fill (#E21A01);
triangle (468,208,479,220,466,220);
rect (457,242,5,25);
fill (#6DA3AA);
rect (429,242,7,25);
fill (#EA8200);
quad (464,231,477+1,245,477+1,262,459,262);
fill (#FBEF01);
triangle (462,242,466,262,459,262);
fill (#009E3F);
rect (422+36,262,8,5);
fill (#0096C4);
rect (422,262,40-4,5);
fill (0,200,255);
triangle (477,245,493,262,477,262);

stroke (#E41203);
strokeWeight (6);
line (403,264,403,266);
stroke (#921410);
strokeWeight (6);
line (403,246,403,259);
stroke (#E41203);
strokeWeight (2);
line (347,255,347,266);

noStroke ();
fill (#E41203);
rect (312,267,70+5,16);
rect (390,360,136,19);
fill (#F99B14);
rect (440,360,127,11);
fill (#009E3F);
ellipse (533,347,15,15);
fill (#FAED0E,230);
quad (387,267,457,267,455,281,387,283);
fill (#EA3F05);
quad (455,282,478,282,478,301,452,301);
fill (#FBDB03); //gelb
quad (465,341,487,341,487,362,460,362);
fill (#007233); //dunkel grün
quad (465,341,483,341,483,347,463,347);
fill (#6DB34B); //grün
beginShape();
vertex(477,282);
vertex(508,282);
vertex(508,292);
vertex(525,292);
vertex(514,301);
vertex(477,301);
endShape();
fill (#09B3E7,180); //hell blau
quad (525,292,536,292,538,300,514,301);
fill (255);
triangle (525,292,536,292,534,286);
fill (#F59302); //orange
quad (538,300,536,292,554,293,555,300);


// Punkte über den Dreiecken
fill (255);
ellipse (467,289,7,7);
ellipse (458,288,3,3);
ellipse (448,276,4,4);
fill (#A791A8);
ellipse (450,287,3,3);
fill (#00A1AC);
ellipse(444,296,3,3);
fill (#E41203);
ellipse (426,288,4,4);
fill (#CD720B);
ellipse (398,209,14,14);
fill (#AC4203);
ellipse (417,209,14,14);
fill (#009E3F); //grün
ellipse (460,209,14,14);
fill (#DCEFFA); //hellblau
ellipse (580,401,8,8);
fill (#E21A01); //rot
arc (477,268,23,23,PI/2, PI);
fill (#FFF338); //gelb
arc (477,268,23,23,0, PI/2);
fill (#FFF338); //gelb
arc (477,261,21,9,TWO_PI-PI/2, TWO_PI);
fill (#066B82); //blau
arc (477,262,21,9,PI, TWO_PI-PI/2);
fill (#E21A01,210); //rot
ellipse (440,209,14,14);


// Dreiecke mit vielen bunten Strichen
//erste Reihe
stroke (#018732);
strokeWeight (8);
line (433,374,439,374);
stroke (#FEF146);
line (443,374,514,374);

//zweite Reihe
strokeWeight (9);
stroke (#02B5EB); //blau
line (423,374+8,520,374+8);
stroke (#F59302); //orange
line (433,374+8,435,374+8);
stroke (#FFF96F); //hell gelb
line (522,374+8,550,374+8);

//dritte Reihe
strokeWeight (6);
stroke (#E21A01); //rot
line (288,374+15,573,374+15);
stroke (#F59302); //orange
line (458,374+15,552,374+15);
stroke (#50B14E); //grün
line (431,374+15,437,374+15);
stroke (#50B14E); //grün
line (520,374+15,523,374+15);
stroke (#FFF96F); //hell gelb 
line (528,374+15,533,374+15);

//vierte Reihe
strokeWeight (10);
stroke (#FFF96F); //hell gelb 
line (423,374+23,520,374+23);
stroke (#02B5EB); //blau
line (433,374+23,435,374+23);
stroke (#F59302); //orange
line (522,374+23,550,374+23);
stroke (255);
line (530,374+23,531,374+23);
stroke (#E21A01); //rot
line (549,374+23,550,374+23);

//letze Reihen
strokeWeight (26);
stroke (#F59302); //orange
line (297,374+49,563,374+49);

//linkes mittleres Dreieck - lila
noStroke();
fill (#7974B1);
triangle (463,361,529,532,385,532);
fill (255);
triangle (463,361,466,369,459,369);
fill (#F59302); //orange
quad (459,369,466,369,469,378,455,378);
fill (255);
quad (455,378,469,378,473,387,451,387);
fill (#50B14E); //grün
quad (451,387,473,387,475,393,449,393);
fill (#02B5EB); //blau
quad (449,393,475,393,478,402,445,402);
fill (#FFF96F); //hell gelb
quad (440,411,482,411,491,436,429,436);
fill (#E21A01); //rot
rect (365,532,195,14);

//rechtes mittleres Dreieck - orange
fill (#F59302,220); //orange
triangle (487,367,573,508,488,508);
fill (#FFF96F); //hell gelb
triangle (487,367,489,370,487,370);
quad (487,378,493,378,499,387,487,387);
fill (#532115); //dunkel rot
quad (487,387,499,387,502,392,487,392);
fill (#50B14E); //grün
quad (487,392,502,392,508,402,487,402);
fill (#50B14E,220); //grün
quad (487,411,514,411,529,436,488,436);
fill (#E21A01); //rot
rect (468,508,120,12);
fill (#E21A01); //rotes Rechteck
rect (332,570,90,98);
fill (#FFF96F); //hell gelb
rect (470,489,38,18);
fill (#0FBFDE); //blau
rect (470,489,11,7);
fill (#F59302,220); //orange
rect (481,489,7,7);
fill (#50B14E); //grün
rect (494,489,6,7);
fill (#F59302,220); //orange
rect (470,496,11,12);
rect (488,496,10,12);
fill (#50B14E); //grün
rect (500,496,8,12);
fill (#E21A01); //rot
rect (490,498,4,10);
fill (255);
ellipse (488,525,5,5);
fill (#F59302,220); //orange
ellipse (516,513,3,3);
fill (#06A5C7); //blau
arc (429,436,25,25,PI, TWO_PI-PI/2.5);
fill (#F59302,220); //orange
arc (429,436,25,25,PI/1.6,PI);
fill (#FFF96F); //hell gelb
arc (429,435,26,26,PI/200,PI/1.6);
fill (#BEEAFB); //hell blau
arc (429,435,26,26,TWO_PI-PI/2.7, TWO_PI);

//grünes Dreieck
noStroke ();
fill (#66B74C); //grün
triangle (322,539,326,674,181,673);
fill (#FFF96F); //hell gelb
arc (323,673,100,100,PI, TWO_PI-PI/2);
fill (#A55716); //dunkel orange
arc (323,673,85,85,PI, TWO_PI-PI/2);
fill (#7B77AF); //lila
arc (323,673,78,78,PI, TWO_PI-PI/2);
fill (#66B74C); //hell grün
arc (323,673,72,72,PI, TWO_PI-PI/2);


//breites oranges Dreieck 
fill (#F59302,230); //orange
triangle (441,497,553,615,317,615);
fill (#50B14E); //grün
triangle (441,497,475,532,404,532);
fill (#7B77AF); //lila
quad (404,532,475,532,487,546,390,546);
fill (255);
arc (359,614,35,35,PI, TWO_PI);
fill (#7B77AF); //lila
arc (359,614,26,26,PI, TWO_PI);
fill (#50B14E); //grün
arc (359,614,22,22,PI, TWO_PI);


//Striche und Rechtecke darunter
fill (#50B14E); //grün
arc (406,634,32,32,PI, TWO_PI);
fill (#FFF96F,220); //hell gelb
arc (406,634,25,25,PI, TWO_PI);
fill (#7B77AF); //lila
arc (406,634,18,18,PI, TWO_PI);
//blauer Kreis
fill (#0FBFDE); //blau
arc (476,650,42,42,PI, TWO_PI);
//lilaner Kreis
fill (#7B77AF); //lila
arc (511,678,31,26,PI, TWO_PI);
stroke (#FFF96F,220); //hell gelb
strokeWeight (5);
line (393,636,477,636);
stroke (#50B14E); //grün
line (424,636,477,636);
stroke (#7B77AF); //lila
line (462,636,477,636);
strokeWeight (7);
stroke (#A55716); //dunkel orange
line (445,654,534,654);
strokeWeight (17);
line (319,678,443,678);
stroke (#E21A01); //rot
line (430,678,445,678);
strokeWeight (5);
line (359,678,585,678);
stroke (#691B24,200); //dunkel rot
line (354,678,445,678);
stroke (#FFF96F,200); //hell gelb
line (443,678,450,678);
stroke (#50B14E); //grün
line (424,678-6,437,678-6);
stroke (#0FBFDE); //blau
line (424,678+6,437,678+6);
stroke (#E21A01); //rot
line (424,678,437,678);
stroke (255);
line (306,678-6,322,678-6);
strokeWeight (12);
stroke (#E21A01); //rot
line (309,678+3,320,678+3);
stroke (#FAB56C); //hautfarbend
strokeWeight (18);
line (268,688,334,688);
stroke (#FFF96F,200); //hell gelb
strokeWeight (2);
line (322,593,325,695);
stroke (#E21A01,200); //rot
line (325,670,325,674);
strokeWeight (2);
stroke (#E21A01); //rot
line (325,698,325,771);
strokeWeight (8);
stroke (#7B77AF,190); //lila
line (307,678+5,340,678+5);
stroke (#FFF96F); //hell gelb
line (281,682,281,695);
strokeWeight (6);
stroke (255);
line (274,681,274,696);
stroke (#FFF545); //gelb
line (260,681,260,696);
strokeWeight (2);
stroke (#691B24); //dunkel rot
line (287,679,287,697);
stroke (#FFF96F,220); //hell gelb
strokeWeight (2);
line (460,586,460,707);
line (475,586,475,707);

strokeWeight (3);
stroke (#691B24); //dunkel rot
line (460,651,460,658);
line (475,651,475,658);


//lilanes Dreieck
noStroke ();
fill (#7B77AF); //lila
triangle (190,587,237,712,133,712);
fill (255);
triangle (211,644,222,673,181,673);


//hell blaues Dreieck
fill (#BEEAFB); //hell blau
triangle (131,640,163,732,84,732);
fill (255);
triangle (146,683,156,712,133,712);

//weitere Linien
stroke (#691B24,200); //dunkel rot
strokeWeight (7);
line (171,763,216,763);
stroke (#0FBFDE); //blau
strokeWeight (5);
line (68,741,181,741);
stroke (#E21A01); //rot
line (123,713,255,714);
strokeWeight (9);
line (208,734,267,734);
noStroke ();
fill (#66B74C,200); //grün
arc (234,730,41,45,PI, TWO_PI);



