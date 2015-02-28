
size(187, 175);

background(250, 245, 225);//change this to cream later
smooth();

//right hand side of black shape lower
stroke(0);
fill(0);
strokeWeight(1);


//FYI experimentation that didn't quite work

//bezier(85, 175, 85, 175, 101, 180, 97, 83);
//bezier(97, 83, 97, 83, 94, 77, 108, 55); 
//bezier(108, 55, 108, 55, 116, 14, 107, 17);
//bezier(107, 17, 107, 17, 96, 17, 93, 42);
//bezier(93, 42, 93, 42, 88, 60, 81, 65);
//bezier(81, 65, 81, 65, 63, 105, 65, 105);
//bezier(65, 105, 65, 105, 28, 157, 29, 175);


//big black blob shape

beginShape();

curveVertex(85, 175);
curveVertex(85, 175);
curveVertex(95, 140);
curveVertex(97, 89);
curveVertex(110, 49);
curveVertex(117, 32);
curveVertex(109, 17);
curveVertex(85, 58);
curveVertex(96, 36);
curveVertex(59, 105);
curveVertex(40, 175);
vertex(40, 175);

endShape(CLOSE);

//FYI experimentation that didn't work so well 

//beginShape();

//fill(255, 0, 0);
//noStroke();
//arc(110, 29, 20, 20, PI, TWO_PI);
//arc(100, 29, 20, 20, 

//endShape(CLOSE);

//black crescent part
beginShape();

fill(0);
vertex(143, 30);
vertex(87, 0);
vertex(110, 0);

endShape(CLOSE);

//black triangle to finish angled crescent shape
noStroke();
fill(0);
bezier(150, 34, 150, 34, 94, 45, 86, 0);

//red crescent
noStroke();
fill(255, 90, 47);
bezier(119, 32, 119, 32, 116, 12, 103, 24);

//black crescent top right
fill(0);
noStroke();
arc(146, 0, 17, 17, 0, PI);

//diagonal line top right
strokeWeight(1);
stroke(0);
line(119, 11, 144, 00);

//random line rop right
strokeWeight(1);
noFill();
bezier(186, 72, 186, 72, 157, 8, 186, 7);

//curved line top left
strokeWeight(1);
noFill();
bezier(32, 0, 32, 0, 0, 40, 46, 36);

//black shape at end of this line
beginShape();

stroke(2);
fill(0);
vertex(46, 36);
vertex(60, 24);
vertex(59, 57);

endShape(CLOSE);

//curved part at end of this shape
strokeWeight(1);
fill(0);
bezier(59, 57, 59, 57, 68, 47, 61, 24);
line(59, 57, 59, 24);


//curved line bottom left
strokeWeight(1);
noFill();
bezier(0, 170, 0, 170, 15, 160, 12, 145);

//second curved line bottom left
beginShape();

noFill();
strokeWeight(1);

curveVertex(0, 158);
curveVertex(0, 158);
curveVertex(28, 150);
curveVertex(33, 122);
curveVertex(33, 122);

endShape();

//third curved line bottom left
strokeWeight(1);
noFill();
bezier(0, 124, 0, 124, 11, 114, 10, 98);

//line bottom right
strokeWeight(1);
noFill();
bezier(173, height, 173, height, 182, 164, width, 167);

//beads 2 bezziers
//top right
noStroke();
fill(255, 90, 47);
bezier(184, 6, 184, 6, 170, 0, 173, 13);

noStroke();
fill(0);
bezier(184, 6, 184, 6, 186, 17, 173, 13);


//beads
//bottom left
fill(255, 90, 47);
ellipse(7, 111, 17, 14);

noStroke();
fill(0);
bezier(3, 120, 3, 120, 27, 118, 10, 102);


//firework left and spiral clockwise in
//f1
stroke(0);
strokeWeight(1);
line(34, 89, 34, 53);
line(20, 86, 43, 60);
line(20, 71, 51, 70);
line(22, 58, 46, 84);


//f2
line(144, 66, 166, 65);
line(146, 54, 164, 77);
line(157, 52, 155, 78);
line(165, 59, 146, 74);

//f3
line(135, 106, 161, 106);
line(160, 94, 133, 120);
line(146, 93, 147, 118);
line(135, 95, 162, 119);

//f4
line(170, 129, width, 129);
line(175, 122, width, 134);
line(182, 117, 182, 141);
line(171, 140, width, 123);

//f5
line(102, 156, 119, height);
line(112, 154, 112, height);
line(122, 157, 107, height);
line(124, 168, 103, 168);

//vertical lines
//from top left to right (points for mids of arcs/circles to draw)
line(8, 69, 7, 42);
line(123, 84, 123, 59);
line(180, 104, 180, 85);

//black circles/ellipses again left to right
fill(0);
ellipse(8, 69, 17, 12);
ellipse(7, 42, 17, 12);

ellipse(123, 59, 16, 13);
ellipse(123, 84, 18, 13);
ellipse(180, 104, 10, 10);
ellipse(180, 85, 11, 10);
ellipse(12, 143, 16, 13);

//spec top right
beginShape();

fill(0);
noStroke();

vertex(width, 28);
vertex(width, 34);
vertex(183, 32);


endShape();







