
//Gabriela Nisenbaum
//Feb. 9, 2013
//Picasso Painting

size(180, 275);

//red under top trianlge
fill(172, 125, 99);
beginShape();
vertex(95, 14);
vertex(104, 68);
vertex(119, 59);
vertex(118, 13);
endShape(CLOSE);

//black background
fill(0);
beginShape();
vertex(0, 230);
vertex(0,0);
vertex(84, 0);
vertex(104, 26);
vertex(104, 72);
endShape(CLOSE);
beginShape();
vertex(104, 0);
vertex(111, 67);
vertex(161, 0);
endShape(CLOSE);
fill(255);


//top triangles
fill(42, 133, 109);
beginShape();
vertex(77, 28);
vertex(61, 0);
vertex(57, 0);
vertex(63, 25);
endShape(CLOSE);
beginShape();
vertex(44, 0);
vertex(58, 25);
vertex(45, 25);
endShape(CLOSE);
beginShape();
vertex(32, 0);
vertex(34, 27);
vertex(16, 26);
endShape(CLOSE);
beginShape();
vertex(23, 0);
vertex(11, 27);
vertex(3, 27);
vertex(7, 16);
endShape(CLOSE);
fill(255);

//top right corner shape, green
fill(69, 88, 34);
beginShape();
vertex(15, 0);
vertex(7, 15);
vertex(4, 26);
vertex(0, 26);
vertex(0, 13);
vertex(10, 2);
endShape(CLOSE);
fill(255);

//top vertical line, grey
fill(133, 136, 119);
beginShape();
vertex(8, 36);
vertex(18, 31);
vertex(17, 23);
vertex(26, 0);
vertex(22, 0);
vertex(14, 20);
vertex(12, 29);
vertex(7, 32);
endShape(CLOSE);
fill(255);

//top red triangle
noStroke();
fill(192, 52, 18);
beginShape();
vertex(85, 0);
vertex(105, 25);
vertex(113, 0);
endShape(CLOSE);
fill(255);

//top horizontal, turquoise
fill(42, 133, 109);
beginShape();
vertex(0, 36);
vertex(0, 44);
vertex(89, 41);
vertex(91, 39);
vertex(98, 39);
vertex(100, 33);
vertex(4, 41);
vertex(9, 37);
endShape(CLOSE);
fill(255);

//top horizontal, red
fill(136, 91, 64);
beginShape();
vertex(31, 55);
vertex(56, 55);
vertex(59, 53);
vertex(71, 53);
vertex(72, 54);
vertex(78, 54);
vertex(78, 48);
endShape(CLOSE);


//red vertical
beginShape();
vertex(80, 60);
vertex(82, 100);
vertex(79, 103);
endShape(CLOSE);
fill(255);

//left corner line
stroke(169, 168, 134);
noFill();
strokeWeight(7);
beginShape();
curveVertex(0, 160);
curveVertex(0, 160);
curveVertex(7, 145);
curveVertex(7, 52);
curveVertex(7, 52);
endShape();
strokeWeight(1);
stroke(0);

//bottom horizontal, white
stroke(216, 205, 168);
strokeWeight(10);
line(33, 174, 0, 172);
strokeWeight(1);
stroke(0);

//back of windows, green
fill(69, 88, 34);
strokeWeight(7);
rect(12, 60, 62, 101);
fill(255);
strokeWeight(1);

//back of window, turquoise
fill(42, 133, 109);
beginShape();
vertex(70, 73);
vertex(37, 101);
vertex(15, 159);
vertex(75, 155);
endShape(CLOSE);
fill(255);

//right window
fill(186, 198, 169);
rect(47, 70, 15, 82);
strokeWeight(1);
fill(255);

//left window, top
fill(0);
beginShape();
vertex(18, 67);
vertex(18, 118);
vertex(36, 118);
vertex(36, 101);
endShape(CLOSE);
fill(186, 198, 169);
beginShape();
vertex(18, 67);
vertex(36, 101);
vertex(36, 68);
endShape(CLOSE);
fill(255);

