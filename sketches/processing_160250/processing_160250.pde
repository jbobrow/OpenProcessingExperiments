
//the mouse has a good day

size(750, 400);
background(#4D2020);
noStroke();

//walls/floor
fill(#430314);
quad(0, 0, 50, 0, 50, 220, 0, 290);
fill(#390311);
quad(50, 0, 750, 0, 750, 226, 50, 220);

//cheese wedge
//side
fill(#FAE372);
quad(150, 262, 280, 242, 280, 330, 145, 355);
arc(279, 286, 16, 88, 1.5 * PI, 2.5 * PI);
//holes
fill(#D19C08);
ellipse(215, 285, 20, 20);
ellipse(242, 300, 30, 30);
ellipse(180, 320, 25, 25);
//back
fill(#F2D658);
quad(87, 240, 151, 262, 146, 355, 87, 335);
fill(#E9D056);
arc(87, 287.5, 20, 95, 0.5 * PI, 1.5 * PI);
//shadow between side & back
ellipse(146, 308, 11, 94);
fill(#E6C554);
ellipse(146, 308, 5, 94);
//holes
fill(#D19C08);
ellipse(100, 270, 7, 10);
ellipse(85, 290, 10, 14);
ellipse(105, 305, 13, 17);
ellipse(132, 300, 18, 24);
ellipse(110, 330, 15, 20);
//top
fill(#FAE372);
triangle(87, 240, 278, 242, 150, 262);
//holes
fill(#D19C08);
ellipse(115, 244, 15, 6);
ellipse(150, 252, 23, 11);
ellipse(175, 250, 17, 9);
ellipse(242, 245, 11, 5);
ellipse(260, 243, 5, 2);

//mouse
fill(#937E6F);
//torso
rotate(-0.05 * PI);
ellipse(430, 290, 300, 110);
fill(#4D2020);
arc(430, 350, 275, 85, PI, 2 * PI);
//between leg & torso smoothing
fill(#4D2020);
arc(411, 323, 50, 30, 1.1*PI, 1.5*PI);
fill(#937E6F);
arc(332, 325, 30, 30, 1.6*PI, 2*PI);
fill(#4D2020);
arc(332, 325, 10, 10, 1.6*PI, 2*PI);
fill(#937E6F);
arc(453, 316, 30, 30, 1.5*PI, 2*PI);
fill(#4D2020);
arc(453, 316, 15, 15, 1.5*PI, 2*PI);
fill(#937E6F);
arc(495, 322, 35, 35, 1.1*PI, 2.1*PI);
fill(#4D2020);
arc(494, 324, 18, 18, 1.1*PI, 2.1*PI);
//legs
rotate(-0.22 * PI);
fill(#937E6F);
ellipse(190, 584, 130, 30);
ellipse(179, 543, 130, 28);
ellipse(69, 478, 130, 30);
ellipse(54, 444, 128, 28);
//head
rotate(1.3);
fill(#826B5C);
arc(402, 24, 60, 50, PI, 2.1*PI);
arc(402, 24, 60, 170, 0, PI);
fill(#937E6F);
arc(400, 25, 60, 50, PI, 2.1*PI);
arc(400, 25, 60, 170, 0, PI);
//ears
ellipse(382, 0, 34, 54);
fill(#A38E7F);
ellipse(411, -1, 34, 54);
fill(#937E6F);
ellipse(412, 0, 34, 54);
fill(#826B5C);
ellipse(412, 0, 16, 34);
//nose
fill(#9B3852);
ellipse(398, 100, 10, 5);
ellipse(398, 101, 7, 4);
//eyes
fill(#6F0C0E);
ellipse(380, 40, 4, 6);
ellipse(394, 38, 4, 6.4);
//tail
rotate(-1.25);
fill(#937E6F);
rect(230, 574, 150, 14);
arc(370, 553.3, 100, 70, 1.5*PI, 2.5*PI);
fill(#390311);
arc(369, 552, 80, 44, 1.5*PI, 2.5*PI);
fill(#937E6F);
triangle(373, 518, 370, 530, 310, 520);

