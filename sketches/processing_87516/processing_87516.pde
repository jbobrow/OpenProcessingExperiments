
size(500, 500);
smooth();
background(255);

//eye ball
strokeWeight(6);
noFill();
stroke(0);
ellipse(175.47, 170.43, 134.131, 134.131);
ellipse(328.16, 170.43, 134.131, 134.131);

//eyes
noStroke();
fill(0);
ellipse(325.85, 232.11, 49.7, 10.778);
ellipse(175.47, 232.11, 49.7, 10.778);

//nose
noStroke();
fill(254, 250, 211);
beginShape();
vertex(305.92, 250.97);
vertex(252.5, 343.49);
vertex(199.09, 250.97);
endShape();

//mouth
stroke(0);
noFill();
strokeWeight(1);
ellipse(252.31, 390.19, 20.358, 20.358);

//eyelash left eye
fill(0);
quad(144.07, 53.15, 154.73, 53.55, 162, 104, 151, 106);
quad(167, 53, 178, 53, 178, 105, 167, 104);
quad(194, 53, 204, 54, 196, 105, 185, 103);

//eyelash right eye
fill(0);
quad(298, 55, 309, 53, 316, 104, 306, 106);
quad(321, 53, 332, 53, 332, 104, 321, 104);
quad(348, 52, 358, 54, 350, 105, 339, 103);


