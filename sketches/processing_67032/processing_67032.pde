
int x;
int mouseDragged;
int mousePressed;
boolean hello;

void setup() {
  size(300, 300);
  smooth();
  x = 34;
}

void draw() {
  if (hello==true) {
    println("mouseDragged boolean");
    stroke(mouseX*5, mouseY*5, 150);
    x = x*2;
    fill(150);
    ellipse(30, 100, x, height);
  }
  strokeWeight(random(100,255));
}
void mousePressed() {
  ellipse(100,100,random(50), random(50));
}
void mouseDragged() {
  stroke(random(30), random(180), random(20), random(210));
  line(mouseX, mouseY, pmouseX, pmouseY);
}


