
void setup() {
 size(400,400);
}

void draw() {
  drawFigure(width/2, height/2);
}


void drawFigure(int x, int y){
  frameRate(20);
  background(random(255),random(255),random(255),100);
  noFill();
  ellipse(200, 50, 70, 70);
  line(200, 85, mouseX, mouseY);
  line(mouseX, mouseY, 120, 100);
  line(mouseX, mouseY, 280, 100);
  line(mouseX, mouseY, 120, 370);
  line(mouseX, mouseY, 280, 370);
}

