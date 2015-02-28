
//divided painting
//ben norskov
//creative computing

size(182, 275);
background(229, 182, 1);
noStroke();

//circles on top left
fill(177, 36, 3);
ellipse(34, 26, 14, 16);
ellipse(7, 17, 14, 16);
ellipse(20, 55, 14, 16);
ellipse(58, 29, 14, 16);
ellipse(85, 23, 14, 16);
ellipse(113, 25, 14, 16);
ellipse(2, 64, 14, 16);
ellipse(48, 50, 14, 16);
ellipse(94, 3, 14, 16);
//green ones
fill(84, 80, 15);
ellipse(5, 34, 4, 14);
ellipse(22, 15, 6, 24);
ellipse(35, 42, 10, 18);
ellipse(71, 34, 12, 25);
ellipse(47, 13, 7, 18);
ellipse(99, 20, 8, 14);
ellipse(120, 10, 6, 19);

//big zigzag
//brown
fill(85, 58, 34);
beginShape();
vertex(0, 246);
vertex(94, 245);
vertex(81, 101);
vertex(width, 91);
vertex(width, 137);
vertex(121, 132);
vertex(141, 262);
vertex(111, height);
vertex(0, height);
endShape();
//white
fill(203, 197, 174);
beginShape();
vertex(0, 257);
vertex(113, 251);
vertex(92, 110);
vertex(width, 111);
vertex(width, 129);
vertex(114, 127);
vertex(132, 259);
vertex(96, height);
vertex(70, height);
vertex(72, 263);
vertex(47, 264);
vertex(31, 266);
vertex(25, 261);
endShape();
//yellow lines
stroke(247, 204, 0);
strokeWeight(8);
line(5, 260, 0, height);
line(25, 263, 19, height);
strokeWeight(5);
line(39, 265, 34, height);
strokeWeight(4);
line(48, 262, 43, height);
line(63, 262, 53, height);

//green splotches on right
fill(84, 80, 15);
noStroke();
beginShape();
vertex(160, 63);
bezierVertex(140, 76, 150, 91, 171, 76);
endShape();
beginShape();
vertex(width, 35);
bezierVertex(159, 47, 179, 59, 191, 45);
endShape();

//white shape
noStroke();
fill(201, 200, 166);
beginShape();
vertex(0, 85);
vertex(0, 186);
vertex(181, 32);
vertex(177, 4);
endShape();

//green, red, and black lines
stroke(109, 107, 32);
strokeWeight(5);
line(0, 85, 147, 15);
stroke(89, 66, 45);
line(0, 101, 141, 32);
stroke(69, 46, 25);
line(0, 186, 181, 32);
stroke(192, 52, 13);
strokeWeight(10);
bezier(0, 170, 40, 160, 88, 84, 150, 35);

//white shape on top
fill(220, 214, 185);
noStroke();
beginShape();
curveVertex(0, 175);
curveVertex(0, 175);
curveVertex(93, 93);
curveVertex(132, 45);
curveVertex(139, 0);
curveVertex(width, 0);
curveVertex(width, 28);
curveVertex(0, 184);
curveVertex(0, 184);
endShape();

//black circle
fill(71, 31, 13);
ellipse(166, 6, 20, 25);

//green circles
fill(107, 108, 38);
ellipse(20, 202, 18, 22);
ellipse(23, 233, 14, 20);
ellipse(67, 218, 20, 25);
ellipse(35, 173, 12, 15);
ellipse(59, 164, 20, 15);

//teal circles
fill(83, 164, 144);
ellipse(22, 196, 6, 10);
ellipse(21, 228, 7, 10);
ellipse(70, 210, 8, 13);
ellipse(40, 173, 4, 7);
ellipse(60, 157, 8, 12);

//black circles
fill(68, 41, 8);
ellipse(22, 210, 12, 8);
ellipse(22, 240, 13, 8);
ellipse(67, 230, 15, 8);
ellipse(36, 180, 8, 3);
ellipse(60, 170, 12, 7);
