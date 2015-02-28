
size(640, 480);
smooth();

background(217, 212, 184);

//top bg block *yellow beige*//
beginShape();
noStroke();
fill(215, 208, 180);
vertex(123, 0);
vertex(188, 101);
vertex(423, 77);
vertex(637, 93);
vertex(638, 0);
endShape();

//blue bg block//
beginShape();
noStroke();
fill(182, 188, 172);
vertex(123, 0);
vertex(188, 101);
vertex(423, 77);
vertex(637, 93);
vertex(640, 246);
vertex(237, 272);
vertex(168, 301);
vertex(0, 259);
vertex(0,0);
endShape();

//baby blue bg block//
beginShape();
noStroke();
fill(201, 202, 186);
vertex(201, 202, 186);
vertex(640, 246);
vertex(240, 228);
vertex(237, 272);
vertex(168, 301);
vertex(0, 259);
vertex(0, 339);
vertex(142, 340);
vertex(638, 345);
endShape();

//brown lines across//
noStroke();
fill(152, 147, 123);
quad(640, 390, 640, 411, 580, 480, 555, 480);
quad(223, 480, 187, 480, 624, 210, 624, 221);
quad(640, 120, 640, 116, 0, 367, 0, 386);
quad(640, 67, 640, 71, 0, 248, 0, 233);
quad(640, 37, 640, 35, 0, 151, 0, 161);






//top grey quad//
noStroke();
fill(157, 159, 142);
quad(398, 0, 436, 0, 443, 35, 419, 33);

//blue cross//
beginShape();
noStroke();
fill(15, 79, 126);
vertex(319, 157);
vertex(233, 178);
vertex(640, 187);
vertex(640, 191);
vertex(176, 193);
vertex(89, 214);
vertex(0, 215);
vertex(0, 211);
vertex(44, 191);
vertex(0, 190);
vertex(0, 172);
vertex(83, 175);
vertex(146, 146);
endShape();

//red arc//
noFill();
stroke(150, 35, 34);
strokeWeight(3);
arc(227, 122, 310, 172, 1.7, 4);

//ladder//
stroke(175, 178, 162);
strokeWeight(2);
line(56, 25, 640, 117);
line(71, 99, 629, 229);
line(609, 114, 608, 225);
line(503, 97, 498, 183);
line(413, 85, 412, 165);
line(337, 69, 334, 152);
line(266, 63, 259, 136);
line(213, 51, 212, 126);
line(165, 45, 164, 113);
line(126, 37, 123, 109);
line(74, 31, 73, 101);


beginShape();
stroke(0);
noFill();
strokeWeight(2);
vertex(0, 314);
vertex(137, 340);
vertex(351, 279);
endShape();

beginShape();
stroke(0);
noFill();
strokeWeight(2);
vertex(0, 383);
vertex(135, 418);
vertex(336, 350);
endShape();

beginShape();
noFill();
stroke(0);
strokeWeight(2);
vertex(0, 425);
vertex(141, 471);
vertex(346, 400);
endShape();

beginShape();
noFill();
stroke(0);
strokeWeight(3);
vertex(176, 253);
vertex(414, 347);
vertex(629, 247);
endShape();

beginShape();
noFill();
stroke(0);
strokeWeight(3);
vertex(0, 81);
vertex(171, 89);
vertex(171, 94);
vertex(0, 96);
endShape();



noFill();
stroke(0);
strokeWeight(2);
quad(202, 92, 226, 108, 556, 86, 566, 76);

noStroke();
fill(247, 185, 51);
quad(640, 196, 620, 195, 632, 260, 640, 261);
quad(515, 182, 498, 231, 460, 223, 446, 172);
quad(321, 150, 373, 160, 354, 196, 330, 191);
quad(233, 130, 270, 139, 257, 170, 235, 165);
quad(158, 112, 188, 119, 178, 147, 163, 142);
quad(102, 97, 122, 102, 115, 126, 105, 123);
quad(64, 108, 56, 105, 55, 84, 68, 88);
quad(25, 74, 21, 91, 14, 88, 13, 70);

noStroke();
fill(0);
quad(605, 194, 523, 183, 535, 240, 582, 250); 
quad(420, 213, 397, 207, 381, 161, 436, 170);
quad(314, 149, 277, 140, 281, 177, 302, 183);
quad(216, 159, 200, 154, 195, 121, 228, 129);
quad(152, 110, 128, 104, 133, 132, 145, 137);
quad(88, 117, 78, 114, 76, 90, 93, 95);
quad(48, 82, 35, 77, 35, 97, 41, 100);
quad(0, 81, 5, 83, 7, 69, 0, 66);

beginShape();
noFill();
stroke(0);
strokeWeight(3);
vertex(434, 0);
vertex(565, 59);
vertex(319, 0);
endShape();

stroke(0);
strokeWeight(3);
line(436, 27, 538, 0);
line(640, 404, 89, 215);
line(125, 207, 640, 357);

stroke(0);
strokeWeight(3);
line(561, 87, 640, 21);


pushMatrix(); 
stroke(0);
noFill();
strokeWeight(3);
arc(294, 172, 436, 112, 2.3, TWO_PI-PI/2);
arc(218, 171, 436, 112, 2.2, 4.93);
rotate(2.3);
popMatrix();

// orange curve//
pushMatrix();
noFill();
stroke(211, 103, 40);
strokeWeight(3);
ellipse(555, 40, 589, 183);
rotate(6.5);
popMatrix();

//red stroke//
noFill();
beginShape();
strokeWeight(13);
stroke(157, 28, 32);
strokeCap(ROUND);
curveVertex(346, 75);
curveVertex(351, 78);
curveVertex(368, 81);
curveVertex(383, 79);
curveVertex(387, 77);
curveVertex(392, 68);
endShape();

noFill();
beginShape();
strokeWeight(13);
stroke(157, 28, 32);
strokeCap(ROUND);
curveVertex(96, 145);
curveVertex(115, 139);
curveVertex(145, 144);
curveVertex(159, 143);
curveVertex(160, 142);
endShape();

noFill();
strokeWeight(2);
stroke(157, 28, 32);
strokeCap(ROUND);
line(640, 18, 540, 0);

//green thing//
beginShape();
noStroke();
fill(93, 143, 126);
curveVertex(407, 202);
curveVertex(406, 205);
curveVertex(299, 218);
curveVertex(280, 215);
curveVertex(278, 227);
curveVertex(288, 243);
curveVertex(305, 250);
curveVertex(321, 245);
curveVertex(360, 220);
curveVertex(394, 216);
curveVertex(413, 208);
curveVertex(410, 205);
curveVertex(407, 202);
endShape();


