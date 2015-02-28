
void setup() {
  size(600, 200);
  background(255);
  textFont(createFont("Impact", 30));
  noStroke();
}

void draw() {
  fill(255, 0, 0);
  drawPattern();
  
  filter(BLUR, 8);
  
  fill(255);
  drawPattern();
  
  noLoop();
}


void drawPattern() {
  String msg = "Let's spraypaint\nsome stuff!";
  text(msg, 40, 100);
  
  rectMode(CORNERS);
  rect(10, 30, 30, 180);
  rect(10, 160, 200, 180);
  
  ellipseMode(CORNER);
  ellipse(300, 20, 100, 100);
  
  triangle(550, 20, 300, 180, 500, 170);
}


