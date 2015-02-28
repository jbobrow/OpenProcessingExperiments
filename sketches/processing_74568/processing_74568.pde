
float a;
float b;
float mx=4;

void setup() {
  background(137, 185, 137);
  size(400, 400);
  a = 200;
  b =200;
  
  for (int y = 0; y <= height; y = y+40) {
    for (int x = 0; x <= width; x = x+40) {
      smooth();
      stroke(2);
      fill(240, 230, 39);
      ellipse(x, y, 10, 10);
    }
  }
}

void draw() {


  
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) {
    a = a+random(-mx, mx);
    b = b + random (-mx, mx);
    stroke(2);
    fill(240, 230, 39);
    ellipse(a, b, 10, 10);
  }
}
