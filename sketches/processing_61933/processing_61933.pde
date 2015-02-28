
int maxNum = 50;
float followX = mouseX;
float followY = mouseY;
Rings ring[] = new Rings[maxNum];
int count = 0;

void setup() {
  size(500, 500);
  background(215, 225, 255);
  smooth();
}

void draw() {
  background(215, 225, 255);
  followX = mouseX;
  followY = mouseY;
  
  for (int i = 0; i < maxNum; i++) {
    if (ring[i] != null) {
      ring[i].drawRing();
    }
  }

}

void mouseDragged() {
  ring[count] = new Rings(followX, followY);
  count = count + 1;

  if (count >= maxNum) {
    count = 0;
  }
}

class Rings {
  float x;
  float y; 
  float wdth = 100;
  float diffX = 1;
  float diffY = 1;

  Rings(float i_x, float i_y) {
    x = i_x;
    y = i_y;
  }

  void drawRing() {
    noStroke();
    fill(0, 30, 75, 25);
    ellipse(x, y, wdth, wdth);
    fill(200, 225, 255, 200);
    ellipse(x+diffX, y+diffY, wdth/2, wdth/2);
  }
}


