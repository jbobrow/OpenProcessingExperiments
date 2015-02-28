
/*
Daniel Albuquerque
BOOTCAMP
Best Team Ever, AKA PURPLE
8/3/2011 Painting Replication
*/

size( 354, 205);
background( 110, 151, 195);
smooth();
noStroke();

fill( 52, 96, 43);
beginShape(); //green
vertex( 91, 204);
vertex( 113, 49);
bezierVertex( 120, 40, 155, 17, 192, 0);
vertex( 204, 0);
bezierVertex( 177, 29, 177, 39, 185, 63);
vertex(182, 204);
endShape();

fill(0);
beginShape(); //black top left
vertex( 0, 60);
bezierVertex( 16, 60, 36, 42, 34, 25);
bezierVertex( 26, 17, 9, 11, 0, 21);
endShape();

beginShape(); // black bottom left
vertex( 0, 192);
bezierVertex( 0, 192, 14, 204, 30, 203);
bezierVertex( 19, 202, 0, 182, 0, 182);
endShape();

beginShape(); // midLeft black
vertex( 76, 204);
bezierVertex( 50, 154, 58, 104, 113, 49);
bezierVertex( 153, 44, 104, 204, 104, 204);
endShape();

beginShape(); //midRight black
vertex(149, 205);
vertex(148, 137);
bezierVertex( 140, 60, 248, 18, 308, 41);
bezierVertex( 280, 34, 193, 98, 201, 135);
vertex( 199, 204);
endShape();

beginShape(); //black point on red, right
vertex( 314, 126);
bezierVertex( 314, 126, 339, 126, 344, 128);
bezierVertex( 340, 127, 326, 134, 322, 138);
bezierVertex( 322, 132, 313, 133, 314, 126);
endShape();

triangle( 322, 204, 323, 196, 325, 204); //tiny thing on bottom right

fill( 182, 21, 20);
beginShape(); // red top left
vertex(0, 21);
bezierVertex( 9, 11, 26, 17, 34, 25);
bezierVertex( 33, 10, 44, 1, 54, 0);
vertex( 0, 0);
endShape();

beginShape(); // red right
vertex( 216, 204);
bezierVertex( 235, 161, 275, 130, 314, 126);
bezierVertex( 313, 133, 322, 132, 322, 138);
bezierVertex( 303, 144, 287, 167, 282, 204);
endShape();

ellipse( 166, 41, 9, 7); // dot in green

stroke(0); // outlined triangle, bottom right
strokeWeight(2);
triangle( 57, 204, 61, 192, 63, 204);


