
void setup() {
  size(800, 600);
  background(160,32,240);
  smooth();
}

  float a;
  void draw() {
  a=abs(mouseX-pmouseX);
  noStroke();
  float a_ellipse=a=random(2,a);
  color ellipse_color = color(30+random(a), random(a), random(a));
  fill(ellipse_color);
  ellipse(mouseX+random(-20,20),mouseY+random(-20,20), a_ellipse,a_ellipse);
  if (mousePressed == true) {
    strokeWeight(0.1+a/20);
    stroke(0, 50);
    strokeWeight(0.1+a/20);
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
    stroke(0);
    strokeWeight(0.5+a/20);
}
  }



