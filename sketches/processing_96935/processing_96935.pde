
void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  pushMatrix();

  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, 0.2*PI));

fill(255,200,200);
  beginShape();
  vertex(0, 0,0);//top
  vertex(50, 100, 50);
  vertex(-50, 100, 50);
  endShape();
  
fill(200,255,200);
  beginShape();
  vertex(0, 0, 0);
  vertex(50, 100, 50);
  vertex(50, 100, -50);
  endShape();

fill(200,200,255);
  beginShape();
  vertex(0, 0,0);
  vertex(-50, 100, 50);
  vertex(-50, 100, -50);
  endShape();

  popMatrix();
}



