
void setup() {
size(640, 360);
background(225, 220, 195);
 
//black square-top 
smooth();
fill(30, 30, 30);
beginShape();
vertex(171, 27);
vertex(177, 54);
vertex(290, 29);
vertex(284, 2);
endShape(CLOSE);
 
//brown triangle
noStroke();
smooth();
fill(90, 70, 60);
triangle(340, 267, 333, 227, 304, 238);
 
//brown triangle (white side)
strokeWeight(.5);
stroke(141, 127, 86);
smooth();
fill(231, 221, 204);
quad(345, 264, 340, 266, 332, 226, 337, 226);
 
//tope square 
noStroke();
smooth();
fill(185, 142, 127);
quad(269, 244, 363, 211, 327, 184, 231, 218);
 
//tope square (yellow side) 
smooth();
fill(225, 215, 174);
quad(269, 244, 364, 212, 365, 218, 269, 253);
 
//tope square (black side) 
smooth();
fill(55, 52, 51);
quad(269, 253, 269, 244, 243, 226, 234, 227);

//dark blue rectangle (top white)
smooth();
stroke(141, 127, 86);
strokeWeight(.5);
fill(225, 220, 200);
quad(32, 164, 60, 123, 107, 113, 100, 148);

//dark blue rectangle 
noStroke();
smooth();
fill(19, 23, 57);
quad(32, 164,  108, 145,  115, 170, 40, 190);
 
//big blue square 
noStroke();
smooth();
fill(104, 156, 198);
quad(81, 66,  271, 20, 319, 210, 130, 253); 

 
//red rectangle 
noStroke();
smooth();
fill(230, 30, 30);
quad(190, 144,  202, 191,  -10, 240,  -10, 192);
 
//blue arc 
strokeCap(SQUARE);
strokeWeight(38);
stroke(104, 156, 198);
noFill();
arc(216, -110, 400, 458, radians(33), radians(60));
 
//grey arc 
strokeWeight(37);
stroke(205, 199, 178);
noFill();
arc(208, -95, 380, 410, radians(10), radians(52));
 
 
//red arc 
smooth();
strokeCap(SQUARE);
strokeWeight(35);
stroke(230, 15, 15);
noFill();
arc(138, -143, 500, 550, radians(35), radians(79));
 
//yellow sauare line/rectangle 
noStroke();
smooth();
fill(227, 205, 138);
quad(404, 41, 425, 34, 582, 161, 558, 168);
 
//yellow sauare line/rectangle (lt brown side) 
noStroke();
smooth();
fill(151, 118, 64);
quad(424, 33, 426, 30, 584, 157, 582, 161);
 
//yellow sauare line/rectangle (drk brown side) 
noStroke();
smooth();
fill(48, 44, 36);
quad(404, 37, 426, 30, 425, 33, 404, 40);

//red rectangle/line-right (white top) 
strokeWeight(1);
stroke(141, 127, 86);
smooth();
fill(223, 211, 190);
quad(382, 107, 378, 104, 553, 75, 556, 78);
 
//red rectangle/line-right 
noStroke();
smooth();
fill(214, 56, 42);
quad(382, 112, 382, 106, 557, 78, 558,84);
 
//red rectangle/line-right (black side) 
noStroke();
smooth();
fill(42, 40, 33);
quad(377, 104, 382, 106, 382, 112, 377, 109);
 
 
//black line 
noStroke();
smooth();
fill(50, 40, 40);
quad(227, 169, 229, 175, 632, 82, 630, 76);
 
//red triangle 
noStroke();
smooth();
fill(200, 60, 50);
triangle(366, 249, 410, 320, 576, 217);
 
//black circle 
noStroke();
smooth();
fill(25, 25, 28);
ellipse(140, 250, 130, 130);
 
//red rectangle-left corner 
noStroke();
smooth();
fill(212, 33, 32);
quad(107, 217, 117, 221, 60, 360, 50, 360 );
 
//red rectangle-left corner (side)
noStroke();
smooth();
fill(229, 220, 208);
quad(116, 221, 134, 214, 77, 360, 60, 360);
 
//red rectangle-left corner (top)
noStroke();
smooth();
fill(229, 220, 208);
quad(108, 217, 126, 210, 134, 214, 116, 221);

//grey rectangle 
noStroke();
smooth();
fill(168, 170, 164);
quad(52, 280, 172, 252, 175, 266, 55, 295);
  
//yellow L (horizontal)
noStroke();
smooth();
fill(226, 187, 122);
quad(68, 261, 143, 243, 145, 259, 71, 276);

//yellow L (verticle)
noStroke();
smooth();
fill(226, 187, 122);
quad(143, 243, 150, 276, 133, 280, 125, 252);
 
//red rectangle/line-left 
fill(212, 33, 32);
quad(144, 211, 142, 209, 430, 142, 430, 145);
 
//red rectangle/line-left (white top) 
strokeWeight(.5);
stroke(141, 127, 86);
fill(252, 231, 221, 208);
quad(142, 209, 141, 202, 427, 137, 429, 141);
 
//short red line/rectangle 
fill(212, 33, 32);
quad(333, 204, 332, 202, 393, 186, 394, 188);
 
//short red line/rectangle (white top)
fill(229, 220, 208);
quad(393, 186, 332, 202, 329, 200, 389, 184);
 
//short red line/rectangle (White side)
fill(229, 220, 208);
quad(332, 202, 330, 200, 328, 200, 332, 204);
}

