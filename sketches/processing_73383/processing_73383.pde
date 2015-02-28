
void setup() {
  size(600, 600);
  noLoop();
}

void draw() {
  drawShape(7, 100, width/2, height/2);  
}

void drawShape(int n, int r, float x, float y) {
  float deltaA = 360/n;
  float angle = 0;
  float xpos = 0;
  float ypos = 0;
  
  translate(x, y);
  beginShape();
    for (int i = 0; i < n; i++) {
      xpos = r*cos(radians(angle));
      ypos = r*sin(radians(angle));
      angle+=deltaA;
      vertex(xpos, ypos);
    }
  endShape(CLOSE);
}


