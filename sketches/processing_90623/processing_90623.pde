
float easing= 0.01;
float f= 0.0;
float x= 200;
float y = 200;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
}

void draw() {
  background(20);
  
  fill(200, 0, 120, 190);
  float d = dist(width/2, height/2, mouseX, mouseY);
  ellipse(width/2, height/2, d*2, d*2);
  
  float targetX= mouseX;
  f+= (targetX - f) * easing;
  fill(0, 100, 255,200);
  rect(f, 190, 120, 20);
  
  fill(204, 200, 50, 220);
  float angle = atan2(mouseY-y, mouseX-x);
  pushMatrix();
  translate(x, y);
  rotate(angle);
  triangle(-60, -24, 60, 0, -60, 24);
 // triangle(100, -80, 100, 0, -80, 80);
  popMatrix();
}
