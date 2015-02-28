

int hours;
int minutes;
int seconds;

void setup() {
 size(600, 600);
 background (214, 201, 121);
 smooth();
}

void draw() {
  
     // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
   
  }

stroke(.5);
 strokeWeight(1.5);
 line (5, 0, 0, 5);
 line (10, 0, 0, 10);
 line (15, 0, 0, 15);
 line (20, 0, 0, 20);
 line (25, 0, 0, 25);
 line (30, 0, 0, 30);
 line (35, 0, 0, 35);
 line (40, 0, 0, 40);
 line (45, 0, 0, 45);
 line (50, 0, 0, 50);
 line (55, 0, 0, 55);
 line (60, 0, 0, 60);
 line (65, 0, 0, 65);
 line (70, 0, 0, 70);
 line (75, 0, 0, 75);
 line (80, 0, 0, 80);
 line (85, 0, 0, 85);
 line (90, 0, 0, 90);
 line (95, 0, 0, 95);
 line (100, 0, 0, 100);
 line (105, 0, 0, 105);
 line (110, 0, 0, 110);
 line (115, 0, 0, 115);
 line (120, 0, 0, 120);
 line (125, 0, 0, 125);
 line (130, 0, 0, 130);
 line (135, 0, 0, 135);
 line (140, 0, 0, 140);
 line (145, 0, 0, 145);
 line (150, 0, 0, 150);
 line (155, 0, 0, 155);
 line (160, 0, 0, 160);
 line (165, 0, 0, 165);
 line (170, 0, 0, 170);
 line (175, 0, 0, 175);
 line (180, 0, 0, 180);
 line (185, 0, 0, 185);
 line (190, 0, 0, 190);
 line (195, 0, 0, 195);
 line (200, 0, 0, 200);
 line (205, 0, 0, 205);
 line (210, 0, 0, 210);
 line (215, 0, 0, 215);
 line (220, 0, 0, 220);
 line (225, 0, 0, 225);
 line (230, 0, 0, 230);
 line (235, 0, 0, 235);
 line (240, 0, 0, 240);
 line (245, 0, 0, 245);
 line (250, 0, 0, 250);
 line (255, 0, 0, 255);
 line (260, 0, 0, 260);
 line (265, 0, 0, 265);
 line (270, 0, 0, 270);
 line (275, 0, 0, 275);
 line (280, 0, 0, 280);
 line (285, 0, 0, 285);
 line (290, 0, 0, 290);
 line (295, 0, 0, 295);
 line (300, 0, 0, 300);
 line (305, 0, 0, 305);
 line (310, 0, 0, 310);
 line (315, 0, 0, 315);
 line (320, 0, 0, 320);
 line (325, 0, 0, 325);
 line (330, 0, 0, 330);
 line (335, 0, 0, 335);
 line (340, 0, 0, 340);
 line (345, 0, 0, 345);
 line (350, 0, 0, 350);
 line (355, 0, 0, 355);
 line (360, 0, 0, 360);
 line (365, 0, 0, 365);
 line (370, 0, 0, 370);
 line (375, 0, 0, 375);
 line (380, 0, 0, 380);
 line (385, 0, 0, 385);
 line (390, 0, 0, 390);
 line (395, 0, 0, 395);
 line (400, 0, 0, 400);
 line (405, 0, 0, 405);
 line (410, 0, 0, 410);
 line (415, 0, 0, 415);
 line (420, 0, 0, 420);
 line (425, 0, 0, 425);
 line (430, 0, 0, 430);
 line (435, 0, 0, 435);
 line (440, 0, 0, 440);
 line (445, 0, 0, 445);
 line (450, 0, 0, 450);
 line (455, 0, 0, 455);
 line (460, 0, 0, 460);
 line (465, 0, 0, 465);
 line (470, 0, 0, 470);
 line (475, 0, 0, 475);
 line (480, 0, 0, 480);
 line (485, 0, 0, 485);
 line (490, 0, 0, 490);
 line (495, 0, 0, 495);
 line (500, 0, 0, 500);
 line (505, 0, 0, 505);
 line (510, 0, 0, 510);
 line (515, 0, 0, 515);
 line (520, 0, 0, 520);
 line (525, 0, 0, 525);
 line (530, 0, 0, 530);
 line (535, 0, 0, 535);
 line (540, 0, 0, 540);
 line (545, 0, 0, 545);
 line (550, 0, 0, 550);
 line (555, 0, 0, 555);
 line (560, 0, 0, 560);
 line (565, 0, 0, 565);
 line (570, 0, 0, 570);
 line (575, 0, 0, 575);
 line (580, 0, 0, 580);
 line (585, 0, 0, 585);
 line (590, 0, 0, 590);
 line (595, 0, 0, 595);
 line (600, 0, 0, 600);
 line (600, 5, 5, 600);
 line (600, 10, 10, 600);
 line (600, 15, 15, 600);
 line (600, 20, 20, 600);
 line (600, 25, 25, 600);
 line (600, 30, 30, 600);
 line (600, 35, 35, 600);
 line (600, 40, 40, 600);
 line (600, 45, 45, 600);
 line (600, 50, 50, 600);
 line (600, 55, 55, 600);
 line (600, 60, 60, 600);
 line (600, 65, 65, 600);
 line (600, 70, 70, 600);
 line (600, 75, 75, 600);
 line (600, 80, 80, 600);
 line (600, 85, 85, 600);
 line (600, 90, 90, 600);
 line (600, 95, 95, 600);
 line (600, 100, 100, 600);
 line (600, 105, 105, 600);
 line (600, 110, 110, 600);
 line (600, 115, 115, 600);
 line (600, 120, 120, 600);
 line (600, 125, 125, 600);
 line (600, 130, 130, 600);
 line (600, 135, 135, 600);
 line (600, 140, 140, 600);
 line (600, 145, 145, 600);
 line (600, 150, 150, 600);
 line (600, 155, 155, 600);
 line (600, 160, 160, 600);
 line (600, 165, 165, 600);
 line (600, 170, 170, 600);
 line (600, 175, 175, 600);
 line (600, 180, 180, 600);
 line (600, 185, 185, 600);
 line (600, 190, 190, 600);
 line (600, 195, 195, 600);
 line (600, 200, 200, 600);
 line (600, 205, 205, 600);
 line (600, 210, 210, 600);
 line (600, 215, 215, 600);
 line (600, 220, 220, 600);
 line (600, 225, 225, 600);
 line (600, 230, 230, 600);
 line (600, 235, 235, 600);
 line (600, 240, 240, 600);
 line (600, 245, 245, 600);
 line (600, 250, 250, 600);
 line (600, 255, 255, 600);
 line (600, 260, 260, 600);
 line (600, 265, 265, 600);
 line (600, 270, 270, 600);
 line (600, 275, 275, 600);
 line (600, 280, 280, 600);
 line (600, 285, 285, 600);
 line (600, 290, 290, 600);
 line (600, 295, 295, 600);
 line (600, 300, 300, 600);
 line (600, 305, 305, 600);
 line (600, 310, 310, 600);
 line (600, 315, 315, 600);
 line (600, 320, 320, 600);
 line (600, 325, 325, 600);
 line (600, 330, 330, 600);
 line (600, 335, 335, 600);
 line (600, 340, 340, 600);
 line (600, 345, 345, 600);
 line (600, 350, 350, 600);
 line (600, 355, 355, 600);
 line (600, 360, 360, 600);
 line (600, 365, 365, 600);
 line (600, 370, 370, 600);
 line (600, 375, 375, 600);
 line (600, 380, 380, 600);
 line (600, 385, 385, 600);
 line (600, 390, 390, 600);
 line (600, 395, 395, 600);
 line (600, 400, 400, 600);
 line (600, 405, 405, 600);
 line (600, 410, 410, 600);
 line (600, 415, 415, 600);
 line (600, 420, 420, 600);
 line (600, 425, 425, 600);
 line (600, 430, 430, 600);
 line (600, 435, 435, 600);
 line (600, 440, 440, 600);
 line (600, 445, 445, 600);
 line (600, 450, 450, 600);
 line (600, 455, 455, 600);
 line (600, 460, 460, 600);
 line (600, 465, 465, 600);
 line (600, 470, 470, 600);
 line (600, 475, 475, 600);
 line (600, 480, 480, 600);
 line (600, 485, 485, 600);
 line (600, 490, 490, 600);
 line (600, 495, 495, 600);
 line (600, 500, 500, 600);
 line (600, 505, 505, 600);
 line (600, 510, 510, 600);
 line (600, 515, 515, 600);
 line (600, 520, 520, 600);
 line (600, 525, 525, 600);
 line (600, 530, 530, 600);
 line (600, 535, 535, 600);
 line (600, 540, 540, 600);
 line (600, 545, 545, 600);
 line (600, 550, 550, 600);
 line (600, 555, 555, 600);
 line (600, 560, 560, 600);
 line (600, 565, 565, 600);
 line (600, 570, 570, 600);
 line (600, 575, 575, 600);
 line (600, 580, 580, 600);
 line (600, 585, 585, 600);
 line (600, 590, 590, 600);
 line (600, 595, 595, 600);
 
 
 
 
 noStroke();
 fill(234, 197, 152);   //neck color
 rect (173, 451, 255, 155); //neck
 
 
