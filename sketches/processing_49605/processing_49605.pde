
//init background
size(640, 360);
background(229, 223, 207);
smooth();

//drawing blue shape
fill(103, 147, 194);
beginShape();
vertex(95, 19);
vertex(170, 0);
vertex(640, 0);
vertex(640, 120);
vertex(117, 242);
endShape();

//drawing part of the circle
fill(38, 34, 33);
ellipse(0, 360, 454, 760);

//triangle top left
fill(194, 199, 193);
triangle(0, 0, 0, 25, 118, 0);

//stripe under triangle
fill(180, 27, 21);
quad(0, 25, 118, 0, 170, 0, 0, 40);

//top of 3D block
fill(169, 151, 141);
beginShape();
vertex(454, 164);
vertex(640, 120);
vertex(640, 232);
vertex(582, 251);
endShape();

//shaded left side of block
fill(66, 61, 55);
quad(404, 175, 454, 164, 582, 251, 582, 300);

//unshaded right side of block
fill(227, 213, 174);
quad(582, 251, 640, 232, 640, 280, 582, 300);

//shape on bottom left
fill(173, 176, 169);
beginShape();
vertex(0, 308);
vertex(43, 298);
vertex(56, 360);
vertex(0, 360);
endShape();

