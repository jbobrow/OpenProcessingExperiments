
//frog robot by Tara Ting
size(480, 320);
background(255);
smooth();

//legs
stroke(132, 130, 51);
strokeWeight(8);
strokeCap(SQUARE);
//left
line(114, 162, 190, 187);
line(107, 133, 115, 164);
line(85, 152, 117, 163);
line(84.5, 167, 116.5, 162);

beginShape();
vertex(173, 215.5);
bezierVertex(173, 215.5, 106, 199.5, 102, 224);
bezierVertex(98.5, 249.5, 176.5, 256, 176.5, 256);
endShape();

line(177, 255, 147.5, 272.5);
line(174.5, 253.5, 171.5, 288.5);
line(174, 253, 187, 284.5);

//right
line(291.5, 193.5, 352, 159.5);
line(348, 161.5, 364.5, 136.5);
line(348, 161, 376, 146.5);
line(348, 161.5, 375.5, 175.5);

beginShape();
vertex(292.5, 220.5);
bezierVertex(292.5, 220.5, 360, 204.5, 363.5, 229.5);
bezierVertex(367.5, 254.5, 324, 266, 289, 261);
endShape();

line(289.5, 260.5, 318, 277);
line(291, 259.5, 294.5, 293);
line(292.5, 259, 294.5, 293);
line(291.5, 259.5, 279, 290);

noStroke();
fill(114, 191, 68);

//body
beginShape();
vertex(199.5, 150);
bezierVertex(199.5, 150, 145, 214, 171, 248);
bezierVertex(198, 282.5, 286.5, 277, 302.5, 248);
bezierVertex(324, 208, 269, 149.5, 269, 149.5);
endShape(CLOSE);

//head
ellipse(236, 116, 180, 114);

//eyes
ellipse(199, 53, 32, 32);
ellipse(271, 53, 32, 32);

//eye balls
fill(0);
ellipse(267, 53, 23, 23);
ellipse(202, 52.5, 23, 23);

//eye shines
fill(255);
ellipse(211, 51, 5, 5);
ellipse(258.5, 51, 5, 5);

//cheeks
fill(204, 124, 69);
ellipse(297.5, 93.5, 26, 23);
ellipse(177, 93.5, 26, 23);
fill(198, 95, 52 );
ellipse(297.5, 96, 19.5, 17 );
ellipse(177, 96.5, 19.5, 17);

//nose
stroke(0);
strokeWeight(1.5);
strokeCap(ROUND);
line(232.5, 88, 232.5, 91.5);
line(237.5, 88, 237.5, 91.5);
fill(255);
noStroke();

//mouth
beginShape();
vertex(169, 113);
bezierVertex(169, 113, 165, 137.5, 194, 154);
bezierVertex(223, 170.5, 270, 161.5, 282.5, 154);
bezierVertex(302, 142.5, 308, 120.5, 305, 110.5);
endShape();


