
float theta = 0.0;

void setup() {
  size(750,750,P3D);
}

void draw() {
  background(0);
  theta += 02;
  
  translate(100,100,0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(50);
  

  translate(50,50,20);
 
  drawPyramid(40);
}

void drawPyramid(int t) {
  stroke(0);
  
 
  beginShape(TRIANGLES);
  
 
  
  fill(0,150,80,127);
  vertex( t,-t,t);
  vertex( t, t,-t);
  vertex( 0, 0, t);
  
  fill(0,0,150,127);
  vertex( t, t,-t);
  vertex(t, t,-t);
  vertex( 0, 0, t);
  
 
  
  endShape();
}


