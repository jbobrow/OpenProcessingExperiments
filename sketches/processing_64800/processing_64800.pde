
size(640, 360);
background(222, 215, 190);
smooth();

//navy 3D
fill(36, 51, 91);
quad(152, 199, 145, 176, 210, 161, 211, 186);
fill(211, 206, 188);
stroke(190, 183, 161);
quad(145, 176, 168, 143, 207, 134, 210, 161);
noStroke();

//black square 1
fill(0);
quad(256, 67, 346, 47, 351, 67, 261, 87);

//gray 3D 1
fill(82, 73, 62);
triangle(360, 234, 392, 258, 387,225);
fill(227, 221, 200);
stroke(190, 183, 161);
quad(390, 224, 395, 257, 392, 258, 387, 225);
noStroke();

//gray 3D 2
fill(174, 149, 141);
quad(382, 193, 411, 214, 335, 240, 306, 220);
fill(74, 73, 70);
quad(335, 245, 335, 240, 306, 220, 306, 225);
fill(223, 213, 168);
stroke(190, 183, 161);
quad(411, 214, 411, 219, 335, 245, 335, 240);
noStroke();

//red 3D 1
fill(215, 34, 34);
quad(385, 206, 385, 208, 435, 196, 435, 194);
fill(211, 206, 188);
stroke(190, 183, 161);
quad(383, 205, 385, 206, 435, 194, 433, 193);
quad(383, 205, 385, 206, 385, 208, 383, 207);
noStroke();

//blue square
fill(106, 150, 196);
quad(184, 99, 337, 63, 376, 216, 223, 252);

// yellow 3D
fill(225, 209, 155);
quad(444, 78, 460, 72, 585, 174, 569, 180);
fill(168, 133, 75);
quad(461, 68, 460, 72, 585, 174, 586, 170);
fill(0);
quad(461, 68, 460, 72, 444, 78, 445, 74);

//red 3D 2
fill(215, 34, 34);
quad(425, 129, 425, 134, 566, 112, 566, 107);
fill(0);
quad(425, 129, 425, 134, 421, 132, 421, 127);
fill(211, 206, 188);
stroke(190, 183, 161);
quad(421, 127, 425, 129, 566, 107, 562, 105);
noStroke();

//black square 2
fill(0);
quad(302, 180, 303, 185, 625, 111, 624, 106);

//red rectangle
fill(215, 34, 34);
quad(19, 227, 272, 163, 280, 198, 27, 263);

//black circle
fill(0);
ellipse(231, 245, 106, 106);

//red triangle
fill(215, 34, 34);
triangle(413, 243, 581, 218, 446, 302);

//red 3D 3
fill(215, 34, 34);
quad(205, 218, 212, 221, 161, 347, 154, 344);
fill(211, 206, 188);
stroke(190, 183, 161);
quad(205, 218, 212, 221, 227, 216, 220, 213);
quad(212, 221, 227, 216, 176, 342, 161, 347);
noStroke();

//gray rectangle
fill(159, 165, 162);
quad(161, 269, 267, 247, 269, 258, 163, 280);

//yellow L shape
fill(220, 197, 111);
beginShape();
vertex(174, 253);
vertex(234, 239);
vertex(239, 266);
vertex(226, 269);
vertex(223, 257);
vertex(176, 267);
endShape();

//red 3D 4
fill(215, 34, 34);
quad(233, 212, 234, 214, 465, 162, 464, 159);
stroke(190, 183, 161);
fill(211, 206, 188);
quad(232, 207, 233, 212, 464, 159, 463, 154);
noStroke();

//blue arc
fill(106, 150, 196);
beginShape();
vertex(399, 52); // up right corner
vertex(426, 63); //down right corner
vertex(418, 81); //down right center
vertex(407, 100); //down center
vertex(391, 122); //down left center
vertex(379, 134); //down left corner
vertex(355, 114); //up left corner
endShape();

//gray arc
fill(204, 197, 175);
beginShape();
vertex(384, 61); //up center
vertex(393, 43); //up right center
vertex(399, 23); //up right corner
vertex(427, 32); //down right corner
vertex(419, 54); //down right center
vertex(409, 75); //down center
vertex(396, 98); // down left center
vertex(383, 115); //down left corner
vertex(362, 99); //up left corner
endShape();

//red arc
fill(215, 34, 34);
beginShape();
vertex(272, 163); //down left corner
vertex(266, 137); //up left corner
vertex(299, 126); //up left center
vertex(329, 109); //up center
vertex(355, 84); //up right center
vertex(371, 56); //up right corner
vertex(393, 66); //down right corner
vertex(374, 99); //down right center
vertex(345, 129); //down center
vertex(309, 150); //down left center
endShape();

