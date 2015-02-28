

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  background(255);
}

void draw() {
  frameRate(5);
  circle(int(random(255)), int(random(200)));
}
  
  
void circle(int alpha, int x) {
  fill(115,alpha,alpha,alpha);
  ellipse(x,x,x,x);
}

