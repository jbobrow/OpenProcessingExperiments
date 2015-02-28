
size(250, 234);
background(249, 244, 222);
smooth();
noFill();



// bezier (x1, y1, cx1, cy1, cx2, cy2, x2, y2); 

bezier(240, 0, 65, 80, 120, 180, 300, 200);

bezier(0, 15, 14, 21, 16, 52, 0, 60);

bezier(0, 89, 14, 101, 11, 128, 0, 140);

bezier(86, 167, 88, 214, 80, 233, 81, 233); 

fill(0);
beginShape();
vertex(37, 0);
bezierVertex(8, 170, 144, 130, 135, 135);
bezierVertex(180, 100, 110, 110, 134, 103);
bezierVertex(99, 94, 99, 70, 99, 20);
bezierVertex(98, 92, 100, 19, 101, 75);
vertex(105,0);
endShape();

beginShape();
vertex(6, 18);
bezierVertex(6, 18, 21, 14, 23, 27);
bezierVertex(24.5, 35, 14, 37, 12, 36);
endShape();

beginShape();
vertex(152, 60);
bezierVertex(152, 60, 162, 53, 163, 49);
bezierVertex(163, 45, 155, 45, 150, 50);
bezierVertex(146, 54, 150, 53, 152, 60);
endShape();

beginShape();
vertex(87, 190);
bezierVertex(87, 190, 106, 190, 111, 203);
bezierVertex(117, 214, 112, 219, 105, 226);
bezierVertex(98, 231, 81, 231, 81, 231); 
bezierVertex(81, 231, 85, 189, 85, 189);
endShape();

beginShape();
vertex(184, 83);
bezierVertex(184, 83, 221, 69, 199, 101);
bezierVertex(196, 105, 160, 95, 184, 83);
endShape();

beginShape();
vertex(199, 100);
bezierVertex(199, 100, 222, 112, 205, 121);
bezierVertex(193, 122, 192, 104, 199, 101);
endShape();

beginShape(TRIANGLES);
vertex(186,193);
vertex(209, 192);
vertex(201, 203);

vertex(226, 92);
vertex(243, 71);
vertex(249, 79);

vertex(12,117);
vertex(12, 145);
vertex(-9, 145);

vertex( 201, 203);
vertex(212, 217);
vertex(190, 215);
endShape();

vertex(12,117);
vertex(47, 153);
vertex(12, 145);


stroke(0);
strokeWeight (1);
strokeCap(ROUND);
line(140, 184, 137, 211);
line(122, 201, 152, 201);
line(131, 188, 141, 210);
line(155, 189, 131, 206);
line(194, 227, 193, 233);
line(236, 213, 235, 233);
line(154, 154, 151, 170);

ellipse(0, 87, 20, 20);
ellipse(84, 165, 35, 20);
ellipse(134, 233, 32, 25);
ellipse(234,216, 22, 20);
ellipse(223, 186, 16, 14);
ellipse(190, 173, 20, 18);
ellipse(154, 149, 10, 10);
ellipse(152, 171, 8, 8);
ellipse(249, 67, 25, 25);


noStroke();
fill(235, 68, 15);
beginShape();
vertex(125, 100);
bezierVertex(140, 98, 146, 96, 160, 110);
bezierVertex(165, 134, 138, 135, 132, 133);
bezierVertex(125, 132, 118, 106, 128, 99);
endShape();

beginShape();
vertex(87, 190);
bezierVertex(87, 190, 46, 188, 45, 202);
bezierVertex(41, 220, 50, 229, 80, 230);
endShape();

ellipse(189, 27, 22, 20);
ellipse(157, 54, 17, 15); 
ellipse(10, 26, 24, 20);
ellipse(249, 72, 25, 10);
ellipse(154, 151, 10, 6);
ellipse(190, 167, 20, 8);
ellipse(223, 189, 16, 8);

beginShape(TRIANGLES);
vertex(12,117);
vertex(47, 153);
vertex(12, 145);






noStroke();
fill(0);
beginShape();
vertex(180, 34);
bezierVertex(180, 34, 192, 24, 197, 24);
bezierVertex(203, 24, 199, 34, 196, 36);
bezierVertex(192, 36, 188, 40, 180, 34);
endShape();

fill(0);
ellipse(157, 50, 14, 7);

fill(76, 67, 145);
beginShape(TRIANGLES);
vertex(27, 204);
vertex(30, 169);
vertex(7, 205);

vertex(27, 204);
vertex(30, 169);
vertex(11, 205);

vertex(28, 198);
vertex(50, 215);
vertex(2, 225);

vertex(29, 213);
vertex(32, 232);
vertex(14, 216);

vertex(27, 198);
vertex(19, 222);
vertex(-15,200);

