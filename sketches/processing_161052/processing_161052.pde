
// author: megan gray
// assignment 1, suny inroduction to computational arts

// a sunset using a brown and orange color palette, hopefully
// with enough detail using just 20 drawing objects

// setup
size(640, 400);
background(#DD5000); // orange sky background
strokeWeight(2);

// shapes 1-3: sun and glow
stroke(253, 223, 40, 30);
fill(253, 223, 40, 30);
ellipse(310, 120, 360, 360);
stroke(253, 243, 80, 30);
fill(253, 243, 80, 30);
ellipse(310, 120, 230, 230);
stroke(#FDFDFD);
fill(#FDFDFD);
ellipse(315, 200, 75, 60);

// shape 4: "water"
stroke(#F06C00);
fill(#F06C00);
quad(0, 251, 639, 235, 639, 399, 0, 399);

// shape 5: terrain
stroke(#120000);
fill(#120000);
beginShape();
  vertex(0, 251);
  vertex(0, 246);
  vertex(100, 242);
  vertex(272, 226);
  vertex(322, 231);
  vertex(360, 228);
  vertex(366, 220);
  vertex(391, 214);
  vertex(440, 210);
  vertex(460, 212);
  vertex(470, 218);
  vertex(625, 200);
  vertex(639, 202);
  vertex(639, 235);
endShape();

// shape 6: sun's reflection
stroke(254, 254, 254, 10);
fill(254, 254, 254, 30);
quad(280, 245, 345, 245, 350, 397, 275, 397);

// shapes 8-13: clouds 
stroke(160, 48, 0, 40);
fill(160, 48, 0, 230);
beginShape();
  vertex(639, 50);
  vertex(520, 60);
  vertex(555, 64);
  vertex(505, 72);
  vertex(435, 77);
  vertex(467, 70);
  vertex(322, 80);
  vertex(262, 85);
  vertex(336, 85);
  vertex(190, 95);
  vertex(125, 87);
  vertex(0, 90);
  vertex(0, 115);
  vertex(639, 119);
endShape();

stroke(181, 30, 0, 40);
fill(181, 30, 0, 230);
beginShape();
  vertex(619, 11);
  vertex(469, 11);
  vertex(350, 17);
  vertex(310, 20);
  vertex(273, 24);
  vertex(316, 24);
  vertex(322, 22);
  vertex(450, 20);
  vertex(463, 22);
  vertex(526, 19);
  vertex(577, 15);
endShape();

beginShape();
  vertex(463, 8);
  vertex(421, 9);
  vertex(336, 13);
  vertex(261, 17);
  vertex(306, 17);
  vertex(362, 13);
  vertex(415, 11);
  vertex(455, 10);
endShape();

beginShape();
  vertex(346, 179);
  vertex(338, 173);
  vertex(326, 168);
  vertex(319, 169);
  vertex(312, 168);
  vertex(308, 168);
  vertex(303, 173);
  vertex(306, 177);
  vertex(304, 180);
  vertex(314, 180);
  vertex(321, 180);
  vertex(325, 181);
  vertex(328, 181);
  vertex(336, 180);
  vertex(344, 185);
  vertex(347, 183);
endShape();

beginShape();
  vertex(302, 171);
  vertex(287, 178);
  vertex(269, 178);
  vertex(264, 175);
  vertex(255, 173);
  vertex(256, 181);
  vertex(288, 180);
  vertex(293, 178);
  vertex(302, 181);
endShape();

beginShape();
  vertex(237, 178);
  vertex(226, 168);
  vertex(214, 166);
  vertex(183, 170);
  vertex(176, 163);
  vertex(172, 168);
  vertex(162, 164);
  vertex(145, 164);
  vertex(129, 170);
  vertex(115, 166);
  vertex(107, 171);
  vertex(90, 176);
  vertex(85, 182);
  vertex(92, 178);
  vertex(114, 177);
  vertex(134, 180);
  vertex(163, 177);
  vertex(175, 182);
  vertex(191, 179);
  vertex(210, 183);
  vertex(225, 182);
  vertex(235, 181);
endShape();

beginShape();
  vertex(400, 155);
  vertex(382, 153);
  vertex(370, 153);
  vertex(358, 156);
  vertex(351, 159);
  vertex(363, 168);
  vertex(378, 168);
  vertex(396, 168);
  vertex(400, 166);
  vertex(415, 163);
  vertex(422, 166);
  vertex(446, 169);
  vertex(453, 170);
  vertex(436, 158);
  vertex(420, 158);
  vertex(410, 154);
  vertex(401, 156);
endShape();

// shapes 14-20: ripples on water
strokeWeight(1);
stroke(50, 11, 3, 150);
noFill();

quad(-1, 255, 640, 239, 640, 243, -1, 259);
quad(-1, 263, 640, 247, 640, 252, -1, 268);
quad(-1, 274, 640, 258, 640, 265, -1, 281);

strokeWeight(2);
quad(-1, 290, 640, 274, 640, 283, -1, 299);
quad(-1, 309, 640, 294, 640, 305, -1, 320);
quad(-1, 332, 640, 317, 640, 331, -1, 346);

strokeWeight(3);
quad(-1, 360, 640, 345, 640, 362, -1, 377);
quad(-1, 395, 640, 380, 640, 395, -1, 415); 


