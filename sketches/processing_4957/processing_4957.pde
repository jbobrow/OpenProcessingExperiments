
size(320, 480);
background(255);

smooth();
strokeCap(ROUND);



// ROBOT BODY

// NECK
strokeWeight(4);
fill(80);
rect(153, 250, 14, 47);



// HEAD
noStroke();
beginShape();
vertex(158, 144);
bezierVertex(236, 146, 237, 201, 226, 233);
bezierVertex(214, 266, 113, 267, 96, 233);
bezierVertex(83, 206, 80, 139, 158, 144);
endShape(CLOSE);

// shade
fill(95);
beginShape();
vertex(158, 144);
bezierVertex(236, 146, 237, 201, 226, 233);
bezierVertex(222, 245, 206, 253, 186, 256);
bezierVertex(152, 263, 86, 192, 96, 172);
bezierVertex(105, 153, 123, 142, 158, 144);
endShape(CLOSE);

//fill(125);
//beginShape();
//vertex(177, 155);
//bezierVertex(216, 159, 227, 188, 222, 219);
//bezierVertex(218, 178, 202, 164, 177, 155);
//endShape(CLOSE);

stroke(0);
noFill();
beginShape();
vertex(158, 144);
bezierVertex(236, 146, 237, 201, 226, 233);
bezierVertex(214, 266, 113, 267, 96, 233);
bezierVertex(83, 206, 80, 139, 158, 144);
endShape(CLOSE);



// ANTENNA
strokeWeight(5);
line(202, 100, 187, 161);

strokeWeight(2);
fill(237, 28, 36);
ellipse(202, 100, 10, 10);



// EYES
fill(246, 235, 22);
ellipse(118, 220, 17, 17);
ellipse(205, 220, 17, 17);

// shade
noStroke();
fill(254, 251, 237);
ellipse(121, 219, 7, 7);
ellipse(208, 219, 7, 7);
stroke(0);



// WHEEL
strokeWeight(4);

// outside
fill(171);
ellipse(160, 338, 93, 93);

// middle
fill(80);
ellipse(160, 338, 79, 79);

//shade
noStroke();
fill(65);
ellipse(160, 338, 38, 38);
stroke(0);

// spokes
line(160, 299, 160, 378);
line(141, 304, 179, 372);
line(127, 318, 193, 359);
line(121, 338, 200, 338);
line(128, 359, 194, 318);
line(141, 372, 180, 305);

// inside
fill(255);
ellipse(160, 338, 15, 15);



// BUTTONS
strokeWeight(1);

// top row
fill(237, 34, 36);
rect(148, 221, 7, 7);
fill(246, 235, 22);
rect(157, 221, 7, 7);
fill(143, 80, 160);
rect(166, 221, 7, 7);

// middle row
fill(113, 192, 91);
rect(148, 230, 7, 7);
fill(69, 85, 165);
rect(157, 230, 7, 7);
fill(249, 159, 27);
rect(166, 230, 7, 7);

// bottom row
fill(255);
rect(148, 239, 7, 7);
fill(206, 76, 140);
rect(157, 239, 7, 7);
fill(68, 195, 211);
rect(166, 239, 7, 7);



// CUP HOLDER
strokeWeight(2);
fill(55);
ellipse(160, 157, 40, 14);

fill(30);
beginShape();
vertex(148, 162);
bezierVertex(152, 160, 163, 157, 173, 162);
bezierVertex(163, 165, 150, 163, 148, 162);
endShape();

