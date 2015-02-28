
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
ellipse(360, 231.373, 70, 15);
ellipse(150, 231.373, 70, 15);

//nostril
noStroke();
fill(179, 114, 176);
ellipse(240, 270.996, 25.011, 20);
ellipse(270, 270.996, 25.011, 20);

//stache left
noStroke();
fill(0);
beginShape();
vertex(250, 287);
vertex(254, 293);
vertex(223, 310);
vertex(115, 144);
vertex(116, 140);
vertex(227, 300);
endShape();

//stache right
noStroke();
fill(0);
beginShape();
vertex(269, 289);
vertex(266, 297);
vertex(299, 310);
vertex(396, 144);
vertex(395, 140);
vertex(296, 300);
endShape();

//eye
noStroke();
fill(0);
ellipse(300, 199, 10, 40);
ellipse(220, 199, 10, 40);

//mouth
fill(0);
noStroke();
rect(247, 310, 22, 70);

//goatee
fill(0);
noStroke();
beginShape();
vertex(244, 411);
vertex(276, 411);
vertex(258, 461);
endShape();

//eyebrows right
noFill();
stroke(0);
strokeWeight(8);
strokeCap(ROUND);
arc(300, 170, 50, 170, PI+.08, TWO_PI);
arc(220, 170, 50, 170, PI+.08, TWO_PI);




