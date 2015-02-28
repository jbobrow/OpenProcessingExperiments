
// drawing using shapes and vertices

void setup() {
  size(350, 350);
}

void draw() {
  background(64);
  stroke(255);
  fill(128);
  
  beginShape();
  vertex(50,  50);
  vertex(150, 50);
  vertex(150, 150);
  vertex(50,  150);
  endShape();  // try endShape(CLOSE);
 
  beginShape();
  vertex(200, 50);
  vertex(250, 50);
  vertex(250, 100);
  vertex(300, 100);
  vertex(300, 150);
  vertex(200, 150);
  endShape(CLOSE);
 
  beginShape(TRIANGLES); // try beginShape(TRIANGLE_STRIP)
  vertex(50, 200);
  vertex(50, 300);
  vertex(100, 200);
  vertex(100, 300);
  vertex(150, 200);
  vertex(150, 300);
  endShape(CLOSE); 
}
