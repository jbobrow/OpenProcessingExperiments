
// Farbball 0.01

/*
* Würfel Konturen malen fleißig den Screen voll 
*
* Sollte eigentlich auch mit rect funktionieren, 
* dann müsste jede fläche des Würfels in die richtige position 
* gedreht werden. Vertext war leichter zu basteln, ohne viel PI 
*
* Habe noch keine Möglichkeit gefunden einen fadeOut Effekt zu realisieren,
* wäre aber sicherlich schön.
*/


import processing.opengl.*;

float a; 
float theSize = 90;
		
void setup() {
  size(400, 400, P3D);
  //noStroke();
//  noCursor();
  strokeWeight(0.5);
  colorMode(RGB, 255,255,255,100);
  background(255);
  noFill();
  frameRate(12);
}
		
void draw() {
//  fill(255);
//  rect(0,0,800,600);
  noFill();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*9);
  
  theSize = map(mouseX,0,800,90, 300);
  scale(90);
 
  
  beginShape(QUADS);

  stroke((int) random(255), 0, 0, 10);
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);

  stroke((int) random(255), (int) random(255), 0, 10);
  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);

  stroke(0,0,(int) random(255), 10);
  vertex( 1,  1, -1);
  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);

  stroke((int) random(255),0,0, 10);
  vertex(-1,  1, -1);
  vertex(-1,  1,  1);
  vertex(-1, -1,  1);
  vertex(-1, -1, -1);

  stroke(0,(int) random(255),(int) random(255), 10); 
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);

  stroke(0, (int) random(255), (int) random(255), 10); 
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);

  endShape();
  a += 0.2;
}

