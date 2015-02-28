

float theta = 0.0;

void setup() {
  size(500,500,P3D);
  //smooth();
 //frameRate(30);
}

void draw() {
  background(0);

pushMatrix();  
  theta += 0.01;
  
  translate(250,250,0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(10);
  
 // translate(0,250,0);
  //drawPyramid(10);
  
  translate(50,50,20);
  drawPyramid(30);
  
  translate(100,100,30);
  drawPyramid(50);
  
  translate(200,200,40);
  drawPyramid(80);
  
  translate(400,400,50);
  drawPyramid(110);
  popMatrix();
////////////////////////////////  
  pushMatrix();  
  theta += 0.01;
  
  translate(50,50,0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(10);
  
 // translate(0,250,0);
  //drawPyramid(10);
  
  translate(50,200,20);
  drawPyramid(30);
  
  translate(100,100,30);
  drawPyramid(50);
  
  translate(200,200,40);
  drawPyramid(80);
  
  translate(400,400,50);
  drawPyramid(110);
  popMatrix();
  
  ///////////////
    pushMatrix();  
  theta += 0.01;
  
  translate(300,0,0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(10);
  
  translate(50,50,20);
  drawPyramid(30);
  
  translate(100,100,30);
  drawPyramid(50);
  
  translate(200,200,40);
  drawPyramid(80);
  
  translate(400,400,50);
  drawPyramid(110);
  popMatrix();
}

void drawPyramid(int t) {
  stroke(0);
  
  // this pyramid has 4 sides, each drawn as a separate triangle
  // each side has 3 vertices, making up a triangle shape
  // the parameter " t " determines the size of the pyramid
  beginShape(TRIANGLES);
  
  fill(0,0,0,0);
  vertex(-t,-t,-t);
  vertex( t,-t,-t);
  vertex( 0, 0, t);
  
  fill(0,150,0,120);
  vertex( t,-t,-t);
  vertex( t, t,-t);
  vertex( 0, 0, t);
  
  fill(0,0,150,120);
  vertex( t, t,-t);
  vertex(-t, t,-t);
  vertex( 0, 0, t);
  
  fill(150,0,150,120);
  vertex(-t, t,-t);
  vertex(-t,-t,-t);
  vertex( 0, 0, t);
  
  endShape();
}


