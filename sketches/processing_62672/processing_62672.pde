
size(640, 480);
smooth();
background(206, 210, 187);

//green quads
noStroke();
fill(3, 138, 102, 220);
quad(0, 370, 205, 361, 206, 403, 0, 408);
fill(3, 138, 102);
quad(543, 0, 533, 111, 590, 136, 640, 0);
quad(640, 0, 640, 60, 634, 121, 587, 137);

//yellow triangle
fill(247, 191, 46, 200);
triangle(48, 410, 205, 480, 45, 480);

//pink triangle
fill(194, 150, 155);
quad(360, 406, 640, 464, 640, 480, 360, 480);

//aqua quad at top left corner
noStroke();
fill(80, 179, 215);
quad(0, 34, 70, 31, 73, 51, 0, 53);

//red cutoff circle
noStroke();
fill(216, 61, 65);
ellipse(150, -40, 90, 90);

//black lines
noFill();
strokeWeight(1);
stroke(140);
bezier(362, 0, 461, 49, 507, 70, 555, 87);
bezier(390, 0, 465, 40, 523, 70, 639, 98);
bezier(289, 0, 383, 97, 441, 158, 457, 177);
bezier(0,247, 447, 139, 464, 129, 557, 89);
bezier(9, 290, 324, 195, 402, 187, 638, 108);
bezier(83, 383, 159, 355, 172, 333, 230, 303);
bezier(0,469,153,424,169,416,278,365);
line(167,428,361,338);
line(0,469,164,462);
bezier(0,183,220,230,375,294,477,343);
bezier(2,58,267,113,365,130,640,224);
line(470,168,420,202);
bezier(502,236,563,263,592,282,640,309);
line(453,348,635,246);
line(76,445,145,480);
line(87,442,163,480);
line(65,450,123,480);
line(112,480,46,448);
line(45,456,98,480);
line(45,464,80,480);
line(45,472,57,479);
line(396,480,640,396);
line(383,478,422,418);
bezier(76,316,188,343,323,391,527,480);
line(634,213,460,276);
line(588,213,416,315);
line(123,39,0,150);
line(0,436,186,428);
line(207,0,239,33);
line(436,467,472,480);
line(519,478,542,298);
line(639,400,504,372);
line(575,339,425,399);

//brown strokes
noFill();
stroke(109, 88, 69);
strokeWeight(7);
strokeCap(SQUARE);
bezier(0, 309, 290, 330, 335, 330, 640, 369);
bezier(0, 382, 306, 420, 380, 415, 640, 470);

//light blue thick strokes
noFill();
strokeWeight(18);
stroke(168,179,166,230);
bezier(0,200,203,200,513,230,642,250);


//white quads
noStroke();
fill(217, 228, 224, 250);
triangle(0, 58, 20, 74, 0, 72);
quad(0, 58, 86, 0, 138, 0, 20, 74);
quad(6, 178, 280, 66, 346, 80, 46, 190);
quad(382, 96, 558, 0, 618, 0, 428, 100);
quad(278, 264, 640, 118, 640, 148, 314, 275);
quad(0, 398, 232, 338, 284, 348, 12, 420);
triangle(0, 398, 12, 420, 0, 418);
quad(158, 460, 640, 348, 640, 376, 186, 468);

//red line throught yellow triangle
noFill();
stroke(213, 63, 65);
strokeWeight(4);
line(48, 408, 180, 488);

//parallel lines
stroke(79, 132, 172);
strokeWeight(5);
strokeCap(SQUARE);
beginShape(LINES);
vertex(80, 26);
vertex(194, 22);
vertex(80, 40);
vertex(192, 36);
endShape();

//black strokes
stroke(40);
strokeWeight(4);
strokeCap(SQUARE);
line(0, 130, 28, 130);
line(27, 130, 26, 174);
line(0, 195, 182, 191);
line(24, 196, 19, 310);
strokeWeight(3);
line(180, 191, 167, 349);
noFill();
strokeWeight(3);
ellipse(21, 340, 70, 61);
line(16, 372, 14, 383);
line(13, 389, 7, 419);
line(0, 417, 222, 480);
strokeWeight(6);
line(0, 478, 75, 480);
strokeWeight(3);
strokeCap(ROUND);
line(331, 337, 528, 424);

//large orange square
noStroke();
strokeCap(SQUARE);
fill(255, 60, 0, 160);
quad(252, 228, 410, 6, 580, 256, 428, 480);

