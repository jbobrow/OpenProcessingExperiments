

size(500,500);
smooth();
background(55,97,191);
//planet
fill(153,117,144);
ellipse(240,600, 800,400);
//crater shadow
noStroke();
fill(70);
ellipse(77,477,50,30);
//crater
//left
noStroke();
fill(161,134,190);
ellipse(80,480,50,30);
//crater
//right
noStroke();
fill(70);
ellipse(452,448,50,30);//shadow
noStroke();
fill(161,134,190);
ellipse(455,450,50,30);

// robot head inside
//robotbrain
noStroke();
fill(172,175,184);
ellipse(240,60, 100,8);
int y= 60;
ellipse(220,y, 5,15);
ellipse(230,y, 6,18);
ellipse(240,y, 7,20);
ellipse(250,y, 6,18);
ellipse(260,y, 5,15);
//buttons on brain
fill(242,245,14);//yellow
ellipse(220,y, 3,12); 
fill(14,245,80); //green
ellipse(230,y, 4,16);
fill(213,55,43);//red
ellipse(240,y, 5,18);
fill(14,245,80); //green
ellipse(250,y, 4,16);
fill(242,245,14);//yellow
ellipse(260,y, 3,12);


//robotneckstem
fill(0);
beginShape();
vertex(235,90);
vertex(230,80);
vertex(250,80);
vertex(245,90);
endShape();
//eyes
fill(246,17,12);//red
beginShape();//left
vertex(210,55);
vertex(210,65);
vertex(200,68);
vertex(200,52);
endShape();
fill(210);
ellipse(205,60,7,7);//pupil
fill(246,17,12);//red
beginShape();//right
vertex(270,55);
vertex(270,65);
vertex(280,68);
vertex(280,52);
endShape();
fill(210);
ellipse(275,60,7,7);//pupil
//robot head outside
fill(185,167,152,130);
noStroke();
beginShape();
vertex(230,90);
vertex(210,80);
bezierVertex(160,70, 160,40, 240,40);
bezierVertex(320,40, 320,70, 270,80);
vertex(250,90);
endShape();
//neck opening
fill(0);
ellipse(240,90, 30,5);
//neck
fill(40);
stroke(200);
int x=240;
int dx=32;
int dy=5;
ellipse(x,95, dx,dy);
ellipse(x, 100,dx,dy);
ellipse(x, 105, dx,dy);
ellipse(x, 110, dx, dy);
// upper body
//connection to neck
fill(200);
noStroke();
beginShape();
vertex(223,111);
vertex(257,111);
vertex(260,120);
vertex(220,120);
endShape();

//thingies on sides of neck
//left
fill(130);
beginShape();
vertex(201,130);
vertex(172,128);
vertex(172,122);
vertex(225,120);
endShape();
rect(172,108, 6,20);
fill(170);
ellipse(176,124, 10,10);

fill(255, 100);
ellipse(174,124, 5,5);
fill(255, 100);
fill(255,247,153);
ellipse(175,97, 13,26);
//right
fill(130);
beginShape();
vertex(279,130);
vertex(308,128);
vertex(308,122);
vertex(255,120);
endShape();
rect(308,108, 6,20);
fill(170);
ellipse(310,124, 10,10);
fill(255, 100);
ellipse(312,124, 5,5);
fill(224,91,96);
ellipse(310,105, 26,13);
//body shadow
stroke(105,120);
strokeWeight(10);
fill(140);
beginShape();
vertex(190,160);
vertex(150,175);
bezierVertex(130,180, 130,290, 170,300);
//vertex(140,300);
vertex(310,300);
bezierVertex(340,290, 350,180, 330,170);
//vertex(330,170);
vertex(290,160);
vertex(270,175);
vertex(210,175);
endShape();
//under neck connection
noStroke();
fill(100);
beginShape();
vertex(221,119);
bezierVertex(215,110, 200,130, 200,130);
vertex(280,130);
bezierVertex(280,130, 265,110, 259,119);
endShape();
fill(230);
beginShape();
vertex(200,130);
vertex(190,145);
vertex(190,150);
vertex(200,160);
vertex(280,160);
vertex(290,150);
vertex(290,145);
vertex(280,130);
endShape();
ellipse(240,150, 100,30);
//grid
fill(247,228,12,140);
rect(220,131,42,29);
stroke(247,156,12);
strokeWeight(3);
line(220,131,220,160);
line(226,131,226,160);
line(232,131,232,160);
line(238,131,238,160);
line(244,131,244,160);
line(250,131,250,160);
line(256,131,256,160);
line(262,131,262,160);
//triangle on body
//left shadow
noFill();
stroke(75);
strokeWeight(13);
strokeJoin(ROUND);
beginShape();
vertex(175,160);
vertex(160,145);
vertex(155,180);
endShape();
//right shadow
beginShape();
vertex(300,160);
vertex(315,145);
vertex(320,180);
endShape();
//left
noFill();
stroke(150);
strokeWeight(10);
strokeJoin(ROUND);
beginShape();
vertex(175,160);
vertex(160,145);
vertex(155,180);
endShape();

