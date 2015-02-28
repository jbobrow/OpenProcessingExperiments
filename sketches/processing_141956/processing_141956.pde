
void setup() {
  size(500, 500);
  background(255);
}

float hei;
float wid;

void draw() { 
  noStroke();
  hei = random(125, 450);
  wid = random(125, 450);
  ellipse(mouseX, mouseY, hei, wid);
  fill(wid/2, 0, 0);
  if(mousePressed) {
    fill(0, wid/2, 0);
  }
  if(keyPressed) {
    fill(0, 0, wid/2);
  }
}

