
void setup() {
  size(400, 400);
  rectMode(CENTER);
  frameRate(25);
}

float c = 0;

void draw() {
  fill(60, 94);
  noStroke();
  rect(width/2, height/2, width, height);
  
  fill(255);
  stroke(170);
  translate(201, 200);
  rotate(c);
  rect(0, 0, 407, 482);
  
  c = c + 3;
}
