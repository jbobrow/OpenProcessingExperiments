
int r=255;
int g=255;
int b=255;
void setup() {
  size(1000, 800);
}
void draw() {
  monster();
}
void monster() {
  background(100);
  rectMode(CENTER);
  fill(0);
  rect(mouseX, mouseY, 500, 300);
  fill(r, g, b);
  ellipse(mouseX+90, mouseY-50, 50, 50);
  ellipse(mouseX-90, mouseY-50, 50, 50);
  rect(mouseX,mouseY+50,100,30);
  if (mousePressed) {
    r=200;
    g=0;
    b=0;
}
else {
  r=255;
  g=255;
  b=255;
}
}