noStroke();
 fill(254, 212, 164);   //face color 
 rect (149, 344, 307, 102); //face shape 1
 rect (127, 180, 344, 169); //face shape 2
 rect (173, 437, 259, 65); //face shape 3
 arc(296, 507, 251, 66, .3, 2.75); //chin shape
 arc(304, 460, 279, 179, PI / 2, 3 * PI / 2); //corner of chin 1
 arc(304, 460, 279, 179, -PI / 2, 3 * PI / 2); //corner of chin 2
 arc(166, 357, 113, 126, PI / 2, 3 * PI / 2); //ear 1
 arc(436, 357, 113, 137, -PI / 2, 3 * PI / 2); //ear 2
 ellipse (177, 448, 52, 52);
 ellipse (242, 549, 67, 45);
 ellipse (350, 549, 67, 45);
 ellipse (218, 527, 37, 35);
 ellipse (433, 438, 43, 43);
 ellipse (378, 527, 43, 44);
 rect (230, 514, 136, 55); //face shape 4
  
  noStroke();
  fill(254, 212, 164);
  beginShape();
  curveVertex(147, 444); // the first control point
  curveVertex(147, 444); // is also the start point of curve
  curveVertex(177, 514);
  curveVertex(230, 569); // the last point of curve
  curveVertex(230, 569); // is also the last control point
  endShape();
  
  noStroke();
  fill(254, 212, 164);
  beginShape();
  curveVertex(456, 444); // the first control point
  curveVertex(456, 444); // is also the start point of curve
  curveVertex(422, 514);
  curveVertex(362, 569); // the last point of curve
  curveVertex(362, 569); // is also the last control point
  endShape();

 
 
 
 
 noStroke();
 fill(255, 255, 255);   //eyeball 1 color white
 ellipse(230, 323, 65, 30);  //eyeball 1
 
 fill(84, 160, 190);   //iris 1 color 
 ellipse(230, 323, 25, 25);  // iris 1
 
 noStroke();
 fill(255, 255, 255);   //eyeball 2 color white
 ellipse(365, 323, 65, 30);  //eyeball 2
 
 fill(84, 160, 190);   //iris 2
 ellipse(366, 323, 25, 25);   //iris 2
 
   fill(16, 2, 1);  //pupil 1 color
 ellipse(230, 323, 17, 17); //pupil 1 shape
 
  fill(16, 2, 1); //pupil 2 color
 ellipse(366, 323, 17, 17);  //pupil 2 shape 
 
  fill(16, 2, 1);  //nostril 1 color
 ellipse(272, 410, 19, 6); //nostril 1
 
  fill(16, 2, 1); //nostril 2 color
 ellipse(318, 410, 19, 6);  //nostril 2 


 
 noStroke();
 fill(145, 114, 96);   //hair color
 ellipse(112, 314, 65, 65);  //hair
 ellipse(120, 260, 55, 55);  //hair
 ellipse(140, 337, 13, 13);  //hair
 ellipse(147, 213, 40, 40);  //hair
 ellipse(106, 219, 63, 63);  //hair
 ellipse(90, 206, 31, 31);  //hair
 ellipse(111, 182, 40, 40);  //hair
 ellipse(167, 175, 64, 64);  //hair
 ellipse(209, 124, 140, 140);  //hair
 ellipse(119, 132, 33, 33);  //hair
 ellipse(107, 158, 38, 38);  //hair
 ellipse(126, 185, 71, 71);  //hair
 ellipse(177, 192, 40, 40);  //hair
 ellipse(150, 225, 48, 48);  //hair
 ellipse(167, 78, 52, 52);  //hair
 ellipse(149, 104, 40, 40);  //hair
 ellipse(99, 247, 31, 31);  //hair
 ellipse(101, 297, 37, 37);  //hair
 ellipse(96, 250, 37, 37);  //hair
 ellipse(87, 277, 30, 30);  //hair
 ellipse(135, 149, 46, 46);  //hair
 ellipse(132, 116, 27, 27);  //hair
 ellipse(171, 196, 37, 37);  //hair
 ellipse(141, 346, 14, 14);  //hair
 ellipse(142, 356, 13, 13);  //hair
 ellipse(143, 366, 12, 12);  //hair
 ellipse(144, 376, 12, 12);  //hair
 ellipse(145, 386, 11, 11);  //hair
 ellipse(146, 396, 10, 10);  //hair
 ellipse(147, 406, 9, 9);  //hair
 ellipse(148, 320, 26, 26);  //hair
 ellipse(149, 343, 22, 28);  //hair
 ellipse(128, 341, 25, 25);  //hair
 ellipse(205, 188, 26, 26);  //hair
 ellipse(232, 185, 45, 39);  //hair
 ellipse(271, 194, 39, 39);  //hair
 ellipse(241, 143, 125, 125);  //hair
 ellipse(328, 130, 132, 132);  //hair
 ellipse(194, 67, 36, 39);  //hair
 ellipse(224, 60, 30, 30);  //hair
 ellipse(254, 64, 63, 49);  //hair
 ellipse(263, 48, 63, 49);  //hair
 ellipse(290, 40, 52, 49);  //hair
 ellipse(335, 41, 72, 72);  //hair
 ellipse(279, 85, 97, 97);  //hair
 ellipse(308, 186, 39, 34);  //hair
 ellipse(336, 190, 26, 27);  //hair
 ellipse(372, 192, 54, 42);  //hair
 ellipse(401, 205, 29, 29);  //hair
 ellipse(431, 207, 42, 40);  //hair
 ellipse(393, 156, 100, 100);  //hair
 ellipse(419, 123, 50, 55);  //hair
 ellipse(369, 94, 72, 74);  //hair
 ellipse(368, 51, 24, 23);  //hair
 ellipse(401, 97, 26, 26);  //hair
 ellipse(412, 123, 74, 56);  //hair
 ellipse(459, 140, 45, 45);  //hair
 ellipse(487, 165, 37, 37);  //hair
 ellipse(465, 171, 65, 65);  //hair
 ellipse(473, 208, 53, 53);  //hair
 ellipse(440, 175, 61, 61);  //hair
 ellipse(443, 204, 45, 45);  //hair
 ellipse(465, 210, 38, 38);  //hair
 ellipse(459, 245, 27, 27);  //hair
 ellipse(262, 44, 61, 42);  //hair
 ellipse(497, 192, 21, 21);  //hair
 ellipse(443, 227, 60, 60);  //hair
 ellipse(490, 260, 47, 47);  //hair
 ellipse(475, 280, 54, 54);  //hair
 ellipse(477, 233, 54, 54);  //hair
 ellipse(468, 317, 42, 42);  //hair
 ellipse(461, 346, 14, 14);  //hair
 ellipse(460, 356, 13, 13);  //hair
 ellipse(459, 366, 12, 12);  //hair
 ellipse(458, 376, 12, 12);  //hair
 ellipse(457, 386, 11, 11);  //hair
 ellipse(456, 396, 10, 10);  //hair
 ellipse(455, 406, 9, 9);  //hair
 ellipse(470, 346, 41, 40);  //hair
 ellipse(470, 346, 41, 40);  //hair
 ellipse(493, 337, 32, 32);  //hair
 ellipse(495, 309, 35, 36);  //hair

 
 
 
 
 stroke(1);
 strokeWeight(1.5);
 line (245, 475, 357, 475); //lip line
 
 stroke(145, 114, 96);
 strokeWeight(5);
 line (199, 291, 264, 260); //eyebrow line 1
 line (325, 262, 395, 298); //eyebrow line 2
 
 noStroke();
 fill(254, 212, 164); //bottom eyelid 1 color
 arc(227, 344, 55, 25, -PI, 0); //eyelid 1 shape
 
 fill(254, 212, 164); // bottom eyelid 2 color
 arc(365, 344, 55, 25, -PI, 0); //eyelid 1 shape
 rect (197, 303, 78, 5); //top eyelid 1
 rect (331, 305, 78, 5); //top eyelid 2
 
 fill(0); // black color 
 rect (242, 473, 115, 61); //black mouth
 
 noStroke();
 fill(255); // white color 
 rect (242, 473, 116, 10); //white teeth top
 rect (242, 524, 116, 11); //white teeth bottom
 
 fill(232, 175, 148); //top lip color
 arc(298, 473, 111, 25, -PI, 0); //top lip shape
 
 arc(300, 530, 115, 35, .3, 2.75); //bottom lip shape
 
 //spiderparts

