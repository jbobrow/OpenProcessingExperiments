
size(640, 480);
background(240, 245, 250);
smooth();

//black lines
stroke(170);
strokeWeight(1.5);
line(0, 435, 240, 0);
line(15, 480, 280, 0);

//blue circle
noStroke();
fill(16, 40, 110);
ellipse(640, -660, 1500, 1500);

//big red shape
fill(200, 0, 20);
beginShape();
vertex(238, 54);
vertex(255, 55);
vertex(254, 69);
vertex(354, 79);
vertex(355, 63);
vertex(393, 67);
vertex(393, 60);
vertex(426, 63);
vertex(428, 47);
vertex(434, 47);
vertex(435, 41);
vertex(444, 41);
vertex(443, 48);
vertex(450, 48);
vertex(451, 42);
vertex(482, 45);
vertex(482, 54);
vertex(498, 55);
vertex(499, 45);
vertex(528, 47);
vertex(523, 88);
vertex(517, 88);
vertex(514, 125);
vertex(491, 124);
vertex(490, 139);
vertex(485, 139);
vertex(484, 149);
vertex(470, 148);
vertex(470, 151);
vertex(437, 149);
vertex(437, 142);
vertex(458, 143);
vertex(458, 136);
vertex(396, 131);
vertex(397, 121);
vertex(273, 107);
vertex(273, 112);
vertex(259, 111);
vertex(259, 105);
vertex(249, 105);
vertex(248, 112);
vertex(233, 112);
endShape(CLOSE);

//big black shape
pushMatrix();
rotate(PI/3.0);
translate(-140, -150);
fill(10, 15, 20);
beginShape();
vertex(238, 54);
vertex(255, 55);
vertex(254, 69);
vertex(354, 79);
vertex(355, 63);
vertex(393, 67);
vertex(393, 60);
vertex(426, 63);
vertex(428, 47);
vertex(434, 47);
vertex(435, 41);
vertex(444, 41);
vertex(443, 48);
vertex(450, 48);
vertex(451, 42);
vertex(482, 45);
vertex(482, 54);
vertex(498, 55);
vertex(499, 45);
vertex(528, 47);
vertex(523, 88);
vertex(517, 88);
vertex(514, 125);
vertex(491, 124);
vertex(490, 139);
vertex(485, 139);
vertex(484, 149);
vertex(470, 148);
vertex(470, 151);
vertex(437, 149);
vertex(437, 142);
vertex(458, 143);
vertex(458, 136);
vertex(396, 131);
vertex(397, 121);
vertex(273, 107);
vertex(273, 112);
vertex(259, 111);
vertex(259, 105);
vertex(249, 105);
vertex(248, 112);
vertex(233, 112);
endShape(CLOSE);
popMatrix();

//right side shape
fill(10, 15, 20);
quad(550, 242, 640, 288, 640, 330, 533, 275);
fill(63, 85, 130);
quad(541, 223, 556, 230, 530, 282, 513, 274);
fill(200, 0, 20);
beginShape();
vertex(553, 258);
vertex(565, 264);
vertex(558, 279);
vertex(551, 276);
vertex(545, 286);
vertex(539, 283);
endShape(CLOSE);
fill(40, 63, 91);
quad(551, 276, 558, 279, 552, 290, 545, 286);
fill(146, 85, 105);
quad(549, 265, 562, 271, 560, 274, 548, 268);

//left side
fill(10, 15, 20);
quad(0, 80, 16, 101, 10, 105, 0, 92);
fill(50, 70, 100);
triangle(0, 92, 16, 113, 0, 126);
fill(10, 15, 20);
quad(16, 113, 20, 118, 0, 134, 0, 126);
fill(125, 145, 170);
quad(0, 134, 29, 111, 47, 134, 15, 158);
fill(50, 70, 100);
quad(0, 134, 23, 116, 28, 121, 0, 143);
fill(75, 103, 150);
quad(0, 142, 24, 124, 34, 136, 0, 163);

fill(200, 0, 20);
quad(21, 161, 42, 161, 42, 227, 21, 227);

fill(75, 103, 150);
quad(71, 244, 126, 220, 132, 233, 78, 258);

//black scatter blocks
fill(10, 15, 20);
quad(41, 254, 58, 254, 58, 271, 41, 271);
quad(6, 218, 13, 218, 13, 225, 6, 225);
quad(0, 305, 83, 310, 83, 316, 0, 311);
quad(87, 300, 94, 298, 105, 339, 98, 340);
quad(98, 385, 186, 356, 194, 380, 106, 408);
quad(206, 366, 210, 359, 215, 363, 212, 369);

//red scatter blocks
fill(200, 0, 20);
quad(53, 260, 62, 260, 62, 263, 53, 263);
quad(71, 292, 78, 292, 78, 299, 71, 299);
quad(52, 337, 116, 337, 116, 348, 52, 348);
quad(82, 371, 92, 367, 94, 374, 82, 377);
quad(49, 400, 57, 400, 57, 411, 49, 411);
quad(196, 395, 228, 343, 236, 349, 204, 400);

fill(45, 70, 100);
quad(194, 416, 245, 335, 265, 348, 215, 429);

fill(75, 103, 150);
beginShape();
vertex(0, 393);
vertex(15, 373);
vertex(36, 390);
vertex(12, 422);
vertex(0, 412);
endShape(CLOSE);

fill(57, 66, 96);
quad(2, 342, 31, 358, 28, 364, 0, 349);

fill(130, 143, 176);
quad(53, 365, 64, 361, 80, 404, 70, 408);

