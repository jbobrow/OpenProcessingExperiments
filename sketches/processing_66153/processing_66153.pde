

size(250,234);
background(248,250,236);
colorMode(HSB,360, 100, 100); // range 1, range2, range

//purple moon
fill(237, 46, 69);
beginShape();
vertex(228, 168);
bezierVertex(130, 130, 174, 60, 220, 0);
bezierVertex(0, 0, 0, 0, 232, 0);
bezierVertex(211, 70, 225, 162, 228, 168);
endShape();

//top black lines
smooth();
noFill();
bezier(86, 0, 88, 22, 91, 35, 90, 30);
bezier(87, 0, 97, 13, 115, 17, 150, 0);
bezier(22, 0, 28, 2, 24, 24, 26, 13);

//line snow flakes
smooth();
strokeWeight(1);
line(156, 144, 153, 186);
line(138, 163, 172, 168);
line(145, 153, 168, 183);
line(169, 155, 139, 178);

line(186, 201, 183, 234);
line(162, 218, 205, 227);
line(169, 201, 191, 234);
line(206, 208, 169, 234);

//line right
line(248, 28, 248, 55);

//line body
line(155, 29, 155, 76);
line(140, 43, 172, 42);

//middle black lines
noFill();
bezier(101, 100, 117, 113, 145, 141, 108, 188);

//circle big
//red
fill(18, 100, 88);
bezier(89, 30, 47, 32, 46, 91, 100, 100);
bezier(89, 30, 85, 52, 90, 76, 100, 100);

//red bottom large
bezier(23, 234, 20, 150, 108, 134, 108, 188); 
//coloring it in
noStroke();
bezier(108, 188, 95, 196, 40, 187, 42, 240); 
bezier(42, 240, 23, 246, 16, 244, 32, 213); 
bezier(32, 213, 46, 210, 50, 235, 36, 236); 

//black
fill(0, 82, 0);
bezier(89, 30, 168, 37, 151, 105, 100, 100);
bezier(89, 30, 95, 88, 110, 110, 100, 100);
bezier(89, 30, 85, 52, 90, 76, 100, 100);

//black PoLKAdOTs
bezier(250, 10, 238, 9, 237, 28, 250, 30);
bezier(250, 52, 227, 43, 225, 75, 250, 72);

ellipse(155, 23, 17, 17);

//halfmoons
//black
bezier(221, 80, 228, 86, 228, 95, 221, 100); //pair 1
bezier(203, 22, 210, 37, 205, 40, 193, 37); //pair 2
bezier(126, 129, 108, 131, 106, 149, 126, 153); //pair 3

//red
fill(18, 100, 88);
bezier(222, 79, 207, 79, 204, 90, 222, 100); //pair 1
bezier(203, 22, 187, 21, 185, 29, 193, 38); //pair 2
bezier(126, 129, 139, 137, 142, 143, 126, 153); //pair 3

//triangle
//red
fill(18, 100, 88);
beginShape(TRIANGLES);
vertex(130, 101);
vertex(155, 77);
vertex(182, 102);

//black
fill(0, 82, 0);
vertex(170, 91);
vertex(182, 102);
vertex(169, 102);

//bottom
vertex(228, 234);
vertex(250, 188);
vertex(246, 234);
endShape();

//hardest shapes

//small
beginShape();
vertex(0, 111);
bezierVertex(12, 93, 15, 81, 9, 65);
bezierVertex(8, 81, 3, 95, 0, 100);
endShape();

//bottom black triangle
beginShape();
vertex(130, 234);
bezierVertex(117, 217, 110, 200, 108, 188);
bezierVertex(98, 194, 47, 230, 45, 234);
endShape();

