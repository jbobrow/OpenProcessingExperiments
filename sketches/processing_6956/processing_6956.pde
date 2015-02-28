
size(640, 480); //size (width, height)

background(228, 221, 205);
smooth();

//gold/green quad variables
int quad_top_x = 130;
int quad_top_y = 180;
int quad_bot_x = 215;
int quad_bot_y = 480;

//left circle and arc center variables
int arc_x = 100;
int arc_y = 340;
int arc_width = 200;

//right semi-circle center variables
int semi_x = 285;
int semi_y = 330;

//red semi-circle
noFill();
stroke(210, 107, 74);
strokeWeight(8);
ellipse(semi_x, semi_y, 250, 250);

//blue-yellow semi-circle
fill(212, 219, 237);
stroke(225, 185, 53);
ellipse(semi_x, semi_y, 175, 175);

//black semi-circle
fill(0);
stroke(0);
strokeWeight(3);
ellipse(semi_x, semi_y, 75, 75);

//green quad
fill(44, 81, 74);
quad(quad_top_x, quad_top_y, 175, 150, 380, 480, quad_bot_x, quad_bot_y);

//gold quad
fill(183, 114, 41);
noStroke();
quad(0, 480, 0, 265, quad_top_x, quad_top_y, quad_bot_x, quad_bot_y);

//black arc right
stroke(0);
strokeWeight(10);
strokeCap(SQUARE);
noFill();
arc(122, 30, 160, 160, PI-.5, PI+1);

//green triangle
stroke(141, 150, 97);
strokeWeight(3);
fill(141, 150, 97);
triangle(-10, 20, 15, -10, 400, 235);

//yellow line
stroke(255, 236, 53);
strokeWeight(8);
line(-5, 165, 225, -5);

fill(0);
noStroke();
triangle(-10, 5, 15, -10, 390, 225);

stroke(0);
strokeWeight(8);
line(-5, 160, 215, -5);

//black line
stroke(0);
strokeWeight(8);
strokeCap(ROUND);
line(quad_bot_x, quad_bot_y, 75, 0);

//red arc right
stroke(191, 60, 58, 200);
strokeWeight(10);
strokeCap(SQUARE);
noFill();
arc(120, 30, 160, 160, PI-.5, PI+1);

//red arc left
stroke(191, 60, 58);
strokeWeight(10);
strokeCap(SQUARE);
noFill();
arc(-5, 120, 160, 160, PI, 5.5);

//black line
stroke(0);
strokeWeight(4);
strokeCap(ROUND);
line(0, 80, 90, 0);

//black line
stroke(0);
strokeWeight(4);
line(0, 20, 25, 0);

//black arc right
stroke(0, 0, 0, 200);
strokeWeight(10);
strokeCap(SQUARE);
noFill();
arc(-5, 125, 160, 160, PI, 5.5);


//white semi-circle
stroke(0);
strokeWeight(3);
fill(255);
arc(semi_x, semi_y, 75, 75, 1, 4.2);

strokeWeight(4);
fill(199, 48, 42);
quad(330, 485, 645, 250, 645, 270, 375, 485);

//black under circle
stroke (0);
fill(0);
ellipse(arc_x, arc_y, 220, 220);

//blue arcs
stroke(32, 72, 143);
strokeWeight(15);
strokeCap(SQUARE);
arc(arc_x, arc_y, arc_width, arc_width, 4.1, 5.05);
arc(arc_x, arc_y, arc_width, arc_width, 1, 2.5);
stroke(91, 125, 186);
arc(arc_x, arc_y, arc_width, arc_width, -.3, .2);

//yellow arcs
stroke(235, 211, 102);
strokeWeight(15);
arc(arc_x, arc_y, arc_width, arc_width, 2.9, 3.3);
arc(arc_x, arc_y, arc_width, arc_width, -.6, -.45);

//black arcs
stroke(0);
strokeWeight(15);
arc(arc_x, arc_y, arc_width, arc_width, 4.35, 4.55);
arc(arc_x, arc_y, arc_width, arc_width, 1.5, 2);

//white arcs
stroke(255);
strokeWeight(15);
arc(arc_x, arc_y, arc_width, arc_width, 4.4, 4.425);
arc(arc_x, arc_y, arc_width, arc_width, 4.475, 4.5);
arc(arc_x, arc_y, arc_width, arc_width, 1.57, 1.61);
arc(arc_x, arc_y, arc_width, arc_width, 1.67, 1.71);
arc(arc_x, arc_y, arc_width, arc_width, 1.77, 1.81);
arc(arc_x, arc_y, arc_width, arc_width, 1.87, 1.91);

