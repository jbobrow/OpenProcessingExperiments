
size (187,175);
background(#FBF5DF);
smooth();
noFill();

stroke(3);

bezier(168, 0, 67, 80, 67, 99, 187, 145);

//Figure 8
fill(0);
bezier(141, 60, 141, 60, 163, 57, 149, 75);
bezier(149, 75, 136, 94, 166, 93, 156, 79);
bezier(156, 79, 156, 79, 152, 76, 149, 75);
bezier(149, 75, 147, 75, 117, 74, 141, 60);
line(141, 60, 149, 75);

//Sock
fill(0);
//bezier(100, 99, 5, 125, 28, 0, 28, 0);
//bezier(83, 0, 83, 0, 58, 84, 95, 76);
beginShape();
curveVertex(28, 0);
curveVertex(28, 0);
curveVertex(33, 77);
curveVertex(72, 102);
curveVertex(102, 100);
curveVertex(97, 90);
curveVertex(96, 76);
curveVertex(84, 75);
curveVertex(75, 60);
curveVertex(83, 0);
curveVertex(83, 0);
endShape(CLOSE);


//Toe
fill(245, 42, 0);
beginShape();
curveVertex(95, 76);
curveVertex(95, 76);
curveVertex(95, 88);
curveVertex(101, 98);
curveVertex(108, 93);
curveVertex(111, 85);
curveVertex(110, 77);
curveVertex(95, 76);
curveVertex(95, 76);
endShape(CLOSE);

//Egg
fill(245, 42, 0);
bezier(63, 141, 31, 135, 17, 171, 60, 173);

fill(0);
bezier(59, 173, 98, 171, 88, 142, 62, 141);

//Beak
triangle(181, 54, 170, 68, 186, 59);
ellipse(191, 51, 18, 18);
fill(245, 42, 0);
ellipse(185, 53, 8, 8);

//Star
noStroke();
fill(#4F4395);
beginShape();
vertex(30, 128);
vertex(31, 146);
vertex(54, 155);
vertex(33, 166);
vertex(30, 175);
vertex(21, 175);
vertex(20, 167);
vertex(0, 174);
vertex(0, 170);
vertex(15, 159);
vertex(0, 152); 
vertex(0, 148);
vertex(13, 148);
endShape(CLOSE);


//Firework
stroke(0);
line(98, 139, 113, 159);
line(107, 138, 104, 158);
line(96, 154, 115, 140);
line(95, 148, 114, 149);
line(98, 139, 112, 158);

//Beads
fill(245, 42, 0);
bezier(138, 25, 138, 25, 135, 10, 147, 17);
fill(0);
bezier(138, 25, 138, 25, 151, 26, 147, 17);

fill(245, 42, 0);
bezier(115, 47, 118, 48, 128, 45, 122, 40);
fill(0);
bezier(115, 47, 113, 41, 114, 36, 122, 40);

bezier(113, 111, 113, 111, 119, 107, 119, 115);
fill(245, 42, 0);
bezier(113, 111, 113, 111, 108, 121, 119, 116);
fill(0);
line(114, 117, 113, 125);
ellipse(113, 128, 6, 6);

ellipse(146, 129, 12, 12);
ellipse(172, 140, 11, 8);

fill(245, 42, 0);
bezier(140, 126, 140, 126, 151, 116, 152, 131);

bezier(168, 137, 162, 137, 170, 148, 177, 141);


//Triangles
fill(0);
beginShape();
vertex(141, 160);
vertex(159, 163);
vertex(150, 153);
vertex(157, 145);
vertex(137, 144);
vertex(148, 153);
endShape(CLOSE);

//Kite
fill(245, 42, 0);
beginShape();
vertex(9, 87);
vertex(35, 114);
vertex(10, 109);
endShape(CLOSE);

fill(0);
beginShape();
vertex(10, 109);
vertex(9, 87);
vertex(-11, 108);
endShape(CLOSE);

//Left String
noFill();
bezier(0, 6, 0, 6, 24, 28, 0, 43);
bezier(0, 66, 0, 66, 8, 78, 9, 87);

fill(0);
ellipse(7, 18, 12, 12);
ellipse(0, 66, 10, 10);
fill(245, 42, 0);
bezier(5, 13, 5, 13, -15, 21, 10, 24);
triangle(3, 71, 0, 71, 0, 66);


//misc
fill(0);
ellipse(100, 175, 20, 15);
line(145, 175, 145, 169);
line(177, 175, 177, 165);
ellipse(177, 162, 13, 10);
line(62, 142, 63, 129);
ellipse(64, 124, 20, 11);


