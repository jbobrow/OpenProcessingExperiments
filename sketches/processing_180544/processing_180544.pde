
size(500,700);
background(0);
//Tardis blue = 16,35,114

//"ESTRELLAS"
stroke(255);
fill(255);
ellipse(20,20,4,4);
ellipse(100,35,4,4);
ellipse(44,400,4,4);
ellipse(60,326,4,4);
ellipse(31,678,4,4);
ellipse(450,31,4,4);
ellipse(446,544,4,4);
ellipse(480,213,4,4);
ellipse(473,123,4,4);
ellipse(475,422,4,4);
ellipse(220,70,4,4);
ellipse(300,50,4,4);
ellipse(134,60,4,4);
ellipse(18,170,4,4);
ellipse(46,578,4,4);
ellipse(440,326,4,4);
ellipse(470,650,4,4);

//TRONCO
stroke(16,35,114);
fill(16,35,114);
rect(110,192,270,450);

//SUELO
fill(16,35,114);
stroke(16,35,114);
beginShape();
vertex(110,642);
vertex(100,652);
vertex(100,672);
vertex(390,672);
vertex(390,652);
vertex(380,642);
endShape(CLOSE);


//TECHO
//Azul
stroke(16,35,114);
fill(16,35,114);
rect(105,154,280,38);
rect(127,144,236,10);
rect(133,140,224,4);
//RectanguloNEGRO
stroke(0);
fill(0); 
rect(125,160,240,28);

//LuzSuperior
stroke(16,35,114);
fill(16,35,114);
beginShape();
vertex(224,140);
vertex(224,139);
vertex(226,137);
vertex(228,137);
vertex(232,135);
vertex(234,135);
vertex(234,115);
curveVertex(231,115);
curveVertex(238,111);
curveVertex(245,108);
curveVertex(252,111);
curveVertex(259,115);
vertex(256,115);
vertex(256,135);
vertex(258,135);
vertex(262,137);
vertex(264,137);
vertex(266,139);
vertex(266,140);
endShape(CLOSE);
fill(189,199,240);
stroke(189,199,240);
ellipse(240,125,7,16);
ellipse(250,125,7,16);

//SOMBRAS
//Sombrasuperior
fill(0);
stroke(0);
rect(110,192,270,2);
//Sombras puertas
strokeWeight(3);
stroke(16,35,70);
noFill();
beginShape();
vertex(110,642);
vertex(140,642);
vertex(140,636);
vertex(350,636);
vertex(350,642);
vertex(380,642);
endShape();
line(140,636,140,197);
line(350,636,350,197);
strokeWeight(2);
line(238,215,238,636);
strokeWeight(4);
line(252,215,252,636);
fill(16,35,70);
rect(140,197,98,20);
rect(252,197,98,20);
//SombrasBOT
strokeWeight(2);
stroke(16,35,150);
line(102,652,388,652);
strokeWeight(1);

//PUERTAS
//cuadradicos de madera
fill(19,38,90);
stroke(19,38,90);
rect(268,345,70,70);
rect(268,440,70,70);
rect(268,535,70,70);
rect(156,345,70,70);
rect(156,440,70,70);
rect(156,535,70,70);
stroke(16,35,70);
strokeWeight(2);
line(268,345,338,345);
line(268,440,338,440);
line(268,535,338,535);
line(156,345,226,345);
line(156,440,226,440);
line(156,535,226,535);
//Ventanas
fill(255);
stroke(255);
rect(153,222,73,90);
rect(265,222,73,90);
strokeWeight(4);
stroke(16,35,114);
line(153,265,229,265);
line(265,265,338,265);
line(173,222,173,312);
line(206,222,206,312);
line(285,222,285,312);
line(318,222,318,312);
//Cerradura y cosas para abrir la puerta
fill(211,185,32);
ellipse(263,425,13,13);
stroke(59,52,7);
strokeWeight(2);
line(263,423,263,427);
strokeWeight(3);
fill(16,35,114);
stroke(19,38,90);
rect(257,365,6,30);
rect(158,357,4,10);
rect(158,380,4,10);
rect(218,365,6,20);
//Texto adicional
strokeWeight(1);
stroke(203);
fill(203);
rect(166,355,47,47);
fill(0);
textSize(4);
text("POLICE TELEPHONE",172,359);
textSize(3);
text("FOR USE OF",181,375);
text("ADVICE & ASSISTANCE",176,388);
text("OBTAINABLE IMMEDIATELY",174,391);
textSize(2);
text("OFFICER & CARS",182,393);
text("RESPOND TO ALL CALLS",176,395);
textSize(8);
text("FREE",180,370);
text("PUBLIC",176,385);
textSize(7);
text("PULL TO OPEN",165,402); 

//TEXTO SUPERIOR 
fill(255);
textSize(20);
text("POLICE",150,180);
text("BOX",290,180);
textSize(10);
text("PUBLIC",235,170);
text("CALL",240,185);



