
void setup() {
  background(0);
  size(800,600);
  smooth();
  noStroke();
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  fill(255,0,0);
  ellipse(mouseX,mouseY,50,50);
}


