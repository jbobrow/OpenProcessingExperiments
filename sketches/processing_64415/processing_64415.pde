
void setup() {
  size(400, 400);
  background(255);
  smooth();
  
  frameRate(10);
}

void draw() {
  noStroke();
  fill(255,80);
  rect(0,0,width,height);

  rotate(sin(random(-1,1)));
  footmark(random(width),random(height),random(5,10));
  
}

void footmark(float x, float y,float s) {
  fill(0);
  stroke(0);
  
  translate(x, y);
  ellipse(0, 0, 5*s, 3*s);
  ellipse(0, -1*s, 3*s, 3*s);

  ellipse(-3.5*s, -2*s, 2*s, 2*s);
  ellipse(-1.5*s, -4*s, 2*s, 2*s);
  ellipse(1.5*s, -4*s, 2*s, 2*s);
  ellipse(3.5*s, -2*s, 2*s, 2*s);
}

