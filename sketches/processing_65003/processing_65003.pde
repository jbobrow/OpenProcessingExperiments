
// Corie Louie
// DMA 28 SUMMER 2012
// Workshop 2: Drawing With Code

// specific instructions
// can only use line(), triangle(), quad(), rect(), ellipse(), 
// arc(), beginShape(), endShape(), vertex()

size(640, 360);
background(226, 218, 196);
smooth();

// greyish parallogram
stroke(208, 204, 186);
fill(218, 214, 196);
quad(163, 150, 141, 182, 195, 168, 189, 144);

// rect touching dark color and brown rects
fill(224, 212, 151);
quad(329, 243, 329, 248, 404, 224, 404, 219);

noStroke();
// part of blue circle
fill(132, 168, 199);
arc(230, -20, 420, 420, 3.14/7, 3.14/3.7);

fill(226, 218, 196);
arc(230, -20, 365, 373, 3.14/6, 3.14/3.7);

// part of grey circle
fill(204, 199, 173);
arc(230, -20, 400, 400, 3.14/9.5, 3.14/4);

fill(226, 218, 196);
arc(220, -25, 370, 370, 3.14/10, 3.14/4.1);

// dark blue rectangle
fill(54, 45, 58);
quad(141, 182, 145, 200, 198, 183, 195, 169);


// brown rect near blue right bottom corner
fill(175, 151, 141);
quad(329, 243, 404, 219, 374, 198, 300, 222);

// dark color touching the brown rect
fill(57, 53, 48);
quad(300, 222, 329, 243, 329, 248, 299, 227);

// rect next to triangle side
stroke(208, 204, 186);
fill(218, 214, 196);
quad(385, 231, 381, 232, 386, 258, 390, 256);

noStroke();
// triangle
fill(98, 87, 75);
triangle(357, 240, 386, 258, 381, 232);

// red triangle
fill(230, 72, 59);
triangle(406, 245, 439, 301, 574, 221);

// lil black rect next to light brown rect
fill(38, 35, 35);
quad(437, 85, 453, 79, 453, 76, 436, 82);

// light brown rect
fill(225, 209, 161);
quad(437, 85, 557, 184, 577, 180, 453, 79);

// gold rect next to light brown rect
fill(168, 132, 67);
quad(453, 79, 577, 180, 578, 178, 453, 76);

// big blue square
fill(132, 168, 199);
quad(181, 104, 212, 250, 369, 218, 331, 68);

// part of red circle
fill(220, 64, 50);
arc(220, -13, 375, 370, 3.14/6.5, 3.14/2.38);

fill(132, 168, 199);
arc(219, -14, 338, 325, 3.14/4, 3.14/2.37);

fill(226, 218, 196);
arc(219, -14, 330, 332, 3.14/6.7, 3.14/4.1);

fill(226, 218, 196);
arc(219, -13, 235, 209, 3.14/6.5, 3.14/2.30);

// black rectangle
fill(38, 35, 35);
quad(251, 75, 256, 94, 345, 74, 340, 55);

// blue triangle
fill(132, 168, 199);
triangle(211, 98, 339, 101, 330, 68);

// big red rect
fill(220, 64, 50);
quad(27, 264, 276, 201, 267, 166, 17, 229);

// black circle
fill(40, 40, 40);
ellipse(225, 250, 100, 100);

// black long rect
fill(36, 34, 36);
quad(297, 183, 298, 188, 617, 114, 615, 109);

// light grey rect
stroke(208, 204, 186);
fill(210, 210, 203);
quad(228, 212, 229, 216, 456, 164, 454, 158);

fill(222, 218, 201);
quad(202, 223, 208, 226, 223, 221, 216, 217);

fill(222, 218, 201);
quad(208, 226, 158, 349, 175, 341, 223, 221);

fill(228, 233, 201);
quad(414, 132, 418, 135, 555, 113, 550, 110);

noStroke();
fill(36, 34, 36);
quad(414, 133, 414, 138, 418, 140, 418, 135);

fill(220, 64, 50);
quad(418, 135, 418, 140, 556, 118, 556, 113);

// red rect under light grey rect
fill(220, 64, 50);
quad(229, 216, 231, 218, 456, 165, 456, 163);

fill(220, 64, 50);
quad(202, 223, 151, 347, 158, 349, 208, 226);

fill(180, 183, 174);
quad(158, 273, 160, 284, 254, 262, 252, 252);

fill(219, 195, 114);
beginShape();
vertex(172, 270);
vertex(219, 260);
vertex(222, 274);
vertex(234, 271);
vertex(229, 245);
vertex(170, 259);
endShape(CLOSE);

fill(210, 210, 203);
beginShape();
vertex(377, 210);
vertex(377, 212);
vertex(379, 213);
vertex(379, 211);
vertex(427, 199);
vertex(425, 197);
endShape(CLOSE);

fill(220, 64, 50);
quad(379, 213, 379, 212, 427, 200, 427, 201);



