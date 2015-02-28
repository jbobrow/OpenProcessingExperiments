
void setup() {
  size(600, 400);
  noStroke();
}

void draw() {
  background(0);
 
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 120.0);
  star(0, 0, 80, 100, 60); 
  fill(255);
  popMatrix();
  
  PImage photo = loadImage("vertigo_eye2.jpg");
  imageMode(CENTER);
image(photo,300,200,300,200);
tint(255,random(80,180));

}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/0.6;
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