//left window, bottom
fill(0);
beginShape();
vertex(18, 126);
vertex(18, 151);
vertex(36, 151);
vertex(36, 126);
endShape(CLOSE);
fill(255);

//back white shape
fill(204, 199, 134);
beginShape();
vertex(163, 1);
vertex(15, 235);
vertex(14, 275);
vertex(113, 275);
vertex(182, 132);
vertex(182, 1);
endShape(CLOSE);
fill(255);

//top brick line
fill(113, 41, 12);
beginShape();
vertex(172, 110);
vertex(171, 105);
vertex(174, 86);
vertex(173, 19);
vertex(167, 16);
vertex(165,65);
vertex(163, 70);
vertex(166, 80);
vertex(165, 98);
vertex(161, 120);
endShape(CLOSE);
fill(255);

//diagonal line, white
stroke(216, 205, 168);
strokeWeight(17);
line(159, 0, 0, 240);
strokeWeight(1);
stroke(0);

//diagonal line, yellow
fill(206, 181, 5);
noStroke();
beginShape();
vertex(28, 216);
vertex(32, 202);
vertex(30, 195);
vertex(56, 137);
vertex(60, 136);
vertex(133, 29);
vertex(138, 31);
vertex(156, 16);
vertex(155, 22);
endShape(CLOSE);
strokeWeight(5);
fill(177, 141, 47);
beginShape();
vertex(43, 197);
vertex(66, 165);
vertex(68, 157);
vertex(73, 154);
vertex(82, 142);
vertex(82, 135);
vertex(153, 25);
vertex(150, 26);
vertex(80, 135);
endShape();
strokeWeight(1);
fill(255);

//bottom vertical, brown
stroke(67, 39, 24);
strokeWeight(8.5);
line(3, 246, 3, 276);
strokeWeight(1);
stroke(0);

//bottom vertical, white
stroke(216, 205, 168);
strokeWeight(8.5);
line(10, 242, 10, 276);
strokeWeight(1);
stroke(0);

//black outline
line(34, 207, 15, 237);
line(15, 237, 16, 239);
line(16, 239, 15, 236);
line(15, 236, 0, 243);
strokeWeight(2);
line(6, 241, 6, 275);
strokeWeight(1);

//bottom corner curve
strokeWeight(7);
stroke(41, 24, 26);
fill(104, 142, 86);
beginShape();
curveVertex(100, 282);
curveVertex(100, 282);
curveVertex(117, 191);
curveVertex(163, 119);
curveVertex(185, 110);
curveVertex(185, 110);
curveVertex(185, 282);
curveVertex(185, 282);
endShape();
strokeWeight(1);

//bottom corner curve highlight
noStroke();
fill(150, 188, 167);
beginShape();
curveVertex(182, 115);
curveVertex(182, 115);
curveVertex(159, 130);
curveVertex(144, 153);
curveVertex(144, 162);
curveVertex(182, 146);
curveVertex(182, 146);
endShape(CLOSE);


//brown shape
strokeWeight(3);
fill(110, 52, 32);
beginShape();
curveVertex(185, 112);
curveVertex(185, 112);
curveVertex(168, 117);
curveVertex(162, 128);
curveVertex(180, 124);
curveVertex(180, 124);
endShape();
strokeWeight(1);

//bottom corner shape
fill(150, 188, 167);
rect(167, 240, 28, 69);
fill(71, 98, 28);
rect(173, 243, 17, 61);
fill(255);

//bottom left shape, green
fill(69, 88, 34);
beginShape();
vertex(0, 182);
vertex(7, 186);
vertex(7, 192);
vertex(12, 195);
vertex(0, 207);
endShape(CLOSE);

//top shape, green
beginShape();
vertex(87, 61);
vertex(85, 51);
vertex(96, 50);
vertex(98, 51);
vertex(99, 48);
vertex(101, 43);
vertex(104, 52);
vertex(103, 56);
vertex(100, 57);
vertex(98, 61);
vertex(97, 69);
vertex(95, 60);
vertex(97, 54);
vertex(92, 54);
vertex(90, 51);
endShape(CLOSE);
fill(255);

//black diagonal
strokeWeight(7);
line(143, 0, 0, 220);
