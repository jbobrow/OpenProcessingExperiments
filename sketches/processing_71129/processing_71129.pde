
void setup() {
  size(700, 700);
  background(255);
  noCursor();
}

float i = 0;
float j = 0;
float k = -255;

void draw () {
  i = i + .1;
  j = j + 1;
  k = k + 1;
  float r = random(0,255);
  float g = random(0,255);
  float b = random(0,255);
  translate(mouseX, mouseY);
  rotate(i);
  if(j<255){
  fill(r, g, b);
  } else {
  fill(r, g, b); 
  }
  fill(r, g, b);
  beginShape();
  vertex(-50, -50);
  vertex(0, -100);
  vertex(50, -50);
  vertex(50, 50);
  vertex(0, 100);
  vertex(-50, 50);
  endShape(CLOSE);
}
