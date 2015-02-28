
size(500, 500);
background(195, 193, 113);
smooth();

//hair

noStroke();
fill(0);
ellipse(256.33, 149.89, 372, 273.176);
rect(70.334, 149.893, 372, 334.107);

//mask
noStroke();
fill(255);
rect(104.759, 98.269, 300, 149.604);
beginShape();
vertex(104.47, 247);
vertex(405.1, 247);
vertex(269.36, 489.94);
vertex(255.77, 491.42);
vertex(242.55, 489.94);
endShape();

//cheeks
noStroke();
fill(204, 104, 135);
ellipse(360, 231.373, 54, 32.513);
ellipse(150, 231.373, 54, 32.513);

//nostril
noStroke();
fill(179, 114, 176);
ellipse(240, 270.996, 25.011, 3.978);
ellipse(270, 270.996, 25.011, 3.978);

//stache left
noStroke();
fill(0);
beginShape();
vertex(243, 292);
vertex(250, 296);
vertex(231, 325);
vertex(173, 290);
vertex(177, 286);
vertex(227, 315);
endShape();

//stache right
noStroke();
fill(0);
beginShape();
vertex(260, 297);
vertex(265, 292);
vertex(288, 310);
vertex(333, 267);
vertex(336, 271);
vertex(286,322);
endShape();

//right eye
noStroke();
fill(0);
ellipse(320, 199, 70, 13);
ellipse(190, 199, 70, 13);

//mouth
fill(0);
noStroke();
rect(247, 330, 22, 5);

//goatee
fill(0);
noStroke();
beginShape();
vertex(244, 353);
vertex(276, 353);
vertex(258, 461);
endShape();

//eyebrows right
noFill();
stroke(0);
strokeWeight(10);
strokeCap(ROUND);
arc(325, 170, 97, 125, PI+.08, TWO_PI);
arc(190, 170, 97, 125, PI+.08, TWO_PI);