//black lines and quads
stroke(0);
strokeWeight(8);
strokeCap(ROUND);
line(320, 45, 595, 490);
line(320, 45, 385, -5);
strokeWeight(6);
fill(255);
quad(320, 45, 365, 12, 485, 205, 440, 237);
quad(365, 12, 555, 315, 580, 295, 405, -15);
quad(405, -20, 600, 280, 625, 260, 450, -50);
strokeCap(SQUARE);
strokeWeight(10);
line(495, 130, 430, 25);
strokeCap(ROUND);
strokeWeight(8);
quad(450, -50, 500, -100, 680, 215, 625, 260);
triangle(500, -100, 570, 16, 593, 0);
line(350, 95, 485, 8);
line(380, 140, 510, 55);
line(410, 190, 535, 101);
fill(0);
quad(386, 142, 420, 115, 450, 155, 410, 185);
quad(455, 155, 485, 135, 515, 180, 490, 205);
quad(509, 350, 555, 315, 565, 330, 520, 365);
quad(580, 295, 600, 280, 610, 295, 590, 310);
quad(522, 157, 550, 140, 565, 152, 535, 175);
triangle(630, 260, 640, 275, 640, 250);
strokeWeight(20);
strokeCap(SQUARE);
line(420, 380, 645, 450);

//black color arc
noFill();
stroke(0);
strokeWeight(6);
strokeCap(SQUARE);
arc(602, 247, 240, 240, 4, 4.35);

//orange  and yellow quads
stroke(0);
strokeWeight(4);
strokeCap(ROUND);
fill(175, 151, 66);
quad(580, 295, 590, 310, 565, 330, 555, 315);
quad(600, 280, 610, 295, 635, 275, 625, 260);
fill(200, 114, 53);
quad(570, 16, 650, 160, 650, 95, 595, 0);
quad(610, 295, 635, 275, 642, 290, 642, 345);
quad(565, 330, 590, 310, 645, 405, 645, 445);
quad(487, 205, 515, 185, 580, 295, 555, 315);
quad(565, 152, 535, 175, 600, 280, 625, 260);

//blue circle
noStroke();
fill(11, 100, 166, 200);
ellipse(600, 245, 240, 240);

//line redraw
stroke(0);
strokeWeight(6);
line(630, 125, 640, 145);
strokeWeight(4);
line(440, 237, 590, 135);
line(475, 190, 640, 440);
line(497, 150, 640, 395);
line(510, 140, 640, 345);
line(547, 120, 640, 285);
line(505, 350, 625, 260);
line(520, 370, 635, 275);

//light blue circle
strokeWeight(3);
fill(212, 219, 237);
ellipse(arc_x, arc_y, 180, 180);

//small white circle
stroke(237, 228, 213);
strokeWeight(1);
fill(255);
ellipse(120, 330, 40, 40);

//small black circles
noStroke();
fill(0);
ellipse(120, 330, 35, 35);

//red triangles
stroke(215, 43, 33);
strokeWeight(2);
fill(215, 43, 33);
triangle(135, 295, 237, 175, 250, 185);
triangle(85, 317, 0, 275, 0, 295);

//white quads on triangles
stroke(255);
strokeWeight(2);
fill(255);
quad(170, 255, 196, 222, 203, 230, 175, 260);
triangle(10, 280, 0, 295, 0, 275);

//black stroke circle
stroke (0);
strokeWeight(6);
noFill();
ellipse(arc_x, arc_y, 220, 220);

//other red triangle & white quad
stroke(215, 43, 33);
strokeWeight(2);
fill(215, 43, 33);
triangle(150, 365, 260, 480, 240, 480);
stroke(255);
fill(255);
quad(192, 410, 252, 472, 240, 480, 188, 413);

//black quads on triangels
noStroke();
fill(0);
quad(250, 160, 315, 75, 335, 100, 265, 172);
quad(232, 475, 230, 470, 243, 462, 247, 465);
triangle(240, 480, 254, 472, 263, 480);

//small black lines and dots
stroke(0);
strokeWeight(2);
line(328, 40, 355, 88);
line(335, 37, 362, 84);
line(342, 31, 368, 79);
line(348, 27, 376, 74);
line(355, 22, 383, 71);
line(360, 17, 389, 67);
strokeWeight(1);
line(478, 77, 507, 120);
line(482, 72, 511, 116);
line(488, 69, 515, 113);
line(493, 66, 520, 110);
line(498, 62, 525, 107);
line(502, 60, 528, 104);
strokeWeight(4);
point(417, 58);
point(407, 64);
point(416, 71);
point(421, 72);
point(425, 79);
point(425, 85);
point(434, 91);
point(431, 98);
point(436, 85);
point(444, 88);
point(447, 82);
point(442, 89);
point(456, 81);
point(427, 90);
point(415, 80);
point(448, 72);
point(440, 63);
point(445, 58);
point(434, 69);
point(438, 78);
point(440, 48);
point(425, 53);
point(433, 51);
point(434, 62);
point(428, 54);

point(420, 54);
point(410, 66);
point(419, 73);
point(428, 70);
point(433, 77);
point(433, 87);
point(437, 93);
point(438, 96);
point(442, 87);
point(449, 86);
point(450, 84);
point(445, 87);
point(459, 83);
point(434, 92);
point(410, 82);
point(440, 74);
point(440, 66);
point(440, 56);
point(430, 67);
point(430, 76);
point(440, 46);
point(420, 55);
point(430, 53);
point(430, 60);
point(420, 52);
strokeWeight(8);
point(432, 4);
point(445, 5);
point(445, 19);
point(450, 10);
point(457, 16);
point(449, 8);
point(470, 11);
point(468, 2);

