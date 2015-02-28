
size(800, 465);
background(232, 165, 28);
smooth();

//background
noStroke();
fill(121, 182, 115);
triangle(800, 0, 800, 465, 480, 465);
fill(224, 130, 0);
quad(680, 0, 800, 0, 480, 465, 360, 465);
fill(78, 29, 32);
quad(560, 0, 680, 0, 360, 465, 240, 465);
//horizontal stripes
fill(15, 25, 16);
quad(196, 47, 210, 30, 520, 290, 510, 306);
fill(133, 189, 142);
quad(218, 36, 232, 19, 530, 287, 522, 297);
fill(57, 138, 132);
quad(239, 25, 254, 8, 545, 278, 535, 291);
//
fill(169, 18, 2);
quad(440, 0, 560, 0, 240, 465, 120, 465);
fill(79, 178, 208, 210);
quad(320, 0, 440, 0, 120, 465, 0, 465);

//white+green rectangles
fill(216, 210, 180);
rect(39, 71, 85, 160);
//snakes
fill(199, 209, 172);
beginShape();
vertex(95, 380);
bezierVertex(95, 385, 96, 370, 90, 360);
bezierVertex(10, 250, 10, 200, 148, 170);
bezierVertex(180, 140, 155, 110, 153, 100);
bezierVertex(145, 65, 150, 45, 180, 25);
vertex(190, 36);
bezierVertex(140, 65, 170, 100, 172, 120);
bezierVertex(180, 150, 170, 180, 130, 180);
bezierVertex(25, 200, 25, 270, 96, 365);
bezierVertex(96, 365, 97, 380, 96, 380);
endShape();
fill(214, 121, 62);
beginShape();
vertex(96, 380);
bezierVertex(100, 380, 100, 350, 98, 373);
bezierVertex(18, 240, 18, 200, 148, 179);
bezierVertex(180, 160, 180, 129, 167, 100);
bezierVertex(178, 105, 140, 85, 180, 43);
vertex(185, 51);
bezierVertex(170, 70, 170, 85, 179, 120);
bezierVertex(180, 150, 180, 180, 130, 188);
bezierVertex(34, 200, 28, 250, 100, 373);
bezierVertex(96, 380, 96, 380, 96, 380);
endShape();
fill(85, 158, 112);
rect(50, 60, 85, 160);
fill(233, 223, 154);
rect(50, 47, 85, 17);

//balls
for (int i=56; i<=132; i=i+10) {  
  for (int j=51; j<=61; j=j+10)   
  {   
    if ((i+j)%1==0) {
      stroke(1, 150);
      fill(233, 223, 154);
    } 
    else {   
      noStroke(); 
      fill(233, 223, 154);
    }   
    ellipse (i, j, 7, 7);
  }
}  
noStroke();

//big, white ellipse
fill(236, 245, 190, 200);
ellipse(226, 145, 92, 92);

//white form
fill(225, 213, 187, 210);
beginShape();
vertex(340, 220);
bezierVertex(220, 130, 280, 10, 310, 10);
vertex(330, 42);
endShape();

//ellipse-cluster, upper left corner
fill(199, 140, 146);
ellipse(40, 32, 35, 35);
strokeWeight(3);
stroke(199, 120, 120, 200);
fill(199, 96, 100);
ellipse(40, 32, 13, 13);
noStroke();

//ellipse-cluster, right corner
fill(216, 211, 192, 200);
ellipse(752, 329, 26, 26);
ellipse(760, 365, 21, 21);
ellipse(715, 350, 3, 3);

strokeWeight(0.6);
stroke(60, 120, 80, 80);
fill(83, 163, 174, 130);
ellipse(750, 350, 35, 35);

fill(255, 195, 92, 140);
ellipse(733, 343, 16, 16);
ellipse(728, 360, 7, 7);
stroke(224, 130, 0, 150);
strokeWeight(2);
ellipse(773, 327, 9, 9);

noStroke();
fill(178, 113, 95);
ellipse(747, 375, 5, 5);

