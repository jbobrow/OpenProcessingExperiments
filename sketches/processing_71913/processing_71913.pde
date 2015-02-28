
float a=0.0;
float randomDiameter = 0;
float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(1200, 600);
}

void draw() {
  smooth();
  background(mouseX/4.3, 100, mouseY/2.7);
  translate(mouseX, mouseY); //shape follows mouse
  rotate(a); //shape rotates
  stroke(-mouseX/4.3, mouseX-mouseY, -mouseY, 50);
  strokeWeight(3);
  line(0, 0, 1700, 1700);
  line(0, 0, 0, 1700);
  //line(0, 0, 1700, 0);
  line(0, 0, -1700, 1700);
  line(0, 0, -1700, -1700);
  line(0, 0, -1700, 0);
  if (r<2) {
    r++;
  }
  else {
    r = r-1;
  }
  fill(mouseY/2.3, mouseX-mouseY, mouseY/4.7);
  rect(-20*r, -20*r, 40*r, 40*r);
 
  a += 0.01;
}
