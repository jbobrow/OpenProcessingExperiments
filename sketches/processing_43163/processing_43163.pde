
smooth();

size(575,840, P2D);
background(250,210,80);

//HG verlauf am unteren Rand
noStroke();
beginShape();
fill(190,60,30);
vertex(0,840);
vertex(575,840);
fill(250,210,80);
vertex(575,650);
vertex(0,650);
endShape();


//orange kreis o.r.
stroke(0);
fill(220,160,80);
ellipse(545,0,200,200);
//innen rot o.r.
stroke(200,0,0);
fill(190,70,30);
ellipse(545,0,80,60);

//kreise o.r.
stroke(15,15,15);
noFill();
ellipse(545,0,205,205);
ellipse(545,0,210,210);
ellipse(545,0,215,215);
ellipse(545,0,220,220);
ellipse(545,0,225,225);
ellipse(545,0,235,235);
ellipse(545,0,250,250);

//dreieck o.l.
noStroke();
beginShape();
fill(130,100,30);          //hell braun
vertex(315,145);
fill(80,40,25);            //dkl braun
vertex(65,0);
vertex(-20,0);
endShape();

  
//dreieck rot/gelb
beginShape();
stroke(215,50,15);

fill(130,5,15);        //dkl rot
vertex(196,170);
vertex(146,170);

vertex(133,217);
vertex(57,217);

fill(240,175,50);        //gelb
vertex(175,595);

fill(130,5,15);        //dkl rot
vertex(196,170);

endShape();

line(196,170,175,595);


//dkl dreieck drin
noStroke();
beginShape();
fill(0);                //schw
vertex(122,255);
fill(60,75,130);               //dkl blau
vertex(160,123);
vertex(100,117);
endShape();


//linien über dreieck
stroke(0); //schwarz
line(67,113,188,127);
line(67,109,188,123);

stroke(215,50,15); //rot
line(67,105,188,120);


//drei rechtecke links
stroke(0);
fill(30,25,85);
rect(0,300,40,15);

fill(30,25,50);
rect(0,340,40,15);

fill(30,25,100,210); //mit transparenz
rect(0,380,40,15);


//halbkreis auf stufe
stroke(0);
fill(210,170,80);
arc(395,652,45,45,radians(180),radians(360));


//treppe u.r.
noStroke();

fill(220,75,30);
rect(575,578,-77,-30);

fill(210,30,35);
rect(498,651,-77,-73);

fill(190,20,20);
rect(575,651,-77,-73);

fill(200,22,22);
rect(421,714,-60,-63);

fill(170,20,20);
rect(498,714,-77,-63);

fill(160,20,20);
rect(575,714,-77,-63);

fill(190,50,30);
rect(361,840,-88,-126);

fill(130,15,20);
rect(421,840,-60,-126);

fill(120,15,20);
rect(498,840,-77,-126);

fill(105,15,20);
rect(575,840,-77,-126);


//quader u.r.
noStroke();
fill(0); //schwarz
rect(460,765,85,75);


//schräge u.l. nach o.r.
fill(50);
beginShape();
vertex(-11,760);
vertex(-7,768);
vertex(234,607);
vertex(230,600);
endShape();

//spitz zulaufend
fill(30);
beginShape();
vertex(45,840);
vertex(77,840);
vertex(302,570);
endShape();


//schräg striche u.l.
stroke(0);
line(187,607,260,652);
line(189,604,263,648);

strokeWeight(2);
line(100,605,211,700);
line(107,602,215,694);

strokeWeight(1);
line(40,700,237,745);
line(40,705,237,750);
line(40,710,237,755);

//linien fächer auf dreieck
//blaue linien
stroke(30,25,85);
line(70,428,260,383);
line(70,431,268,405);
line(73,436,263,436);
line(76,444,268,476);
line(78,452,263,511);

//rote linien
stroke(215,50,15);
line(82,427,261,390);
line(82,432,273,422);
line(84,439,261,460);
line(82,450,255,493);


//kreuz aus linien
//rot
stroke(215,50,15);
line(415,527,452,560);
line(418,524,455,557);
line(420,521,458,554);
line(423,518,461,551);
line(426,515,464,548);

//dkl blau
stroke(30,25,85);
line(419,555,452,512);
line(422,557,456,514);
line(426,560,461,516);
line(430,562,464,520);


//waagerechte v.l.n.r.
noStroke();
fill(0);
rect(0,595,475,15);


//senkr l. schräg
fill(130,75,35);
beginShape();
//gegen uhrzeigersinn
vertex(57,470);
vertex(57,595);
vertex(66,595);
vertex(66,460);
endShape();

//striche über senkr s.o.
stroke(0);
line(25,480,103,528);
line(25,488,103,535);

strokeWeight(2);
line(30,540,90,576);
strokeWeight(1);
line(30,545,90,581);

//rote offene dreiecke über strichen s.o.
stroke(215,50,15);
//3 auf oberen linien
line(25,500,43,481);
line(43,481,43,507);

