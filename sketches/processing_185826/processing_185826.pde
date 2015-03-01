
 void setup() {
  size(600, 600);
}
 void draw() {
   background(255);
   stroke(255,0,0);
 pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);
  fill(255,255,0);
  stroke(0);
  star(0, 0, 80, 1000, 40);
  popMatrix();
 
 stroke(0);
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / 50.0);
  fill(0,0,0);
  star(50, 50, 30,0, 600);
  popMatrix();


stroke(255,0,0);
  pushMatrix();
  translate(width*0.18, height*0.6);
  rotate(frameCount / 50.0);
  fill(0,0,0);
  star(50, 50, 40,0, 600);
  popMatrix();


stroke(0,220,100);
  pushMatrix();
  translate(width*0.18, height*0.2);
  rotate(frameCount / 50.0);
  fill(0,0,0);
  star(50, 50, 10,0, 400);
  popMatrix();

  
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);
  fill(0,0,255);
  stroke(0);
  star(0, 0, 80, 10, 40);
  popMatrix();
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
