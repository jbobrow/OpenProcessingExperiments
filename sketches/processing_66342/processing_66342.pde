
size(187,175);
smooth();
background(252, 250, 239);

// ALL BLACK ELLIPSES
//counting left to right
noStroke();
fill(0);
ellipse(61, .75 , 13, 12.5); //1
ellipse(159, 3.583, 10, 11.667); //2
ellipse(178, 3.583, 8.293, 7.974); //3
ellipse(60.751, 22.667, 13.499, 9.335); //4
ellipse(184.084, 28.292, 16.5, 10.917); //5
ellipse(-5.083, 57.833, 13.499, 9.335); //6
ellipse(129.583, 49.167, 13.501, 12); //7
ellipse(184.959, 55.334, 16.75, 11.333); //8
ellipse(117.832, 89.083, 10.001, 7.833); //9
ellipse(139.666, 91.372, 8.998 , 7.259); //10
ellipse(170.414, 111.917, 11.268, 10.834); //11
ellipse(105.681, 138.417, 14.733, 14.167); //12
ellipse(171.081 , 136.5, 17, 13.667); //13

//STARS
//counting clockwise starting at 12
//left star
stroke(0);
line(86.833, 82.167, 83.833, 100.834); //1
line(93.5, 83.833, 79.167, 97.167); //2
line(94, 91.5, 79.167, 90.5); //3
line(92.167, 97.167, 79.167, 86.167); //4
//right star
line(167.501, 71.834, 164.78, 98); //1
line(180.645, 74.167, 155.834, 95); //2
line(180.645, 86, 154, 86); //3
line(176.584, 98.167, 154, 74); //4

//STRAIGHT LINES
//couting left to right
strokeWeight(.5);
line(7.834, 19.5, 24.5, 0); //1
line(61, 0.75, 60.751, 22.667); //2
line(151.037, 0, 159, 5.5); //3
line(7.834, 19.5, 0, 43.167); //4
line(184, 28.929, 184, 55.334); //5
line(117.832, 89.083, 139.666, 91.371); //6
line(170.414, 111.917, 171.081, 136.5); //7
line(12, 166, 17.5, 175);

//SPIRALS
//bottom
noFill();
beginShape();
curveVertex(113, 175);
curveVertex(113, 175);
curveVertex(132, 166);
curveVertex(146, 153);
curveVertex(154, 124);
curveVertex(132, 104);
curveVertex(105, 104);
curveVertex(84,  119);
curveVertex(84,  143);
curveVertex(101, 159);
curveVertex(125, 153);
curveVertex(136, 133);
curveVertex(120, 122);
curveVertex(106, 137);
curveVertex(106, 137);
endShape();
//top
beginShape();
curveVertex(113,0);
curveVertex(113,0);
curveVertex(103, 27);
curveVertex(101, 39);
curveVertex(101, 52);
curveVertex(106, 67);
curveVertex(119, 77);
curveVertex(140, 72);
curveVertex(155, 58);
curveVertex(158, 43);
curveVertex(153, 28);
curveVertex(136, 21);
curveVertex(117, 31);
curveVertex(111, 40);
curveVertex(113, 57);
curveVertex(127, 64);
curveVertex(139, 61);
curveVertex(149, 51);
curveVertex(145.5, 34.5);
curveVertex(136, 33);
curveVertex(128, 40);
curveVertex(130, 49);
curveVertex(130, 49);
endShape();

//WEIRD ANNOYING BLACK SHAPES
//bigger one
fill(0);
beginShape();
vertex(66, 175);
bezierVertex(67, 115, 61, 112, 61, 112);
bezierVertex(49, 125, 49, 154, 49, 146);
bezierVertex(54, 176, 66, 175, 66, 175);
endShape();
//smaller one
beginShape();
vertex(0,109);
vertex(31, 101);
bezierVertex(24, 117, 7, 118, 15, 117);
bezierVertex(4, 114, 0, 109, 0, 109);
endShape();
//eye
beginShape();
vertex(0, 136.5);
bezierVertex(20, 155.5, 22.5, 162.5, 22.5, 162.5);
bezierVertex(9, 167, 0, 170, 0, 170);
endShape(CLOSE);

//YELLOW EYE
noStroke();
fill(246, 235, 90);
beginShape();
vertex(0, 145.5);
bezierVertex(7, 148, 10, 155, 8.5, 152);
bezierVertex(15, 162.5, 19, 162.5, 19, 162.5);
bezierVertex(6, 167, 0, 167, 0, 167);
endShape(CLOSE);

//WAVY LINES
//counting left to right starting from bottom
//1 (horizontal)
noFill();
stroke(0);
beginShape();
vertex(31, 101);
bezierVertex(52, 94, 71, 130, 61,112);
endShape();
//2
beginShape();
vertex(61, 112);
bezierVertex(73, 97, 73, 70, 73, 84);
vertex(77, 21);
endShape();
//3
beginShape();
vertex(31, 101);
bezierVertex(39, 77, 34, 37, 36, 57);
bezierVertex(41, 15, 57, -15, 47, 0);
endShape();

//EYELASHES
//1
beginShape();
vertex(0, 133);
bezierVertex(3, 130, 3, 122, 3, 122);
endShape();
//2
beginShape();
vertex(6, 142);
bezierVertex(20, 139, 19, 124, 19, 124);
endShape();
//3
beginShape();
vertex(13, 149);
bezierVertex(33, 148, 33, 130, 33, 130);
endShape();

//BLUE TRIANGLE
noStroke();
fill(100, 108, 172);
triangle(165, 175, 180, 163, 175, 175);

//BLACK AND RED ELLIPSES
noStroke();
fill(0);
ellipse(10.5, 17, 10, 10); //1
ellipse(41, 23, 13, 12); //2
ellipse(109, 5, 27, 26); //3
ellipse(-.5, 38, 16, 18); //4
ellipse(37, 49, 11, 10); //5
ellipse(76, 45, 12, 10); //6
ellipse(104, 27, 10, 8.5); //7
ellipse(35.5, 78, 11, 9); //8
ellipse(73, 73, 23, 20); //9
ellipse(114, 74, 13, 11); //10
ellipse(50, 102, 8, 8); //11
ellipse(148.5, 150, 13, 12); //12

//RED HALVES
fill(239, 110, 76);
//1
beginShape();
vertex(7.5, 21);
bezierVertex(12, 25, 20, 16, 15.5, 20.5);
bezierVertex(18, 13, 9, 11, 14, 12);
endShape(CLOSE);
//2
beginShape();
vertex(40, 29);
bezierVertex(35, 27, 35, 13.5, 34.5, 20.5);
bezierVertex(38, 16, 44, 17.5, 41, 17);
endShape(CLOSE);
//3
beginShape();
vertex(107, 18);
bezierVertex(135, 23, 128, 0, 126, 0);
vertex(114, 0);
endShape(CLOSE);
//4
beginShape();
vertex(0, 29); 
bezierVertex(3, 29, 5, 32, 5, 32);
vertex(0, 40);
endShape(CLOSE);

//9
beginShape();
vertex(73, 83);
bezierVertex(86.5, 84, 87.5, 74, 87.5, 74);
bezierVertex(80,70, 75, 63.5, 75, 63.5);
endShape(CLOSE);
//11
beginShape();
vertex(46, 100);
bezierVertex(44, 105, 51, 109, 48, 107);
bezierVertex( 53, 110, 56, 106, 56, 106);
endShape(CLOSE);

//12
beginShape();
vertex(144, 154);
bezierVertex(148, 157, 153, 154, 154, 153);
bezierVertex(154, 146, 152, 145, 152, 145);
endShape(CLOSE);









