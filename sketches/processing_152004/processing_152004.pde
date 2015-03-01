
void setup() {
  size(400,400);
  frameRate(10);
}

void draw() {
  float a;
  strokeWeight(random(16));
  a = random(401);
  fill(random(256),random(256),random(256));
  ellipse(200,200,a,a);
}


