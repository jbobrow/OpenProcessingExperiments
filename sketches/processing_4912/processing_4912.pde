
//MR. TOAST V 0.A
//TRENTON SZEWCZYK
//DMA 28, FALL 2009
size(320, 480);
//sky
background(157, 240, 244);
//Mr. Toast
PFont x;
x = loadFont("OCRAStd-48.vlw");
textFont(x, 48);
fill(255, 129, 3);
text("Mr. Toast", 3, 62);
textFont(x, 48);
fill(203, 58, 156);
text("Mr. Toast", 0, 60);
//grass
fill(15, 160, 25);
noStroke();
rect(0, 380, 320, 100);
//Toast
fill(255, 204, 170);
stroke(128, 51, 0);
strokeWeight(3);
ellipse(167, 260, 60, 70);
ellipse(167, 234, 60, 20);
noStroke();
ellipse(167, 238, 52, 20);
//body
fill(140);
stroke(67, 40, 64);
strokeWeight(4);
rect(125, 264, 84, 84);
fill(67, 40, 64);
//handle
arc(120, 275, 10, 15, 0, 180);
//eyes
fill(255);
stroke(255, 0, 0);
strokeWeight(.5);
rect(140, 280, 26, 26);
rect(180, 280, 26, 26);
//pupils
fill(0);
noStroke();
rect(158, 288, 8, 8);
rect(198, 288, 8, 8);
//mouth
fill(255, 253, 15);
rect(145, 331, 55, 15);
//grill
fill(140);
beginShape(QUADS);
vertex(150, 331);
vertex(150, 346);
vertex(155, 346);
vertex(155, 331);

vertex(160, 331);
vertex(160, 346);
vertex(165, 346);
vertex(165, 331);

vertex(170, 331);
vertex(170, 346);
vertex(175, 346);
vertex(175, 331);

vertex(180, 331);
vertex(180, 346);
vertex(185, 346);
vertex(185, 331);

vertex(190, 331);
vertex(190, 346);
vertex(195, 346);
vertex(195, 331);
endShape();
//legs
fill(67, 40, 64);
triangle(125, 348, 130, 400, 135, 348);
triangle(200, 348, 205, 400, 210, 348);
//feet
arc(127, 405, 20, 20, PI-PI/64, TWO_PI);
arc(205, 405, 20, 20, PI-PI/64, TWO_PI);

