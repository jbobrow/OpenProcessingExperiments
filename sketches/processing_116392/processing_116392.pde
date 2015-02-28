
float radius =40;
float rect_X = 400;
float rect_Y = 400;
void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  noStroke();


  for ( int yPos = 0; yPos <= height; yPos += height/20) {
    for (int xPos = 0; xPos <= width; xPos = xPos + 40 ) {
      if (dist(mouseX, mouseY, rect_X, rect_Y) < radius) {
        fill(random(255), random(255), random(255), random(255));
      }
      else {
        //noFill();
        fill(0);
        //arc(200, 100, 40, 40, 0,PI+2);
      }
      rect(xPos, yPos, 20, 20);
    }
  }
}
