
int numLines = 2500;
MovingLine[] lines = new MovingLine[numLines];
int currentLine = 0;
void setup() {
  size(500, 500);
  frameRate(30);
  for (int i = 0; i < numLines; i++) {
    lines[i] = new MovingLine();
  }
}
void draw() {
  background(0, 0, 50);
  for (int i = 0; i < currentLine; i++) {
    lines[i].display();
  }
  
}
void mouseDragged() {
  lines[currentLine].setPosition(mouseX, mouseY, 
  pmouseX, pmouseY);
  if (currentLine < numLines - 1) {
    currentLine++;
  }
}

class MovingLine {
  float x1, y1, x2, y2, rot;
  void setPosition(int x, int y, int px, int py) {
    x1 = x;
    y1 = y;
    x2 = px;
    y2 = py;
  }
  void display() {
    fill(200, 200, 150, 150);
    noStroke();
    x1 += random(-1, 1);
    y1 += random(-1, 1);
    x2 += random(-0.5, 0.5);
    y2 += random(-0.5, 0.5);
    rot += random(1) - 0.5;
    pushMatrix();
    translate(x1, y1);
    rotate(rot);
    ellipse(0,0, x2%5, y2%4);
    popMatrix();
  }
}