//small rectangles, left corner
fill(177, 194, 152, 230);
rect(180, 310, 20, 120);
fill(226, 207, 138, 245);
rect(187, 295, 26, 125);


//dots
for (int i=330; i<=410; i=i+10) {  
  for (int j=100; j<=180; j=j+10)   
  {   
    if ((i+j)%20==0) {   
      fill(213, 177, 83, 100);
    } 
    else {    
      fill(203, 218, 189, 230);
    }   
    ellipse (i, j, 3, 3);
  }
}  

for (int i=430; i<=480; i=i+10) {  
  for (int j=50; j<=130; j=j+10)   
  {   
    if ((i+j)%20==0) {   
      fill(213, 177, 83);
    } 
    else {    
      fill(203, 218, 189, 190);
    }   
    ellipse (i, j, 1.5, 1.5);
  }
}  

//rainbow from drop
fill(184, 199, 170);
beginShape();
vertex(455, 90);
bezierVertex(435, 80, 440, 120, 445, 120);
vertex(433, 120);
bezierVertex(429, 120, 428, 85, 445, 85);
endShape();
fill(187, 150, 133);
beginShape();
vertex(445, 85);
bezierVertex(429, 85, 428, 125, 436, 120);
vertex(423, 120);
bezierVertex(418, 120, 418, 76, 445, 80);
endShape();
fill(213, 130, 6);
beginShape();
vertex(445, 80);
bezierVertex(418, 80, 418, 120, 424, 120);
vertex(410, 120);
bezierVertex(407, 120, 409, 65, 447, 75);

endShape();

//red bg
fill(136, 21, 2);
beginShape();
vertex(340, 145);
bezierVertex(330, 90, 320, 30, 408, 48);
vertex(341, 145);
endShape();

//green small circle
fill(137, 174, 140, 180);
ellipse(390, 45, 30, 30);

//big, black form
fill(0, 0, 0);
beginShape();
vertex(450, 200);
bezierVertex(430, 200, 430, 400, 350, 210);
bezierVertex(450, 350, 300, 300, 310, 90);
bezierVertex(320, 20, 380, 20, 450, 40);
bezierVertex(600, -30, 600, 230, 475, 140);
bezierVertex(610, 90, 460, 5, 450, 70);
bezierVertex(400, 20, 300, 50, 350, 160);
bezierVertex(400, 300, 400, 250, 440, 200);
endShape(CLOSE);
beginShape();
vertex(450, 70);
bezierVertex(428, 100, 472, 100, 450, 70);
endShape(CLOSE);
beginShape();
vertex(475, 140);
bezierVertex(440, 100, 485, 90, 475, 120);
bezierVertex(480, 120, 485, 135, 475, 140);
endShape(CLOSE);

//checkerboards
for (int i=295; i<=320; i=i+5) {  
  for (int j=320; j<=345; j=j+5)   
  {   
    if ((i+j)%10==0) {   
      fill(203, 218, 189, 200);
    } 
    else {    
      fill(210, 160, 137, 200);
    }   
    rect (i, j, 5, 5);
  }
}  


for (int i=300; i<=350; i=i+10) {  
  for (int j=230; j<=280; j=j+10)   
  {   
    if ((i+j)%20==0) {   
      fill(213, 177, 83, 200);
    } 
    else {    
      fill(213, 228, 199, 200);
    }   
    rect (i, j, 10, 10);
  }
}  

//green small circle
fill(137, 174, 140, 190);
ellipse(390, 45, 30, 30);

//smaller forms, multiple colors
fill(229, 193, 79, 200);
beginShape();
vertex(464, 308);
bezierVertex(453, 315, 465, 245, 490, 237);
vertex(494, 244);
bezierVertex(494, 240, 461, 280, 468, 308);
endShape();
fill(196, 155, 161, 210);
beginShape();
vertex(475, 350);
bezierVertex(450, 290, 480, 230, 540, 225);
vertex(540, 237);
bezierVertex(510, 240, 460, 290, 485, 350);
endShape();
fill(105, 177, 163, 210);
beginShape();
vertex(470, 380);
bezierVertex(490, 380, 483, 360, 485, 350);
bezierVertex(460, 290, 505, 230, 560, 237);
vertex(560, 249);
bezierVertex(500, 245, 490, 290, 490, 350);
bezierVertex(490, 360, 490, 385, 473, 385);
endShape();
fill(212, 194, 89, 210);
beginShape();
vertex(490, 365);
bezierVertex(485, 290, 498, 240, 582, 247);
vertex(582, 257);
bezierVertex(510, 250, 491, 290, 495, 365);
endShape();