//right
beginShape();
vertex(300,160);
vertex(315,145);
vertex(320,180);
endShape();



//lower body connection
noStroke();
fill(190);
ellipse(240,306,144,20);
fill(50);
ellipse(240,302,140,5);



//body
noStroke();
fill(140);
beginShape();
vertex(190,150);
vertex(150,170);
bezierVertex(130,180, 130,290, 170,300);
//vertex(140,300);
vertex(310,300);
bezierVertex(340,290, 350,180, 330,170);
//vertex(330,170);
vertex(290,150);
vertex(270,160);
vertex(210,160);
endShape();
//body top
noStroke();
fill(126,207,241,40);
beginShape();
vertex(190,150);
vertex(150,170);
bezierVertex(130,180, 130,290, 170,300);
//vertex(140,300);
vertex(310,300);
bezierVertex(340,290, 350,180, 330,170);
//vertex(330,170);
vertex(290,150);
vertex(270,160);
vertex(210,160);
endShape();




//control Panel
fill(240);
rect(208,160, 64,114);
fill(180);
rect(210,160, 60,20);
fill(1);
rect(210,180, 60,90);
fill(180);

ellipse(225,200,15,15); //left button
ellipse(255,200,15,15); //right button
fill(245);

arc(227,203, 18,18, radians(180),radians(270));
fill(230);
rect(220,220,40,25);
int b=225;
fill(236,28,36);//red
rect(223,b, 5,5);
fill(14,177,29);//green
rect(230,b,5,5);
fill(236,28,36);//red
rect(245,b,5,5);
fill(14,177,29);//green
rect(252,b,5,5);
fill(14,79,177);//blue
ellipse(225,240,5,5);
fill(245,121,12);//orange
ellipse(235,240,5,5);
fill(14,177,29);//green
ellipse(245,240,5,5);
fill(14,79,177);//blue
ellipse(255,240,5,5);
//bottom
fill(125);
stroke(90);
strokeWeight(2);
beginShape();//one
vertex(160,310);
bezierVertex(150,310, 150,320, 160,320);
vertex(320,320);
bezierVertex(330,320, 330,310, 320,310);
endShape();
beginShape();//two
vertex(160,320);
bezierVertex(150,320, 150,330, 160,330);
vertex(320,330);
bezierVertex(330,330, 330,320, 320,320);
endShape();
beginShape(); //three
vertex(160,330);
bezierVertex(150,330, 150,340, 160,340);
vertex(320,340);
bezierVertex(330,340, 330,330, 320,330);
endShape();
beginShape(); //four
vertex(160,340);
bezierVertex(150,340, 150,350, 160,350);
vertex(320,350);
bezierVertex(330,350, 330, 340, 320,340);
endShape();
//legs
//leg divider
fill(240);
noStroke( );
beginShape();
vertex(152,379);
vertex(145,400);
vertex(335,400);
vertex(329,379);
endShape();


