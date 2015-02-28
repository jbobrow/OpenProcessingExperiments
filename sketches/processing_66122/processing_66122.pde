
size(187, 175);
background(246, 249, 233);
smooth();

//bg blue
noStroke();

fill(144, 208, 217, 20);
beginShape();
vertex(44, 0);
bezierVertex(82, 56, 100, 100, 0, 175);
vertex(187, 175); 
vertex(187, 0);
endShape();

fill(144, 208, 217, 20);
beginShape();
vertex(60, 0);
bezierVertex(82, 56, 100, 100, 30, 175);
vertex(187, 175); 
vertex(187, 0);
endShape();

fill(144, 208, 217, 50);
beginShape();
vertex(90, 0);
bezierVertex(105, 40, 100, 100, 60, 175);
vertex(187, 175); 
vertex(187, 0);
endShape();

//bk lines
stroke(0);
strokeWeight(2);
line(0, 9, 0, 15);

beginShape(LINES);
vertex(16, 0);
vertex(17, 2);
strokeWeight(1);
vertex(17, 2);
vertex(17, 10);
endShape();

noStroke();
fill(0);
beginShape();
vertex(0, 75);
bezierVertex(6, 68, 6, 69, 6, 49);
bezierVertex(11, 60, 10, 76, 0, 82);
endShape();

//main line
noFill();
stroke(0);
strokeWeight(1);
beginShape();
vertex(64, 0);
bezierVertex(68, 95, 89, 71, 93, 111);
bezierVertex(94, 147, 69, 143, 33, 174);
endShape();

beginShape();
vertex(63, 0);
bezierVertex(79, 12, 87, 10, 113, 0);
endShape();

//stars~* ~~*
line(116, 21, 116, 57);
line(106, 32, 127, 33);
line(117, 109, 114, 140);
line(109, 116, 124, 138);
line(104, 134, 126, 118);
line(103, 121, 129, 126);
line(140, 151, 137, 174);
line(126, 152, 143, 174);
line(119, 163, 152, 168);
line(153, 156, 127, 174);

//bottom rt
fill(0);
beginShape();
vertex(170, 175);
curveVertex(175, 167);
curveVertex(178, 160);
curveVertex(186, 140);
curveVertex(185, 151);
curveVertex(185, 160);
curveVertex(184, 171);
curveVertex(183, 175);
curveVertex(178, 175);
endShape();

ellipse(184, 46, 22, 15);
ellipse(185, 14, 17, 19);
ellipse(116, 16, 12, 12);
ellipse(158, 66, 20, 16);
ellipse(92, 105, 19, 14);
line(184, 38, 185, 21);

//big capsule bk
beginShape();
vertex(66, 22);
bezierVertex(96, 26, 103, 35, 103, 51);
bezierVertex(101, 65, 96, 72, 77, 75);
bezierVertex(63, 50, 61, 44, 66, 22);
endShape();

//big hill bk
beginShape();
vertex(96, 175);
bezierVertex(82, 156, 80, 149, 81, 139);
bezierVertex(67, 150, 47, 161, 33, 175);
endShape();

//red behind the scene
fill(230, 72, 0);
ellipse(150, 19, 19, 13);
ellipse(53, 74, 16, 14);
triangle(116, 58, 102, 70, 140, 71);

//purple banana
fill(87, 99, 181);
beginShape();
vertex(164, 0);
bezierVertex(125, 48, 126, 103, 172, 126);
bezierVertex(153, 79, 152, 47, 173, 0);
endShape();

//very top layer Finally!!!
//bk
fill(0);
beginShape();
vertex(155, 14);
bezierVertex(151, 18, 151, 20, 149, 24);
bezierVertex(156, 25, 157, 22, 158, 21);
bezierVertex(159, 18, 157, 15, 155, 14);
endShape();

triangle(136, 69, 142, 72, 136, 72);


//red
fill(227, 73, 0);
beginShape();
vertex(65, 22);
bezierVertex(25, 24, 26, 40, 26, 49);
bezierVertex(26, 67, 46, 74, 77, 75);
bezierVertex(69, 56, 68, 48, 65, 22);
endShape();

beginShape();
vertex(91, 99);
bezierVertex(92, 105, 91, 106, 93, 113);
bezierVertex(101, 111, 102, 109, 102, 104);
bezierVertex(101, 100, 98, 98, 90, 99);
endShape();


beginShape();
vertex(82, 142);
bezierVertex(81, 125, 77, 109, 47, 114);
bezierVertex(24, 118, 20, 142, 17, 175);
vertex(34, 174);
bezierVertex(50, 161, 60, 154, 81, 143);
endShape();

beginShape();
noStroke();
vertex(159, 59);
bezierVertex(151, 61, 150, 63, 150, 66);
bezierVertex(151, 71, 149, 73, 158, 74);
bezierVertex(158, 67, 158, 65, 159, 59);
endShape();

//bk
fill(0);
beginShape();
vertex(63, 74);
bezierVertex(61, 68, 58, 67, 57, 65);
bezierVertex(52, 65, 47, 65, 43, 71);
endShape();

