
float xoff = 0.0;

void setup() {
  size(500, 500, P3D);
  background(255);
}

void draw() {
 xoff = xoff + .02;
 float n = noise(xoff) * width/2;
 noStroke();
 lights();
 fill(n*1.5);
 translate(mouseX, mouseY);
 sphere(n);
}
