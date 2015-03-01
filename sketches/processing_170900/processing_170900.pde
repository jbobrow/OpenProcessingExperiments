
void setup() {
  size(500, 500); 
  background(0);
}

void draw() {
  
}

void drawStar(float x, float y, float size) {
  fill(255,255,0);
  stroke(255, 255, 0);
  float orientation=random(TWO_PI);
  beginShape();
  for (int a=0; a<5; a++) {
    vertex(x+cos(orientation)*size, y+sin(orientation)*size);
    orientation+=TWO_PI/5*2;
  }
  endShape(CLOSE);
}

void mouseReleased(){
  drawStar(mouseX, mouseY, 20);
}