fill(39, 20, 20); //dark brown
ellipse(276, 375, 69, 69);  //big spider body
ellipse(311, 353, 36, 36);  //spider head

fill(165, 24, 46); //red
ellipse(309, 346, 8, 8);  //spider eye 1
ellipse(318, 355, 8, 8);  //spide eye 2

stroke (39, 20, 20); //dark brown
line (320, 336, 327, 324);  //spider fang 1
line (325, 343, 339, 340);  //spider fang 2

strokeWeight(4);
stroke (39, 20, 20); //dark brown
line (297, 342, 281, 315);  //leg 1 segment 1
line (281, 315, 291, 300);  //leg 1 segment 2
line (294, 347, 271, 320);  //leg 2 segment 1
line (271, 320, 281, 305);  //leg 2 segment 2
line (315, 367, 339, 382);  //leg 3 segment 1
line (339, 382, 357, 377);  //leg 3 segment 2
line (311, 369, 332, 394);  //leg 4 segment 1
line (332, 394, 360, 398);  //leg 4 segment 2

 
 
 
    // center sketch
  translate(300,350);
  rotate(radians(90));
  noFill();
  
    // hour hand
  strokeWeight(10);
  stroke(39, 20, 20);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(0,0, -100,0);
  popMatrix();
  
    // minute hand
  strokeWeight(7);
  stroke(39, 20, 20);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,0, -120,0);
  popMatrix();
  
    // second hand
  strokeWeight(4);
  stroke(39, 20, 20);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -168,0);
  popMatrix();
  

 
}


 

