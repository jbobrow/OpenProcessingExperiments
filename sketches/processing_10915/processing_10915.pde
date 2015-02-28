
void setup() {
  
  size(500, 500);
  smooth();
  frameRate(15);
}

void draw() {
  
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  circle();
  
}

void circle()  {
  
  float x = random(0, 500);
  float y = random(100, 400);
  float dia = random(5, 70);
  float in = random(255);
  float ease = random(-2, 2);
  float easey = random(-10, 10);
  fill(in, in, 34, 255);
  ellipse(mouseX + ease, mouseY + ease, dia, dia);
  
}

