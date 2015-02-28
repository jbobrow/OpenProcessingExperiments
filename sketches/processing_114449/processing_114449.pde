
// 利用擺盪、和色彩random
//建構活潑視覺效果
//透過滑鼠互動，強化圖像移動^^
// ClarkLi
int constant = 150;
float angle = 0.05;
int scalar = 30;
float speed = 0.05;
int ballx = 0;
int bally = 0;

void setup() {   
size(480, 600); 
background(222,224,222);
smooth();
rectMode(CENTER);
}

void draw() { 
background(222,224,222);

noStroke();             //big orange color
fill(250,random(140),3);
beginShape();
vertex(179,394);
bezierVertex(194, 393, 203,409, 202, 420);
vertex(232,421);
vertex(235,406);
vertex(237,392);
vertex(240,374);
vertex(184,371);
endShape();

noStroke();             //1-4 red
fill(random(215),55,2);
beginShape();
vertex(190,450);
bezierVertex(188, 460, 178,466, 177, 471);
vertex(184,492);
vertex(223,490);
vertex(227,458);
endShape();


noStroke();             //1-5 black
fill(1,1,1);
beginShape();
vertex(184,492);
bezierVertex(183, 505, 212,526, 220, 523);
vertex(223,490);
endShape();

noStroke();             //2-7 red
fill(random(220),54,4);
beginShape();
vertex(220,523);
bezierVertex(224, 530, 265,525, 273, 524);
vertex(273,492);
vertex(223,490);
endShape();

noStroke();             //3-4 black
fill(1,1,1);
beginShape();
vertex(273,524);
bezierVertex(282, 526, 309,503, 311, 500);
vertex(273,492);
endShape();

noStroke();             //3-3 black
fill(229,random(39),8);
beginShape();
vertex(311,500);
bezierVertex(316, 495, 322,480, 323, 476);
vertex(270,471);
vertex(273,492);
endShape();

noStroke();             //3-2 black
fill(1,1,1);
beginShape();
vertex(323,476);
bezierVertex(330, 472, 324,421, 322, 422);
vertex(294,422);
vertex(293,473);
endShape();

noStroke();             //1-1 black
fill(1,1,1);
beginShape();
vertex(179,394);
bezierVertex(192, 392, 204,410, 200, 420);
vertex(177,413);
endShape();

noStroke();             //1-3-1 black
fill(1,1,1);
beginShape();
vertex(190,450);
bezierVertex(185, 460, 180,473, 175, 473);
vertex(174,445);
endShape();

noStroke();             //right eye blue
fill(46,70,random(171));
beginShape();
vertex(418,335);
bezierVertex(409, 319, 420,265, 468, 283);
vertex(456,303);
bezierVertex(438, 295, 423,314, 432, 329);
endShape();

noStroke();             //right eye black
fill(1,1,1);
beginShape();
vertex(456,303);
bezierVertex(438, 295, 423,314, 432, 329);
bezierVertex(455, 315, 455,305, 432, 329);
endShape();

noStroke();             //right eye red
fill(random(225),54,2);
beginShape();
vertex(456,303);
bezierVertex(467, 318, 465,348, 431, 330);
bezierVertex(441, 330, 455,307, 456, 303);
endShape();

noStroke();             //right eye big black
fill(1,1,1);
beginShape();
vertex(468,283);
bezierVertex(498, 295, 476,398, 418, 335);
vertex(431,330);
bezierVertex(465,348,467, 318, 456, 303);
endShape();


noStroke();       //other colors     
fill(1,1,1);
quad(193,438,230,439,227,458,191,450);            
fill(random(42),67,10);
quad(202,420,232,421,230,439,193,438);
fill(20,random(50),141);
quad(177,413,202,420,191,450,175,445);

fill(27,random(51),156);
quad(240,374,256,374,256,392,237,392);
fill(1,1,1);
quad(256,392,237,392,235,406,254,406);
fill(1,1,1);
quad(256,374,256,392,273,392,274,374);
quad(232,421,273,422,272,439,230,439);
quad(227,458,273,467,273,492,223,490);
fill(random(210),49,4);
quad(256,392,273,392,273,406,254,406);
noStroke();
fill(15,random(48),147);
quad(273,406,295,406,294,422,273,422);
noStroke();
fill(50,random(77),16);
quad(273,422,294,422,293,473,274,471);
fill(random(240),49,4);
quad(295,406,319,406,322,422,294,422);

noStroke();
fill(random(53),74,13);
quad(235,406,254,406,252,422,232,421);
fill(253,random(242),4);
quad(252,422,273,422,273,406,254,406);
fill(random(19),50,150);
quad(230,439,272,439,273,467,227,458);
 
noStroke();        //right small red
fill(random(211),random(45),7);
beginShape();
vertex(409,105);
bezierVertex(405, 134, 426,136, 438, 119);
bezierVertex(437, 111, 400,106, 409, 105);
endShape();

noStroke();        //right small black
fill(1,1,1);
beginShape();
vertex(409,105);
bezierVertex(421, 80, 445,93, 438, 119);
bezierVertex(437, 111, 400,106, 409, 105);
endShape();

noStroke();         //right small black 2
fill(1,1,1);
beginShape();
vertex(438,119);
bezierVertex(448, 124, 464,145, 466, 151);
bezierVertex(450, 150, 472,133, 425, 130);
bezierVertex(433, 132, 440,122, 438, 119);
endShape();

noStroke();       //right small black 3
fill(1,1,1);
beginShape();
vertex(466,151);
bezierVertex(468, 160, 473,169, 473, 181);
vertex(480,175);
vertex(480,160);
endShape();


//............................................................. 

float x=constant + cos(angle) * scalar;
float y=constant + cos(angle) * scalar;
angle = angle+speed;
 
noStroke();      //left big red cercal
fill(random(200),random(68),12); 
ellipse(112,96,64,64);


noStroke();      //big noom
fill(24,65,10);
noStroke();
beginShape();
vertex(150+x,9);//265,9
bezierVertex(265, 9, -50,105, 204, 233);
bezierVertex(153, 161, 239,8, 150+x, 9);
endShape();



noStroke();    // big moon black
fill(1,1,1);
stroke(0);
beginShape();
vertex(190,160);
bezierVertex(181, 177, 195,231, 204, 233);
bezierVertex(210, 229, 184,239, 155, 203);
bezierVertex(140, 203, 183,161, 190, 160);
endShape();

noStroke();       //big red cercal black
fill(1,1,1);
stroke(0);
beginShape();
vertex(138,74);
bezierVertex(151, 104, 123,127, 104, 125);
bezierVertex(104, 106, 131,74, 138, 74);
endShape();

noFill();       //hair1
stroke(0);
beginShape();
vertex(25,y);//25,83
bezierVertex(5, 42, 60,20, 91, 70);//91,70
endShape();

noFill();       //hair2
stroke(0);
beginShape();
vertex(38,y);
bezierVertex(15, 83, 65,40, 85, 76);
endShape();

noFill();        //hair3
stroke(0);
beginShape();
vertex(71,y);
bezierVertex(33, 100, 65,70, 80, 87);
endShape();


if (mousePressed) {
noFill();        //big line
stroke(0);
beginShape();
vertex(x+200,0);
bezierVertex(308, 45, 258,105, 195, 155);
bezierVertex(7, 339, 15,522, 76, 515);
bezierVertex(165, 530, 232,397, 181, 395);
bezierVertex(129, 391+(30*(mouseX-391)/391), 127,423+(30*(mouseX-423)/423), 127,423+(30*(mouseY-423)/423));
endShape();


fill(1,1,1);       //left black cercal
stroke(0);
beginShape();
vertex(95,424+(30*(mouseY-424)/424));//95,424
bezierVertex(128, 391+(30*(mouseY-391)/391), 150,441+(30*(mouseY-441)/441), 117, 462+(30*(mouseY-462)/462));
bezierVertex(91, 480+(30*(mouseY-480)/480), 67,455+(30*(mouseY-455)/455), 95, 424+(30*(mouseY-424)/424));
endShape();
}

else {
  
noFill();        //big line
stroke(0);
beginShape();
vertex(x+200,0);
bezierVertex(308, 45, 258,105, 195, 155);
bezierVertex(7, 339, 15,522, 76, 515);
bezierVertex(165, 530, 232,397, 181, 395);
bezierVertex(129, 391, 127,423, 127,423);
endShape();


fill(1,1,1);       //left black cercal
stroke(0);
beginShape();
vertex(95,424);//95,424
bezierVertex(128, 391, 150,441, 117, 462);
bezierVertex(91, 480, 67,455, 95, 424);
endShape();

}



noFill();         //big bazierline
stroke(0);
beginShape();
vertex(440,180);
bezierVertex(392, 186, 307,203, 297, 216);
bezierVertex(278, 227, 277,226, 266, 237);
bezierVertex(255, 247, 246,271, 237, 279);
bezierVertex(227, 288, 184,355, 184, 371);
bezierVertex(181, 390, 166,427, 178, 473);
bezierVertex(190, 518, 199,531, 273, 524);
bezierVertex(288, 522, 318,501, 323, 476);
bezierVertex(327, 451, 327,443, 322, 420);
bezierVertex(317, 400, 291,283, 322, 254);
bezierVertex(333, 242, 325,242, 368, 217);
bezierVertex(383, 206, 428,196, 436, 194);
endShape();

fill(1,1,1);        //black horse
stroke(0);
beginShape();
vertex(279,167);//279,167
bezierVertex(306, 174, 306,265, 266, 237);
bezierVertex(257, 232, 290,192, 270, 192);
bezierVertex(258, 192, 255,203, 255, 207);
bezierVertex(258, 221, 221,240, 233, 200);
bezierVertex(236, 184, 263,150,279,167);
endShape();

noStroke();         //black house red
fill(random(199),48,3);
beginShape();
vertex(297,216);
bezierVertex(303, 231, 273,257, 266, 237);
bezierVertex(286, 214, 267,234, 297, 216);
endShape();

fill(1,1,1);         //black bean
stroke(0);
beginShape();
vertex(322,254);//322,254
bezierVertex(309, 224, 337,216, 357, 223);
bezierVertex(378, 231, 400,275, 305+x/3, 316);//354,316
bezierVertex(347, 321, 383,290, 322, 254);
endShape();

noStroke();        //black bean blue
fill(25,62,random(140));
beginShape();
vertex(322,254);
bezierVertex(309, 224, 337,216, 357, 223);
bezierVertex(372, 221, 345,224, 357, 223);
endShape();

noFill();          //down line 1
stroke(random(150),1,1);
beginShape();
if (mousePressed) {  
vertex(mouseX,mouseY);//236,567;   
} 
else {
vertex(236,400+y);//236,567
}
bezierVertex(246, 584, 351,595, 362, 578);
bezierVertex(368, 561, 373,534, 371+(30*(mouseX-371)/371),511);//mouseX, mouseY
endShape();

noFill();      //right bezierline
stroke(0);
beginShape();
vertex(370,107);
bezierVertex(331, 118, 338,153, 381, 146);
bezierVertex(423, 138, 439,180, 436, 194);
bezierVertex(433, 207, 441,229, 410, 264);
bezierVertex(380, 298, 367,341, 418, 335);
bezierVertex(468, 329, 490,214, 473, 181);
bezierVertex(468, 168, 467,140, 438, 119);
bezierVertex(409, 98, 385,102, 370, 107);
endShape();

fill(1,1,1);      //down black bean
stroke(0);
beginShape();
vertex(371+(30*(mouseX-371)/371),511);//371,511//mouseX,mouseY
bezierVertex(407+(30*(mouseX-407)/407), 518, 410+(30*(mouseX-410)/410),491, 388+(30*(mouseX-388)/388), 480);//407, 518, 410,491, 388, 480//mouseX+36, mouseY+7, mouseX+39,mouseY-20, mouseX+17, mouseY-30
bezierVertex(363+(30*(mouseX-363)/363), 475, 340+(30*(mouseX-340)/340),497, 371+(30*(mouseX-371)/371), 511);//363, 475, 340,497, 371, 511//mouseX-8, mouseY-36, mouseX-31,mouseY-14, mouseX, mouseY
endShape();

//...........oringinal line..........

line(449,205,480,175);
line(273,333,274,374);
line(240,355,240,374);
line(273,406,273,422);
line(272,439,273,467);
line(295,396,294,422);
line(273,406,319,406);
line(170,373,299,372);
line(220,523,215,570);
line(274,523,274,583);
line(319,406,325,406);
line(273,333,273,524);

ballx = mouseX; 
bally = mouseY;
fill(100,196,31,95);
ellipse(mouseX, mouseY, 250, 250);
ellipse(mouseX, mouseY, 60, 60);
line(mouseX-125,mouseY,mouseX+125,mouseY);
line(mouseX,mouseY+125,mouseX,mouseY-125);
println(ballx);
println(bally);
fill(1,1,1);
text(ballx+" =X AXIS", ballx+5, bally-80);
println(bally);
fill(1,1,1);
text(bally+" =Y AXIS ",  ballx+5, bally-60);//20,40

if (mousePressed) { 
noFill();
translate(409, 400);
rotate(frameCount*PI/100);
rect(0,0,0,0);
stroke(random(120),20,random(100));
strokeWeight(2);
line(-45,-56,51,40);//365,348,464,474
line(-2,-50,1,58);//408,354,411,462
line(43,-46,-63,52);//453,358,347,459
line(48,-6,-63,3);//458,398,347,407
 } 
 else {
stroke(random(120),20,random(100));
strokeWeight(2);
line(365,348,464,474);
line(408,354,411,462);
line(453,358,347,459);
line(458,398,347,407);

   }   
} 

