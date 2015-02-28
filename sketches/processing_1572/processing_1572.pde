
float a = 0;
float b = 0;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  frameRate(20);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(a * b));
  stroke(214, 149, 9);
  fill(217, 250, 246);
  ellipse(a, b, a/b, a/b);
  fill(mouseX, mouseY, mouseX, mouseY);
  ellipse(b, a, b, a);
  fill(104, 202, 206);
  ellipse(b, a, a/b, a/b);
  fill(140);
  ellipse(a, b, b, a);
  a += 1;
  b -= 0.05;
  if (a > width/2) {
    a = random(width);
    a = -a;
    b = a / b;
  }
 if (b > height/2) {
   a = 0;
   b = a / b;
 }
}


