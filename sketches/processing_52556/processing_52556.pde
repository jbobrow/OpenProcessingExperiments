
int offsetX = 100;
int offsetY = 100;

void setup() {
  size(250, 250);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  
  fill(#594882);
  ellipse(125,130,200,200);

  fill(#dbe47b);
  pushMatrix();
  translate(66,3);
  hexagon(40);
  popMatrix();
  
    fill(#000000);
  pushMatrix();
  translate(63,89);
  hexagon(13);
  popMatrix();
  
   fill(#e5a548);
  pushMatrix();
  translate(100,70);
  hexagon(25);
  popMatrix();
  
   fill(#dbe47b);
  pushMatrix();
  translate(29,90);
  hexagon(29);
  popMatrix();
  
  fill(#e5a548);
  pushMatrix();
  translate(170,122);
  hexagon(38);
  popMatrix();
  
  fill(#000000);
  pushMatrix();
  translate(227,126);
  hexagon(27);
  popMatrix();
  
  fill(#dbe47b);
  pushMatrix();
  translate(210,180);
  hexagon(11);
  popMatrix();
  
  fill(#dbe47b);
  pushMatrix();
  translate(190,125);
  hexagon(8);
  popMatrix();
  
    fill(#dbe47b);
  pushMatrix();
  translate(118,150);
  hexagon(12);
  popMatrix();

}

void hexagon(int sideLength) {
  float c = sideLength;
  float a = cos(radians(30)) * c;
  float b = sin(radians(30)) * c;
  
  float[] A = {a, 0};
  float[] B = {2 * a, b};
  float[] C = {2 * a, b + c};
  float[] D = {a, 2 * c};
  float[] E = {a / c, b + c};
  float[] F = {a / c, b};
  
  beginShape();
  vertex(A[0], A[1]);
  vertex(B[0], B[1]);
  vertex(C[0], C[1]);
  vertex(D[0], D[1]);
  vertex(E[0], E[1]);
  vertex(F[0], F[1]);
  rotate(PI/4.0);
  endShape();

}




