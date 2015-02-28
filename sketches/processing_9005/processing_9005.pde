
void setup () {
  size(500, 500);
  background(255, 255, 255);
  smooth ();
  frameRate(1);
}
 
void draw () {
background(255, 255, 255);   
noFill();
ellipse(222, 285, 56, 81);//face
ellipse(214, 286, 12, 15);//eye1
ellipse(235, 285, 14, 10);//eye2
point(236, 286);//pupil1
point(217, 287);//pupil2
bezier(237, 301, 240, 293, 219, 305, 213, 311);//mouth
line(224, 321, 229, 381);//torso
line(229, 381, 210, 461);//leg1
line(229, 381, 264, 452);//leg2
line(227, 364, 191, 337);//arm1
line(191, 337, 185, 310);//hand
line(228, 360, 300, 326);//arm2
fill(216, 8, 8);
beginShape();//hat
vertex(189, 261);
vertex(187, 247);
vertex(197, 245);
vertex(195, 234);
vertex(210, 232);
vertex(209, 218);
vertex(222, 218);
vertex(225, 228);
vertex(234, 228);
vertex(237, 239);
vertex(245, 239);
vertex(245, 257);
endShape(CLOSE);
noFill();
beginShape();//swordhilt
vertex(291, 325);
vertex(297, 326);
vertex(296, 316);
vertex(301, 315);
vertex(305, 343);
vertex(301, 344);
vertex(300, 334);
vertex(292, 335);
endShape(CLOSE);
beginShape();//sword
vertex(301, 325);
vertex(373, 309);
vertex(384, 310);
vertex(373, 314);
vertex(301, 330);
endShape(CLOSE);
fill(171, 171, 171);
arc(498, 325, 106, 256, PI/2, TWO_PI);//MONSTER
noFill();
strokeWeight(8);
beginShape();//tentacle1
curveVertex(490, 218);
curveVertex(490, 218);
curveVertex(482, 195);
curveVertex(475, 179);
curveVertex(464, 174);
curveVertex(451, 178);
curveVertex(433, 184);
curveVertex(424, 184);
curveVertex(417, 169);
curveVertex(417, 169);
endShape();

beginShape();//tentacle2
curveVertex(463, 241);
curveVertex(463, 241);
curveVertex(452, 224);
curveVertex(437, 219);
curveVertex(416, 223);
curveVertex(398, 219);
curveVertex(387, 200);
curveVertex(372, 177);
curveVertex(353, 181);
curveVertex(353, 181);
endShape();

beginShape();//tentacle
curveVertex(490, 218);
curveVertex(490, 218);
curveVertex(482, 195);
curveVertex(475, 179);
curveVertex(464, 174);
curveVertex(451, 178);
curveVertex(433, 184);
curveVertex(424, 184);
curveVertex(417, 169);
curveVertex(417, 169);
endShape();

beginShape();//tentacle3
curveVertex(460, 284);
curveVertex(440, 284);
curveVertex(426, 283);
curveVertex(419, 269);
curveVertex(403, 260);
curveVertex(379, 263);
curveVertex(360, 255);
curveVertex(347, 256);
curveVertex(335, 236);
curveVertex(336, 224);
curveVertex(339, 215);
curveVertex(339, 215);
endShape();

beginShape();//tentacle
curveVertex(460, 316);
curveVertex(464, 316);
curveVertex(443, 309);
curveVertex(424, 305);
curveVertex(411, 318);
curveVertex(399, 349);
curveVertex(385, 380);
curveVertex(373, 397);
curveVertex(358, 396);
curveVertex(358, 396);
endShape();

beginShape();//tentacle
curveVertex(455, 360);
curveVertex(455, 360);
curveVertex(437, 365);
curveVertex(420, 355);
curveVertex(405, 353);
curveVertex(377, 368);
curveVertex(363, 365);
curveVertex(350, 354);
curveVertex(350, 354);
endShape();

beginShape();//tentacle
curveVertex(473, 400);
curveVertex(473, 400);
curveVertex(437, 415);
curveVertex(407, 413);
curveVertex(388, 414);
curveVertex(372, 432);
curveVertex(354, 425);
curveVertex(354, 425);
endShape();
//spots
point(478, 301);
point(496, 313);
point(476, 335);
strokeWeight(1);
ellipse(478, 301, 29, 41);
ellipse(476, 335, 28, 38);
ellipse(496, 313, 31, 48); 

}

