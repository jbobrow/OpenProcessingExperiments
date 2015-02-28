
// simple
// ClarkLi

void setup() {   
size(480, 600); 
background(222,224,222);
smooth(); 
}

void draw() { 

noStroke();             //color black
fill(250,140,3);
beginShape();
vertex(179,394);
bezierVertex(194, 393, 203,409, 202, 420);
vertex(232,421);
vertex(235,406);
vertex(237,392);
vertex(240,374);
vertex(184,371);
endShape();

noStroke();             //color black
fill(215,55,2);
beginShape();
vertex(190,450);
bezierVertex(188, 460, 178,466, 177, 471);
vertex(184,492);
vertex(223,490);
vertex(227,458);
endShape();


noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(184,492);
bezierVertex(183, 505, 212,526, 220, 523);
vertex(223,490);
endShape();

noStroke();             //color black
fill(220,54,4);
beginShape();
vertex(220,523);
bezierVertex(224, 530, 265,525, 273, 524);
vertex(273,492);
vertex(223,490);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(273,524);
bezierVertex(282, 526, 309,503, 311, 500);
vertex(273,492);
endShape();

noStroke();             //color black
fill(229,39,8);
beginShape();
vertex(311,500);
bezierVertex(316, 495, 322,480, 323, 476);
vertex(270,471);
vertex(273,492);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(323,476);
bezierVertex(330, 472, 324,421, 322, 422);
vertex(294,422);
vertex(293,473);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(179,394);
bezierVertex(192, 392, 204,410, 200, 420);
vertex(177,413);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(190,450);
bezierVertex(185, 460, 180,473, 175, 473);
vertex(174,445);
endShape();

noStroke();             //color black
fill(46,70,171);
beginShape();
vertex(418,335);
bezierVertex(409, 319, 420,265, 468, 283);
vertex(456,303);
bezierVertex(438, 295, 423,314, 432, 329);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(456,303);
bezierVertex(438, 295, 423,314, 432, 329);
bezierVertex(455, 315, 455,305, 432, 329);
endShape();

noStroke();             //color black
fill(225,54,2);
beginShape();
vertex(456,303);
bezierVertex(467, 318, 465,348, 431, 330);
bezierVertex(441, 330, 455,307, 456, 303);
endShape();

noStroke();             //color black
fill(1,1,1);
beginShape();
vertex(468,283);
bezierVertex(498, 295, 476,398, 418, 335);
vertex(431,330);
bezierVertex(465,348,467, 318, 456, 303);
endShape();


noStroke();       //FIRST     
fill(1,1,1);
quad(193,438,230,439,227,458,191,450);            
fill(42,67,10);
quad(202,420,232,421,230,439,193,438);
fill(20,50,141);
quad(177,413,202,420,191,450,175,445);
  
noStroke(); 
fill(200,68,12); 
ellipse(112,96,64,64);

noStroke(); 
fill(24,65,10);
stroke(0);
beginShape();
vertex(265,9);
bezierVertex(265, 9, -50,105, 204, 233);
bezierVertex(153, 161, 239,8, 265, 9);
endShape();

noStroke(); 
fill(1,1,1);
stroke(0);
beginShape();
vertex(138,74);
bezierVertex(151, 104, 123,127, 104, 125);
bezierVertex(104, 106, 131,74, 138, 74);
endShape();

noStroke(); 
fill(1,1,1);
stroke(0);
beginShape();
vertex(190,160);
bezierVertex(181, 177, 195,231, 204, 233);
bezierVertex(210, 229, 184,239, 155, 203);
bezierVertex(140, 203, 183,161, 190, 160);
endShape();

noFill();
stroke(0);
beginShape();
vertex(25,83);
bezierVertex(5, 42, 60,20, 91, 70);
endShape();

noFill();
stroke(0);
beginShape();
vertex(38,130);
bezierVertex(15, 83, 65,40, 85, 76);
endShape();

noFill();
stroke(0);
beginShape();
vertex(71,144);
bezierVertex(33, 100, 65,70, 80, 87);
endShape();

noFill();
stroke(0);
beginShape();
vertex(308,0);
bezierVertex(308, 45, 258,105, 195, 155);
bezierVertex(7, 339, 15,522, 76, 515);
bezierVertex(165, 530, 232,397, 181, 395);
bezierVertex(129, 391, 127,423, 127, 423);
endShape();

fill(1,1,1);
stroke(0);
beginShape();
vertex(95,424);
bezierVertex(128, 391, 150,441, 117, 462);
bezierVertex(91, 480, 67,455, 95, 424);
endShape();

noFill();
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

fill(1,1,1);
stroke(0);
beginShape();
vertex(279,167);
bezierVertex(306, 174, 306,265, 266, 237);
bezierVertex(257, 232, 290,192, 270, 192);
bezierVertex(258, 192, 255,203, 255, 207);
bezierVertex(258, 221, 221,240, 233, 200);
bezierVertex(236, 184, 263,150, 279, 167);
endShape();

noStroke();
fill(199,48,3);
beginShape();
vertex(297,216);
bezierVertex(303, 231, 273,257, 266, 237);
bezierVertex(286, 214, 267,234, 297, 216);
endShape();

fill(1,1,1);
stroke(0);
beginShape();
vertex(322,254);
bezierVertex(309, 224, 337,216, 357, 223);
bezierVertex(378, 231, 400,275, 354, 316);
bezierVertex(347, 321, 383,290, 322, 254);
endShape();

noStroke();
fill(25,62,140);
beginShape();
vertex(322,254);
bezierVertex(309, 224, 337,216, 357, 223);
bezierVertex(372, 221, 345,224, 357, 223);
endShape();

noFill();
stroke(0);
beginShape();
vertex(236,567);
bezierVertex(246, 584, 351,595, 362, 578);
bezierVertex(368, 561, 373,534, 371, 511);
endShape();

noFill();
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

fill(1,1,1);
stroke(0);
beginShape();
vertex(371,511);
bezierVertex(407, 518, 410,491, 388, 480);
bezierVertex(363, 475, 340,497, 371, 511);
endShape();

strokeWeight(2);
line(365,348,464,474);
line(408,354,411,462);
line(453,358,347,459);
line(458,398,347,407);
line(449,205,480,175);
line(273,333,274,374);
line(240,355,240,374);
line(273,406,273,422);
line(272,439,273,467);
line(295,396,294,422);
strokeWeight(2);
line(273,406,319,406);
line(170,373,299,372);
line(220,523,215,570);
line(274,523,274,583);
line(319,406,325,406);

fill(27,51,156);
quad(240,374,256,374,256,392,237,392);
fill(1,1,1);
quad(256,392,237,392,235,406,254,406);
fill(1,1,1);
quad(256,374,256,392,273,392,274,374);
quad(232,421,273,422,272,439,230,439);
quad(227,458,273,467,273,492,223,490);
fill(210,49,4);
quad(256,392,273,392,273,406,254,406);

noStroke();
fill(15,48,147);
quad(273,406,295,406,294,422,273,422);
noStroke();
fill(50,77,16);
quad(273,422,294,422,293,473,274,471);
fill(240,49,4);
quad(295,406,319,406,322,422,294,422);

noStroke();
fill(53,74,13);
quad(235,406,254,406,252,422,232,421);
fill(253,242,4);
quad(252,422,273,422,273,406,254,406);
fill(19,50,150);
quad(230,439,272,439,273,467,227,458);


//sure check

noStroke();
fill(211,45,7);
beginShape();
vertex(409,105);
bezierVertex(405, 134, 426,136, 438, 119);
bezierVertex(437, 111, 400,106, 409, 105);
endShape();

noStroke();
fill(1,1,1);
beginShape();
vertex(409,105);
bezierVertex(421, 80, 445,93, 438, 119);
bezierVertex(437, 111, 400,106, 409, 105);
endShape();

noStroke();
fill(1,1,1);
beginShape();
vertex(438,119);
bezierVertex(448, 124, 464,145, 466, 151);
bezierVertex(450, 150, 472,133, 425, 130);
bezierVertex(433, 132, 440,122, 438, 119);
endShape();

noStroke();
fill(1,1,1);
beginShape();
vertex(466,151);
bezierVertex(468, 160, 473,169, 473, 181);
vertex(480,175);
vertex(480,160);
endShape();





} 