// left leg
fill(125);
stroke(90);
strokeWeight(2.5);
beginShape();//one
vertex(160,350);
bezierVertex(150,350, 150,360, 160,360);
vertex(230,360);
bezierVertex(240,360, 240,350, 230,350);
endShape();
beginShape();//two
vertex(160,360);
bezierVertex(150,360, 150,370, 160,370);
vertex(230,370);
bezierVertex(240,370, 240,360, 230,360);
endShape();
beginShape(); //three
vertex(160,370);
bezierVertex(150,370, 150,380, 160,380);
vertex(230,380);
bezierVertex(240,380, 240,370, 230,370);
endShape();
beginShape(); //four
vertex(160,380);
bezierVertex(150,380, 150,390, 160,390);
vertex(230,390);
bezierVertex(240,390, 240,380, 230,380);
endShape();
//right leg
beginShape();//one
vertex(250,350);
bezierVertex(240,350, 240,360, 250,360);
vertex(320,360);
bezierVertex(330,360, 330,350, 320,350);
endShape();
beginShape();//two
vertex(250,360);
bezierVertex(240,360, 240,370, 250,370);
vertex(320,370);
bezierVertex(330,370, 330,360, 320,360);
endShape();
beginShape(); //three
vertex(250,370);
bezierVertex(240,370, 240,380, 250,380);
vertex(320,380);
bezierVertex(330,380, 330,370, 320,370);
endShape();
beginShape(); //four
vertex(250,380);
bezierVertex(240,380, 240,390, 250,390);
vertex(320,390);
bezierVertex(330,390, 330,380, 320,380);
endShape();
//bottom
beginShape();
vertex(160,420);
vertex(140,420);
bezierVertex(140,420, 135,425, 135,425);
vertex(125,495);
vertex(355,495);

bezierVertex(340,420, 345,425, 340,420);
endShape();
//shape on bottom
//left track
fill(0);
rect(146,435, 15,5);
rect(145.5,440, 15,5);
rect(145,445, 15,5);
rect(144.5,450, 15,5);
rect(144,455,15,5);
rect(143.5,460, 15,5);
rect(143,465, 15,5);
rect(142.5,470, 15,5);
rect(142,475,15,5);
rect(141.5,480, 15,5);
rect(141,485, 15,5);
rect(140.5,490, 15,5);
//middle track
fill(0);
rect(235,435, 10,5);
rect(235,440, 10,5);
rect(235,445, 10,5);
rect(235,450, 10,5);
rect(235,455,10,5);
rect(235,460, 10,5);
rect(235,465, 10,5);
rect(235,470, 10,5);
rect(235,475,10,5);
rect(235,480, 10,5);
rect(235,485, 10,5);
rect(235,490, 10,5);
//right track
fill(0);
rect(319,435, 15,5);
rect(319.5,440, 15,5);
rect(320,445, 15,5);
rect(320.5,450, 15,5);
rect(321,455,15,5);
rect(321.5,460, 15,5);
rect(322,465, 15,5);
rect(322.5,470, 15,5);
rect(323,475,15,5);
rect(323.5,480, 15,5);
rect(324,485, 15,5);
rect(324.5,490,15,5);

//left rect
fill(200);
noStroke();
beginShape();
vertex(170,435);
vertex(165,490);
vertex(220,490);
vertex(220,435);
endShape();
//right rect
beginShape();
vertex(260,435);
vertex(260,490);
vertex(315,490);
vertex(310,435);
endShape();

//leg divider under bottom leg
fill(240);
noStroke();
beginShape();
vertex(152,424);
vertex(145,430);
vertex(335,430);
vertex(329,424);
endShape();
// left leg under divider
fill(125);
stroke(90);
strokeWeight(2);
beginShape();//one
vertex(160,400);
bezierVertex(150,400, 150,405, 160,405);
vertex(230,405);
bezierVertex(240,405, 240,400, 230,400);
endShape();
beginShape();//two
vertex(160,405);
bezierVertex(150,405, 150,410, 160,410);
vertex(230,410);
bezierVertex(240,410, 240,405, 230,405);
endShape();
beginShape();//three
vertex(160,410);
bezierVertex(150,410, 150,415, 160,415);
vertex(230,415);
bezierVertex(240,415, 240,410, 230,410);
endShape();
beginShape();//four
vertex(160,415);
bezierVertex(150,415, 150,420, 160,420);
vertex(230,420);
bezierVertex(240,420, 240,415, 230,415);
endShape();
beginShape();//five
vertex(160,420);
bezierVertex(150,420, 150,425, 160,425);
vertex(230,425);
bezierVertex(240,425, 240,420, 230,420);
endShape();
// right leg under divider

