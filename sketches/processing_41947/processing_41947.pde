
void setup(){
  size(400, 400);
  smooth();
}

void draw(){
  background(13, 20, 74);
  fill(250);
  drawStar(0, 0, 50);
  drawStar(300, 0, 100);
  drawStar(0, 300, 100);
  drawStar(350, 350, 50);
  drawStar(mouseX-75, mouseY-75, 150);
}

void drawStar(float x, float y, float starSize){
  noStroke();
  triangle(x + starSize/2, y, x + starSize, y + starSize/4*3, x, y + starSize/4*3);
  triangle(x, y + starSize/4, x + starSize, y + starSize/4, x + starSize/2, y + starSize);
}

