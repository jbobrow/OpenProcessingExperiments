
float x, y;

void setup() {
  size(1000, 300);
  smooth();
  background(0);
}

void draw() {
  background(255);
  x = height/2*(0.5*cos(-0.02*frameCount)+1);
  y = height/2*(0.5*sin(-0.02*frameCount)+1);
  noFill();
  stroke(0);
  ellipse(height/2, height/2, height/2, height/2);
  fill(0);
  ellipse(x, y, 5, 5);
  ellipse(0.8*frameCount+height, y, 1, 1);
  for (int i = 0; i<frameCount; i++) {
    ellipse(0.8*i+height, height/2*(0.5*sin(-0.02*i)+1), 1, 01);
  }
  ellipse(0.8*frameCount+height, y,5,5);
  line(0, height/2, width, height/2);
  line(height/2, height/2, x, y);
  stroke(0,0,255);
  line(x, y, 0.8*frameCount+height, y);
}


