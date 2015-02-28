
size (640, 480);
background(255);

pushMatrix();
translate (-80, -20);
noStroke();
ellipseMode(CORNER);

fill(150);
beginShape();
vertex(199, 433);
vertex(308, 461);
vertex(500, 278);
vertex(407, 269);
endShape();

fill(190, 36, 35);
ellipse(200, 415, 116, 61);
rect(200, 235, 116, 213);
fill(255, 36, 35);
ellipse(200, 200, 116, 73);
beginShape();
vertex(238, 166);
vertex(280, 166);
vertex(289, 207);
vertex(228, 207);
endShape();
ellipse(228, 173, 61, 6);

fill(0, 147, 69);
ellipse(232, 157, 52, 13);
rect(232, 123, 52, 40);
ellipse(232, 103, 52, 35);

fill(0, 190, 69);
ellipse(243, 100, 30, 15);
beginShape();
vertex(243, 108);
vertex(273, 108);
vertex(263, 58);
vertex(252, 58);
endShape();

translate(57, 60);
stroke(255);
strokeWeight(2);
fill(190, 36, 35);
beginShape();
vertex(184, 275);
vertex(177, 277);
vertex(170, 286);
vertex(170, 298);
vertex(193, 311);
vertex(210, 297);
vertex(204, 286);
vertex(184, 281);
vertex(184, 275);
endShape();
beginShape();
vertex(200, 285);
vertex(214, 267);
vertex(231, 275);
vertex(233, 307);
vertex(225, 317);
vertex(200, 285);
endShape();
ellipse(172, 260, 15, 17);
ellipse(177, 265, 2, 2);
triangle(168, 270, 173, 268, 173, 273);
triangle(177, 260, 178, 257, 179, 260);
triangle(180, 260, 182, 256, 182, 260);
triangle(183, 260, 187, 257, 185, 263);
rect(186, 306, 2, 15);
rect(192, 306, 2, 15);
rect(182, 322,6, 1);
rect(188, 322, 6, 1);

fill(255);
text("SRIRACHA", 170, 350);