//shorter blue lines
noFill();
stroke(48, 82, 154, 250);
strokeWeight(3);
line(442, 27, 464, -1);
bezier(414, 164, 539, 140, 567, 119, 640, 47);
bezier(383, 272, 425, 234, 449, 228, 555, 208);
bezier(335, 364, 420, 335, 430, 302, 466, 301);
bezier(222, 480, 290, 470, 270, 473, 350, 459);

//lines for circles
stroke(190, 140, 100);
strokeWeight(3);
line(480, 54, 640, 34);
line(482, 88, 640, 68);
line(480, 120, 640, 102);
line(474, 152, 636, 132);
line(470, 180, 640, 162);
line(464, 210, 640, 192);

strokeWeight(4);
line(612, 38, 572, 306);
strokeWeight(5);
line(572, 306, 582, 455);

//first row
noStroke();
fill(190, 140, 100);
ellipse(478, 56, 23, 23);
ellipse(512, 52, 23, 23);
ellipse(548, 47, 23, 23);
ellipse(582, 42, 23, 23);
ellipse(612, 38, 23, 23);
ellipse(645, 34, 23, 23);

//second row
fill(190, 140, 100);
ellipse(484, 88, 23, 23);
ellipse(516, 84, 23, 23);
ellipse(552, 80, 23, 23);
ellipse(586, 75, 23, 23);
ellipse(634, 70, 23, 23);

//third row
fill(190, 140, 100);
ellipse(478, 122, 23, 23);
ellipse(512, 116, 23, 23);
ellipse(546, 112, 23, 23);
ellipse(580, 108, 23, 23);
ellipse(634, 102, 23, 23);

//fourth row
fill(190, 140, 100);
ellipse(474, 150, 23, 23);
ellipse(506, 146, 23, 23);
ellipse(542, 142, 23, 23);
ellipse(576, 138, 23, 23);
ellipse(630, 132, 23, 23);

//fifth row
fill(190, 140, 100);
ellipse(470, 182, 23, 23);
ellipse(502, 178, 23, 23);
ellipse(538, 174, 23, 23);
ellipse(572, 170, 23, 23);
ellipse(626, 164, 23, 23);

//sixth row
fill(190, 140, 100);
ellipse(464, 212, 23, 23);
ellipse(496, 208, 23, 23);
ellipse(531, 204, 23, 23);
ellipse(564, 200, 23, 23);
ellipse(618, 194, 23, 23);

//3 quads somewhere in the middle (green,red,yellow)
noStroke();
fill(0, 128, 95, 250);
triangle(196, 208, 196, 190, 296, 206);

fill(175, 67, 64, 250);
quad(196, 172, 196, 152, 236, 152, 310, 208);

fill(243, 183, 50, 250);
triangle(276, 150, 314, 152, 314, 202);

//blue lines
noFill();
stroke(74, 86, 92);
strokeWeight(4);
strokeCap(SQUARE);
bezier(65, 14, 260, 160, 360, 180, 640, 214);
bezier(0, 385,223,440,405,279, 462, 293);

//blue ellipses
noStroke();
fill(48, 82, 154, 250);
ellipse(410, 212, 33, 33);

fill(48, 82, 154, 250);
ellipse(392, 456, 33, 33);

fill(48, 82, 154, 250);
ellipse(558, 372, 33, 33);

//red ellipse
fill(170, 46, 44);
ellipse(540, 416, 23, 23);

//red smudge thing in the somewhere in the middle
noFill();
smooth();
strokeCap(ROUND);
strokeWeight(26);
stroke(170, 46, 44);
line(240, 274, 255, 272);

//yellow smudge thing
noFill();
strokeCap(ROUND);
strokeWeight(30);
stroke(247, 191, 46, 200);
bezier(550, 325, 570, 315, 594, 320, 590, 320);

//red box at bottom
//use begin shape here next time***
noStroke();
fill(199,33,33,230);
quad(150, 436, 148, 396, 242, 394, 252, 432);
quad(241, 394, 258, 410, 268, 412, 251, 432);
quad(250, 392, 280, 392, 280, 412, 270, 410);
triangle(280, 412, 280, 432, 262, 432);

//bottom right triangles
noStroke();
fill(105, 146, 132);
triangle(471, 468, 466, 480, 443, 480);
triangle(471, 468, 581, 417, 571, 447);


