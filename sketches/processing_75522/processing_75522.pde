
 
// Größe Fenster
size(650,650);

// Weichzeichen
smooth();

// Hintergrundfarbe
background(232,214,183);

// Vorlage im Sketch Folder
// PImage b;
// b = loadImage("kandinskycircles.jpg");
// image(b, 0, 0);

// Farbbereich Gelb
noStroke();
fill(235,207,64,200);
beginShape();
vertex(650,0);
vertex(600,0);
vertex(-6,500);
vertex(0,740);
endShape(CLOSE);

// Farbbereich Türkis
noStroke();
fill(89,158,147,200);
beginShape();
vertex(119,0);
vertex(220,0);
vertex(650,394);
vertex(650,645);
endShape(CLOSE);


// Ellipsen mit Transparenz

// Ellipse Grüngrau
stroke(39,34,41,100);
strokeWeight(1);
fill(63,72,57,250);
ellipse(310,350,190,190);

// Ellipse Gelb unten
stroke(39,34,41,100);
strokeWeight(1);
fill(250,219,120,200);
ellipse(258,365,155,155);

// Ellipse Gelb
stroke(39,34,41,100);
strokeWeight(2);
fill(250,219,120,150);
ellipse(415,405,105,105);

// Ellipse Pink
stroke(39,34,41,150);
strokeWeight(2);
fill(238,139,181,150);
ellipse(251,199,132,132);

// Ellipse Rot
stroke(39,34,41,150);
strokeWeight(0);
fill(206,32,39,160);
ellipse(337,230,110,110);

// Ellipse Dunkelgrün
stroke(39,34,41,100);
strokeWeight(1);
fill(11,98,82,180);
ellipse(438,303,153,153);

// Ellipse Blau
stroke(39,34,41,150);
strokeWeight(2);
fill(28,112,123,130);
ellipse(500,314,60,60);

// Ellipse Lila
stroke(39,34,41,150);
strokeWeight(0);
fill(123,72,91,210);
ellipse(445,180,80,80);

// Ellipse Turkis
stroke(39,34,41,150);
strokeWeight(1);
fill(123,154,139,170);
ellipse(254,267,75,75);

// Ellipse Rot, klein
stroke(39,34,41,100);
strokeWeight(0.4);
fill(188,29,34,200);
ellipse(333,390,18,18);

// Ellipse Schwarz Rot
stroke(22,23,28,200);
strokeWeight(3.2);
fill(191,32,37,180);
ellipse(301,304,70,70);

// dazugehörige schwarze Ellipse
fill(22,23,28);
ellipse(302,305,15,15);

// Ellipse Schwarz Türkis
stroke(22,23,28,230);
strokeWeight(3.2);
fill(63,136,122,180);
ellipse(182,384,48,48);

// Ellipse Schwarz Rot
stroke(22,23,28,230);
strokeWeight(2.5);
fill(206,32,39,180);
ellipse(236,427,59,59);

// Ellipse Schwarz Rot
stroke(22,23,28,80);
strokeWeight(1.4);
fill(206,32,39,80);
ellipse(146,470,38,38);

// Ellipse Schwarz Rot
stroke(22,23,28,160);
strokeWeight(2);
fill(175,90,108,120);
ellipse(508,469,26,26);


// Ellipsen ohne Transparenz

// Ellipse 1 Schwarz
fill(37,39,36);
ellipse(443,440,28,28);
// Ellipse 2 Schwarz
fill(37,39,36);
ellipse(270,470,8,8);
// Ellipse 3 Rose
stroke(37,39,36,250);
strokeWeight(2.5);
fill(202,132,124);
ellipse(360,528,36,36);
// Ellipse 4 Rot
stroke(39,34,41);
strokeWeight(7);
fill(208,35,41);
ellipse(137,304,35,35);
// Ellipse 4 Blau
stroke(39,34,41);
strokeWeight(3);
fill(47,75,125);
ellipse(104,377,16,16);
// Ellipse 5 Rot
stroke(39,34,41);
strokeWeight(3);
fill(208,35,41);
ellipse(303,90,14,14);
// Ellipse 6 Gelb
stroke(39,34,41);
strokeWeight(0.2);
fill(224,173,92);
ellipse(388,482,15,15);
// Ellipse 7 Rose
stroke(39,34,41);
strokeWeight(1);
fill(199,83,75);
ellipse(315,455,13,13);

// Linien
strokeWeight(2);
line(363,135,150,420);

strokeWeight(1);
line(300,185,115,356);

strokeWeight(2.4);
line(150,170,550,235);

strokeWeight(2.4);
line(83,328,550,420);

strokeWeight(1.4);
line(125,357,450,524);

strokeWeight(1.4);
line(118,386,520,432);

strokeWeight(1.1);
line(195,129,540,380);

strokeWeight(0.5);
line(90,264,525,380);

strokeWeight(0.5);
line(90,275,525,395);

strokeWeight(0.5);
line(120,250,91,300);

strokeWeight(0.5);
line(131,254,98,296);

strokeWeight(0.5);
line(170,272,156,315);

strokeWeight(2.1);
line(213,523,460,112);

strokeWeight(1.2);
line(159,500,285,475);

strokeWeight(1.2);
line(190,466,279,517);

strokeWeight(0.4);
line(185,523,391,225);

strokeWeight(0.4);
line(173,517,388,225);

strokeWeight(0.3);
line(394,522,456,135);

strokeWeight(1);
line(402,537,467,135);

strokeWeight(0.3);
line(411,554,478,127);

strokeWeight(2.7);
line(482,475,479,210);

strokeWeight(1.7);
line(500,235,473,234);

strokeWeight(2);
line(510,245,473,245);

strokeWeight(1.4);
line(334,145,360,177);

strokeWeight(1.4);
line(342,132,365,165);

strokeWeight(0.4);
line(377,510,440,470);

strokeWeight(0.4);
line(384,517,444,480);

strokeWeight(0.4);
line(387,527,446,490);

// Ellipse Schwarz auf 2 Linien
stroke(22,23,28,200);
strokeWeight(0);
fill(22,23,28,230);
ellipse(397,211,41,41);

// Ellipse Schwarz auf 3 Linien
stroke(22,23,28,200);
strokeWeight(0);
fill(22,23,28,230);
ellipse(445,265,28,28);

// großer Außenkreis
stroke(22,21,25);
strokeWeight(27);
noFill();
ellipse(328,323,559,559);


