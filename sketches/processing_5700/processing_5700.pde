
void setup() {
  size (400,400);
  smooth();
  noStroke();
}

void draw() {
  float xmousething = abs((mouseX-(width/2))*2);
  float ymousething = abs((mouseY-(height/2))*2);
  background (255);
  fill (xmousething/2, ymousething/2, abs(xmousething-ymousething)*0.75);
  ellipseMode(CENTER);
  ellipse (width/2, height/2, xmousething, ymousething);
}