beginShape();//one
vertex(250,400);
bezierVertex(240,400, 240,405, 250,405);
vertex(320,405);
bezierVertex(330,405, 330,400, 320,400);
endShape();
beginShape();//two
vertex(250,405);
bezierVertex(240,405, 240,410, 250,410);
vertex(320,410);
bezierVertex(330,410, 330,405, 320,405);
endShape();
beginShape();//three
vertex(250,410);
bezierVertex(240,410, 240,415, 250,415);
vertex(320,415);
bezierVertex(330,415, 330,410, 320,410);
endShape();
beginShape();//four
vertex(250,415);
bezierVertex(240,415, 240,420, 250,420);
vertex(320,420);
bezierVertex(330,420, 330,415, 320,415);
endShape();
beginShape();//five
vertex(250,420);
bezierVertex(240,420, 240,425, 250,425);
vertex(320,425);
bezierVertex(330,425, 330,420, 320,420);
endShape();
//arms
//left arm
//arm connect
//left
noStroke();
fill(130);
rect(140,190, 30,50);
ellipse(162,214.5,48,51);
//right
rect(307,190, 30,50);
ellipse(312,214.5, 48.5,50);
//arms
//left
fill(220);
stroke(50,50);
strokeWeight(5);
ellipse(155,214, 30,45);
noStroke();
fill(20);
ellipse(150,215, 10,45);//one
fill(90);
ellipse(147,216, 5,30);
fill(20);
ellipse(142,217, 10,45);//two
fill(90);
ellipse(139,218, 5,30);
fill(20);
ellipse(133,220, 12,47);//three
fill(90);
ellipse(130,221, 6,31);
fill(20);
ellipse(124,221, 13,48);//four
fill(90);
ellipse(121,222, 7,32);
fill(20);
ellipse(115,223, 14,49);//five
fill(90);
ellipse(110,223, 7,32);
fill(20);
ellipse(103,224, 14,49);//six
fill(90);
ellipse(99,225, 7,32);
ellipse(94,226, 14,49);//seven
fill(90);
ellipse(89,227, 7,32);
fill(20);
ellipse(86,226, 14,49);//eight
fill(90);
ellipse(82,227, 7,32);
//hand
fill(246,17,12);
beginShape();
vertex(82,220);
vertex(80,230);
vertex(62,230);
vertex(60,220);
endShape();
arc(50,225, 30,30, radians(220), radians(360+120)); 
//arc(50,223, 30,30, radians(170), radians(340));
//arms
//right
stroke(50,50);
strokeWeight(5);
fill(220);

ellipse(320,214, 30,45);
stroke(50,50);
strokeWeight(5);
fill(20);
ellipse(325,215, 10,45);//one
fill(90);
ellipse(328,216, 5,30);
fill(20);
ellipse(332,217, 10,45);//two
fill(90);
ellipse(335,218, 5,30);
fill(20);
ellipse(339,220, 12,47);//three
fill(90);
ellipse(344,221, 6,31);
fill(20);
ellipse(349,221, 13,48);//four
fill(90);
ellipse(354,222, 7,32);
fill(20);
ellipse(358,223, 14,49);//five
fill(90);
ellipse(362,223, 7,32);
fill(20);
ellipse(366,224, 14,49);//six
fill(90);
ellipse(369,225, 7,32);
ellipse(373,226, 14,49);//seven
fill(90);
ellipse(377,227, 7,32);
fill(20);
ellipse(381,226, 14,49);//eight
fill(90);
ellipse(385,227, 7,32);
//hand
fill(246,17,12);
beginShape();
vertex(385,220);
vertex(383,230);
vertex(410,230);
vertex(408,220);
endShape();
arc(405,225, 30,30, radians(20), radians(200)); 
arc(405,223, 30,30, radians(170), radians(340)); 








