
int maxNum = 100;
float followX = mouseX;
float followY = mouseY;
Rings ring[] = new Rings[maxNum];
int count = 0;
float lngth = 100;
int grow = 1;

void setup() {
  size(500, 500);
  background(215, 225, 255);
  smooth();
}

void draw() {
  background(215, 225, 255);
  followX = mouseX;
  followY = mouseY;

  if (lngth > 115) {
    grow = 2;
  }
  else if (lngth < 100) {
    grow = 1;
  }

  if (grow == 1) {
    lngth = lngth + 1;
  }
  else if (grow == 2) {
    lngth = lngth - 1;
  }

  for (int i = 0; i < maxNum; i++) {
    if (ring[i] != null) {
      ring[i].drawRing(lngth);
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
  float diffX = 1;
  float diffY = 1;

  Rings(float i_x, float i_y) {
    x = i_x;
    y = i_y;
  }

  void drawRing(float wdth) {
    noStroke();
    fill(0, 30, 75, 25);
    ellipse(x, y, wdth, wdth);
    fill(215, 220, 235, 45);
    ellipse(x+diffX, y+diffY, wdth/2, wdth/2);
  }
}

void mouseClicked() {
  save(frameCount+".jpg");
}


