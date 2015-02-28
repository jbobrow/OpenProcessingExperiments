
void setup() {
  size(1000,1000);
  background(200,10,10);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0,100,0);
  } else {
    fill(255);
  }
  fill(0,100,200);
  triangle(80,80,mouseX,mouseY,300,80);
}

