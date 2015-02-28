
// Drawing a 3D structure using vertices  
  
void setup() {
  size(300, 300, P3D);
  //noFill();
  fill(100); 
}

void draw() {
  background(64);
  // center the origin
  translate(width/2, height/2);
  float a = map(mouseY, 0, height, 0, PI/2);
  // rotate so we can actually see how it looks in 3D
  rotateX(a);
  rotateZ(-frameCount/100.0);
  //axis();
  strokeWeight(2);
  stroke(255);
  pyramid(60);
}

void axis() {
 // draw the 3 axis so we can see them
  stroke(255, 0, 0);
  line(-100, 0, 0, 100, 0, 0); // x in red
  stroke(0, 255, 0);
  line(0, -100, 0, 0, 100, 0); // y in green
  stroke(0, 0, 255);
  line(0, 0, -100, 0, 0, 100); // z in blue
}

// Draw a simple pyramid (no square surface at the bottom, just 
// the triangle sides
// Draws the pyramid around the origin (0, 0)
// "s" will be the size..  
void pyramid(int s) {
  // each 3 consecutive vertex will form a triangle
  beginShape(TRIANGLES); 

  // "top" face 
  vertex(-s, -s, -s);
  vertex( s, -s, -s);
  vertex( 0,  0,  s);  // notice all sides share this point (the tip)

  // "bottom" face 
  vertex(-s,  s, -s);
  vertex( s,  s, -s);
  vertex( 0,  0,  s);  
  
  // "left" face
  vertex(-s, -s, -s);
  vertex(-s,  s, -s);
  vertex( 0,  0,  s);

  // "right" face
  vertex( s, -s, -s);
  vertex( s,  s, -s);
  vertex( 0,  0,  s);
  
  endShape();  
}

