

PImage img;

void setup() {
  size(500,700);
  img = loadImage("forest.jpg");
}

void draw() {
  image(img,0,0);


//Branch2
strokeWeight(18);
stroke(24,18,8);
line(400,700,405,640);
strokeWeight(14);
line(404,640,430,570);
line(407,640,430,570);
line(430,570,445,470);
line(427,563,430,569);
line(431,569,445,470);
line(437,529,446,430);
line(445,470,445,400);
line(446,430,445,350);
strokeWeight(12);
line(445,350,430,250);

    strokeWeight(7);
    line(405,640,387,635);
    line(405,643,387,635);
    line(387,635,380,625);
    line(387,636,380,625);
    strokeWeight(6);
    line(380,625,370,600);
    strokeWeight(3);
    line(370,600,360,590);
    line(370,599,350,580);
    strokeWeight(2);
    line(350,580,347,576);

    strokeWeight(9);
  line(429,249,454,200);
    strokeWeight(8);
  line(454,194,438,135);
  line(438,135,436,115);
    strokeWeight(7);
  line(436,115,435,110);
    strokeWeight(6);
  line(435,110,434,70);
    strokeWeight(3);
  line(433,70,433,35);
  line(435,70,433,35);
   strokeWeight(2);
  line(433,35,432,15);
            strokeWeight(3);
            line(435,70,425,66);
            line(435,72,425,66);
            line(425,66,418,46);
            strokeWeight(2);
            line(418,46,412,36);
            line(418,46,422,39);


    strokeWeight(9);
  line(454,200,454,194);
    strokeWeight(8);
  line(430,250,369,197);
  line(432,247,369,197);
  line(368,197,367,197);
   strokeWeight(6);
  line(367,196,343,153);
  line(368,196,343,153);
   strokeWeight(4);
   line(368,197,359,185);
   
           strokeWeight(4);
           line(343,153,313,133);
           line(342,148,336,147);
           strokeWeight(3);
           line(313,133,309,119);
           strokeWeight(2);
           line(309,119,290,110);
      
           strokeWeight(4);
           line(343,153,339,133);
           line(341,143,339,123);
           strokeWeight(3);
           line(339,123,341,116);
                    line(341,116,341,111);
                    line(341,116,335,111);
                     strokeWeight(2);
                    line(341,111,343,105);
                    line(335,111,333,105);
           
strokeWeight(16);
line(150,700,75,550);
strokeWeight(14);
line(80,565,80,500);
strokeWeight(13);
line(80,500,74,430);
line(74,435,64,415);
strokeWeight(12);
line(64,415,76,360);
strokeWeight(11);
line(76,362,73,322);
strokeWeight(6);
line(72,322,40,222);
line(74,322,40,222);
line(55,270,43,222);
 strokeWeight(3);
  line(40,222,50,161);
  line(40,222,34,220);
  line(34,220,28,190);
  line(45,222,61,211);
  line(73,322,89,300);
  line(71,319,89,300);
  line(89,300,96,220);
  line(69,319,73,321);
  strokeWeight(2);
  line(28,190,20,180);
  line(50,161,44,148);
  line(50,161,56,155);
  line(56,155,56,148);
  line(89,300,94,240);
  line(87,306,94,240);
  line(94,240,84,224);
  line(96,220,103,200);
  strokeWeight(1.5);
  line(44,148,40,140);
  line(56,148,48,138);
  line(56,148,66,134);
  line(61,211,61,200);
  line(84,224,87,211);
  line(81,224,76,213);
  line(103,200,105,190);
  strokeWeight(1.3);
  line(61,200,63,195);
  line(87,211,88,203);
  
//Web supports 
stroke(255, 90);
strokeWeight(1);
line(230,410,72,407);
line(230,410,98,346);
line(230,410,90,300);
line(230,410,96,220);
line(230,410,190,242);
line(230,410,285,244);
line(230,410,367,197);
line(230,410,380,260);
line(230,410,390,300);
line(230,410,450,340);
line(230,410,445,420);
line(230,410,415,450);
line(230,410,420,500);
line(230,410,425,560);
line(230,410,370,600);
line(230,410,267,558);
line(230,410,230,558);
line(230,410,130,638);
line(230,410,75,550);
line(230,410,74,500);
line(230,410,75,480);

//Web outer rim
line(72,407,98,346);
line(98,346,90,300);
line(425,560,415,450);
line(415,450,445,420);

//top bezier
beginShape();
stroke(255, 90);
fill(0,0);
vertex(96,220);
bezierVertex(190,250,305,267,367,197);
endShape();

//upper right bezier
beginShape();
stroke(255, 90);
fill(0,0);
vertex(367,197);
bezierVertex(380,260,380,310,445,420);
endShape();

//lower bezier
beginShape();
stroke(255, 90);
fill(0,0);
vertex(345,564);
bezierVertex(267,560,230,525,130,638);
endShape();

smooth();
ellipse(230,410,10,11);
ellipse(230,410,16,16);
ellipse(230,410,20,21);
ellipse(230,410,30,31);
ellipse(230,410,40,41);
ellipse(230,410,60,61);
ellipse(230,410,80,83);

//1st Layer post ellipse
beginShape();
vertex(180,410);
vertex(183,389);
vertex(187,378);
vertex(198,367);
vertex(216,359);
vertex(246,359);
vertex(260,366);
vertex(268,374);
vertex(272,382);
vertex(277,392);
vertex(280,412);
vertex(279,420);
vertex(275,431);
vertex(270,439);
vertex(260,449);
vertex(243,459);
vertex(229,459);
vertex(209,455);
vertex(193,444);
vertex(186,436);
vertex(180,410);
endShape();

//2nd Layer Post Ellipse
beginShape();
vertex(167,410);
bezierVertex(172,402,172,395,173,384);
vertex(173,384);
bezierVertex(177,378,177,378,179,370);
vertex(179,370);
bezierVertex(187,366,187,366,193,355);
vertex(193,355);
bezierVertex(205,353,205,353,216,345);
vertex(216,345);
bezierVertex(233,349,233,349,250,345);
vertex(250,345);
bezierVertex(256,351,256,351,266,353);
vertex(266,353);
bezierVertex(270,360,270,360,276,365);
vertex(276,365);
bezierVertex(278,373,278,373,283,376);
vertex(283,376);
bezierVertex(285,384,285,384,291,389);
vertex(291,390);
bezierVertex(289,400,289,400,292,412);
vertex(292,412);
bezierVertex(291,417,291,417,290,422);
vertex(290,422);
bezierVertex(287,430,287,430,286,438);
vertex(286,438);
bezierVertex(282,444,282,444,280,448);
vertex(280,448);
bezierVertex(274,450,274,450,265,459);
vertex(265,459);
bezierVertex(257,462,257,462,246,468);
vertex(246,468);
bezierVertex(240,467,240,467,231,470);
vertex(231,470);
bezierVertex(221,467,221,467,207,466);
vertex(207,466);
bezierVertex(198,461,198,461,184,454);
vertex(184,454);
bezierVertex(182,450,182,450,174,436);
vertex(174,436);
bezierVertex(172,423,172,423,167,410);
endShape();

//3rd tier post ellipse
beginShape();
vertex(154,409);
bezierVertex(160,394,160,394,161,377);
vertex(161,377);
bezierVertex(166,371,166,371,169,362);
vertex(169,362);
bezierVertex(177,358,177,358,186,347);
vertex(186,347);
bezierVertex(205,341,205,341,213,334);
vertex(213,334);
bezierVertex(233,338,233,338,254,335);
vertex(254,335);
bezierVertex(259,342,259,342,272,343);
vertex(272,343);
bezierVertex(277,351,277,351,285,355);
vertex(285,355);
bezierVertex(287,363,287,363,292,366);
vertex(293,366);
bezierVertex(296,375,296,375,303,387);
vertex(303,387);
bezierVertex(303,404,303,404,305,414);
vertex(305,414);
bezierVertex(303,419,303,419,303,425);
vertex(303,425);
bezierVertex(300,430,300,430,299,443);
vertex(299,443);
bezierVertex(293,449,293,449,290,456);
vertex(290,456);
bezierVertex(279,459,279,459,272,469);
vertex(272,469);
bezierVertex(258,472,258,472,247,480);
vertex(247,480);
bezierVertex(240,479,240,479,230,482);
vertex(230,482);
bezierVertex(221,478,221,478,201,478);
vertex(201,478);
bezierVertex(184,467,184,467,172,461);
vertex(172,461);
bezierVertex(169,455,169,455,162,443);
vertex(162,443);
bezierVertex(160,423,160,423,154,409);


endShape();

fill(130,100,53);
stroke(36,33,3);
ellipse(250,390,7,12);
ellipse(250,384,2,4);
fill(25,80,2,80);
ellipse(250,388,6,4);
fill(160,130,83);
ellipse(250,399,4,5);

line(250,397.5,240,390);
line(240,390,245,380);

line(250,396.5,260,405);
line(260,405,255,415);

line(250,397.5,260,390);
line(260,390,255,380);

line(250,396.5,240,405);
line(240,405,245,415);

line(250,397,243,396);
line(243,396,238,398);

line(250,397,257,396);
line(257,396,262,398);

line(250,397,247,409);
line(247,409,248,414);

line(250,397,253,409);
line(253,409,252,414);
}