//weird, big form
fill(224, 193, 102);
beginShape();
vertex(545, 75);
bezierVertex(630, 60, 580, 210, 440, 200);
vertex(434, 208);
bezierVertex(500, 230, 540, 220, 565, 180);
bezierVertex(660, 140, 635, 90, 620, 65);
endShape();

//three waves
noFill();
stroke(0);
strokeWeight(0.4);
beginShape();
vertex(580, 350);
bezierVertex(585, 330, 600, 325, 601, 328);
bezierVertex(605, 328, 610, 328, 613, 323);
bezierVertex(620, 300, 630, 295, 645, 302);
bezierVertex(650, 304, 655, 304, 660, 293);
bezierVertex(661, 280, 670, 276, 690, 280);
endShape();
beginShape();
vertex(590, 360);
bezierVertex(595, 340, 610, 335, 611, 337);
bezierVertex(615, 338, 620, 338, 623, 333);
bezierVertex(630, 310, 640, 305, 655, 312);
bezierVertex(660, 314, 665, 314, 670, 303);
bezierVertex(671, 290, 680, 286, 700, 290);
endShape();
beginShape();
vertex(600, 370);
bezierVertex(605, 350, 620, 345, 621, 347);
bezierVertex(625, 348, 630, 348, 633, 343);
bezierVertex(640, 320, 650, 315, 665, 322);
bezierVertex(670, 324, 675, 324, 680, 313);
bezierVertex(681, 300, 690, 296, 710, 300);
endShape();

//small things
stroke(255,255,255);
triangle(348,298,370,280,378,308);
noStroke();
fill(214,155,35);
rect(345,360,8,8);
fill(190,136,112);
rect(325,420,5,5);
fill(241,192,100);
rect(280,360,4.5,4);
rect(150,330,6,5.7);
fill(207,205,96);
ellipse(185,240,23,23);
fill(218,120,95);
ellipse(185,240,19,19);
fill(68,122,109);
beginShape();
vertex(378,308);
bezierVertex(360,360,460,360,460,325);
bezierVertex(450,350,370,350,378,308);
endShape();
fill(232,191,75);
beginShape();
vertex(378,308);
bezierVertex(370,353,460,346,460,325);
bezierVertex(450,340,370,340,378,308);
endShape();
fill(124,185,141);
beginShape();
vertex(460,325);
bezierVertex(440,320,440,305,460,300);
bezierVertex(450,330,450,305,460,320);
endShape();
fill(201,184,94);
beginShape();
vertex(420,350);
bezierVertex(380,360,370,400,400,450);
bezierVertex(410,400,380,370,420,358);
endShape();
fill(142,186,151);
beginShape();
vertex(420,370);
bezierVertex(405,420,405,460,420,460);
endShape();

//form, upper right corner
fill(218,211,192);
ellipse(740,160,70,120);
fill(205,196,183);
ellipse(730,160,40,60);
fill(76,137,129);
beginShape();
vertex(710,180);
bezierVertex(700,40,750,20,714,180);
endShape();
ellipse(750,75,60,30);
fill(216,223,182);
beginShape();
vertex(710,270);
bezierVertex(660,180,680,145,680,140);
bezierVertex(690,160,720,160,750,150);
endShape();
fill(148,192,157);
ellipse(730,180,50,30);
ellipse(720,200,30,10);
strokeWeight(1);
stroke(255,255,255);
line(730,160,725,195);
line(733,160,728,195);
line(736,160,731,195);
line(739,160,734,195);


