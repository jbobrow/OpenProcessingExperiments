
int maxNum = 75;
int count = 0;
int grow = 1;
float followX = 100;
float followY = 100;
float lngth = 100;
Rings ring[] = new Rings[maxNum];
float r = 0.1;



void setup() {
  size(500, 500);
  background(0, 30, 75, 25);
  smooth();
}

void draw() {
  fill(150, 180, 210);
  rect(0, 0, width, height);
  independantAction();
  breathe();
  display();
}

void independantAction() {
  translate(followX, followY);
  followX = followX + (((mouseX)-followX)/15);
  followY = followY + (((mouseY)-followY)/15);


  rotate(r);
  r = r + 0.025;

  ring[count] = new Rings(followX, followY);
  count = count + 1;
  if (count >= maxNum) {
    count = 0;
  }
  else if (count >= maxNum) {
    count = 0;
  }
  translate(-followX, -followY);
}


void display() {
  for (int i = 0; i < maxNum; i++) {
    if (ring[i] != null) {
      ring[i].drawRing(lngth);
    }
  }
}


void breathe() {
  if (lngth > 115) {
    grow = 2;
  }
  else if (lngth < 100) {
    grow = 1;
  }

  if (grow == 1) {
    lngth = lngth + 0.5;
  }
  else if (grow == 2) {
    lngth = lngth - 0.5;
  }
}


void mouseClicked() {
  save(frameCount+".jpg");
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
    fill(0, 30, 75, 10);
    ellipse(x, y, wdth, wdth);
    fill(215, 220, 235, 45);
    ellipse(x+diffX, y+diffY, wdth/2, wdth/2);
  }
}


