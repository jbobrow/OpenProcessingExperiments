
void setup() {
  size(480,120);
  smooth();
}


void draw() {
  //background(250);
    if(mousePressed)
    ellipse(mouseX,mouseY, 30, 30);
    fill(random(0,255),random(0,255),random(0,255),120);
}
