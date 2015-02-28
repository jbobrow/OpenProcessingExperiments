
// Anna Lee
// DMA 28 Summer 2012
// Workshop 2

size(640, 360);
background(229, 216, 195);
smooth();
noStroke();

// light blue square
fill(113, 154, 197);
quad(244, -281, 777, -411, 910, 123, 372, 250);

// big red rectangle
fill(220, 54, 50);
quad(-330, 160, 550, -64, 581, 60, -296, 281);

// dark blue rectangle
fill(42, 41, 63);
quad(109, -7, 299, -53, 312, -4, 124, 44);

// black circle
fill(41, 38, 39);
ellipse(413, 238, 358, 356);

// right red-gray bar
fill(183, 29, 21);
quad(418, 117, 1217, -70, 1220, -62, 422, 122);
fill(211, 206, 200);
quad(413, 99, 1214, -87, 1217, -70, 418, 117);

// left red-gray bar
fill(206, 43, 40);
quad(317, 138, 343, 150, 165, 587, 142, 577);
fill(228, 218, 201);
quad(317, 138, 370, 117, 395, 129, 343, 150);
quad(343, 150, 395, 129, 227, 556, 165, 587);

// gray rect
fill(171, 172, 166);
quad(164, 316, 500, 240, 508, 277, 171, 352);

// yellow L
fill(221, 193, 101);
beginShape();
vertex(209, 261);
vertex(418, 212);
vertex(439, 305);
vertex(391, 316);
vertex(380, 268);
vertex(218, 304);
endShape(CLOSE);