line(70,520,83,509);
line(83,509,79,530);
line(79,530,94,516);
line(94,516,92,537);

//2 auf unteren linien
line(30,560,47,540);
line(47,540,47,570);

line(70,572,82,560);
line(82,560,77,582);


//kl caro orange
fill(215,90,30);
beginShape();
vertex(133,570);
vertex(127,578);
vertex(138,580);
vertex(145,572);
endShape();

//kl rechteck rot
fill(180,25,35);
beginShape();
vertex(212,557);
vertex(213,566);
vertex(222,564);
vertex(220,556);
endShape();


//kreis + gitter
stroke(0);                    //hier der Grauraum in den ecken

fill(50,50,50,100);
//u.l.
arc(332,555,35,32,radians(85),radians(170));
//o.l.
arc(328,532,37,38,radians(170),radians(260));
//o.r.
arc(348,530,42,41,radians(260),radians(354));
//u.r.
arc(351,552,37,34,radians(354),radians(442));

noFill();
ellipse(340,540,66,66);



noFill();
ellipse(340,540,65,65);
//linien senkr
stroke(215,50,15);
line(322,500,337,590);
line(332,498,347,587);
line(342,497,357,586);
//linien waager
line(294,536,384,525);
line(295,549,385,535);
line(297,559,387,547);

//rotes eck an dreieck spitzen s.u.
fill(160,20,20);
beginShape();
vertex(360,420);
vertex(322,433);
vertex(340,464);
vertex(355,470);
endShape();


//dreieckgebilde r.o.

//zacken v.o.n.u.

stroke(45,25,15);
fill(140,85,35);
triangle(475,310,475,330,495,310);

fill(80,50,30);
triangle(455,322,460,343,481,325);

fill(105,70,35);
triangle(439,339,444,360,468,339);

fill(65,40,35);
triangle(420,358,425,377,449,358);

fill(45,25,15);
triangle(400,374,405,400,431,373);


//schwarz
noStroke();
fill(0);
triangle(285,505,515,325,511,290);

//2 rote dreieck umrisse
stroke(215,50,15);
noFill();
triangle(420,303,378,279,374,299);
triangle(413,333,370,315,366,333);

//dkl blau
stroke(215,50,15);
beginShape();
fill(90,40,50);
vertex(316,230);
vertex(393,210);
fill(65,65,90);
vertex(343,440);
endShape();

//grau
noStroke();
beginShape();
fill(30);
vertex(333,180);
vertex(368,180);
fill(180,145,70);
vertex(357,235);
endShape();

//rot
fill(215,50,15);
triangle(350,180,398,136,385,122);

//quer durch dreieck
stroke(10,10,135);
line(283,275,425,248);


//kreis dkl blau
stroke(0);
fill(10,15,60);
ellipse(445,310,40,40);

//kreis rot
noStroke();
fill(215,50,25);
ellipse(515,435,35,35);



//dkl blau verlauf
//beginShape();
//fill(0);
//vertex(316,230);
//vertex(343,440);
//fill(30,25,85);
//vertex(393,210);
//endShape();
//
////dkl grau verlauf
//beginShape();
//vertex(333,180);
//vertex(357,235);
//vertex(368,180);
//endShape();
//
////rot
//beginShape();
//vertex();
//vertex();
//vertex();
//endShape();


//übrlagerung an dreieck spitze mit roter ecke
fill(150,80,20);
beginShape();
vertex(335,458);
vertex(338,463);
vertex(357,449);
vertex(359,436);
endShape();

fill(10,10,120);
rect(255,535,11,11);

rect(385,580,7,7);

fill(55);
rect(260,575,7,7);

//dreiecke auf stufen
noStroke();
triangle(440,566,435,578,444,578);

fill(170,110,45);          //gelb
triangle(466,553,473,578,478,553);

fill(170,20,30);           //rot
triangle(517,513,525,548,530,513);

fill(110,35,35);           //dkl rot
triangle(535,530,540,548,546,530);


//letzte stufe 3 dreiecke

//waagerechte
stroke(0);
line(270,675,310,685);
fill(30,25,85);          //dkl blau
noStroke();
triangle(286,683,290,715,300,686);

stroke(0);
line(285,672,290,715);
line(290,715,303,675);

noStroke();
fill(240,150,45);      //dkl gelb
triangle(333,678,338,715,345,672);
stroke(1);
line(330,663,338,715);
line(338,715,345,655);
//waagerechten
stroke(1);
line(320,675,355,660);
line(320,678,357,663);


noStroke();
fill(180,90,30);        //dkl beige
triangle(306,715,320,715,313,694);

//halbkreise o.l.
stroke(1);
noFill();
arc(185,275,70,70,radians(-90),radians(95));
stroke(215,50,15);
arc(185,275,75,75,radians(-90),radians(100));
arc(185,275,65,65,radians(-90),radians(90));

//kandinsky Kuerzel
stroke(0);
line(10,825,20,810); //oben
line(18,818,18,822);
line(25,815,20,820);               //K
line(20,820,25,822);               //K
line(15,825,28,827); //unten


