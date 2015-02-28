
int startX;
int startY= 0;
int endX = 500;
int endY = 0;
//int spacing = 50;

void setup() {
  size(500, 500);
  background(0, 0, 0);
  //strokeWeight(1);
  //smooth();
}

void draw() {
  for (int startX = 0; startX<=450; startX = startX + 50) {
      stroke(#05FAE7);
      line (startX + 50, 0, endX, endY = endY+50);
    }
  }



