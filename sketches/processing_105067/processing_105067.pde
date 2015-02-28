
void setup() {
}

float x;
float y;

void draw() {
  background(255);
  x=x+ (mouseX-x)/20;   //follow
  y=y+ (mouseY-y)/20;
  ellipse(x, y, 10, 10);
}



