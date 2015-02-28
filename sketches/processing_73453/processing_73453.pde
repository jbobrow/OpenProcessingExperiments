
// Justin Couch 
// for D+M 7021 
// Intro to Computational Design 
// Exercise 1 
void setup () {
size(640, 360); 
background(35, 40, 50); 
smooth(); 
noFill(); 
stroke(255);
}
void draw(){

// PENROSE TRIANGLE // 
stroke(0); 
strokeWeight(0.5); 
 
// Right Side 
fill(230); 
beginShape(); 
vertex(331.6, 93.4); 
vertex(420, 246.6); 
vertex(246.2, 246.6); 
vertex(277.7, 226.6); 
vertex(385.4, 226.6); 
vertex(308.5, 93.4); 
endShape(CLOSE); 
 
// Left Side 
fill(180); 
beginShape(); 
vertex(308.5, 93.4); 
vertex(385.4, 226.6); 
vertex(362.3, 226.6); 
vertex(308.5, 133.4); 
vertex(231.6, 266.6); 
vertex(220, 246.6); 
endShape(CLOSE); 
 
// Bottom 
fill(128); 
beginShape(); 
vertex(308.5, 133.4); 
vertex(320, 153.4); 
vertex(266.2, 246.6); 
vertex(420, 246.6); 
vertex(408.5, 266.6); 
vertex(231.6, 266.6); 
endShape(CLOSE);
}
