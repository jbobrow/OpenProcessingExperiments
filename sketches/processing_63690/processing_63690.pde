
int ringNum = 20;
int backNum = 12;
int grow = 1;
float firstX = 200;
float firstY = 200;
float followX = 100;
float followY = 100;
float lngth = 50;
float minLngth = lngth;
float maxLngth = lngth + 15;
Rings ring[] = new Rings[ringNum];
int cols[][] = new int[backNum][backNum];

void setup() {
  size(500, 500);
  background(10);
  smooth();

  for (int i = 0; i < ring.length; i++) {
    ring[i] = new Rings(followX, followY);
  }

  for (int i = 0; i < cols.length; i++) {
    for (int j = 0; j < cols[0].length; j++) {
      cols[i][j] = 0;
    }
  }
}

void draw() {
  checkTouching();
  backgroundDisplay();
  movement();
  breathe();
  display();
}

void backgroundDisplay() {
  int squareSize = (int) width/backNum+1;

  for (int i = 0; i < cols.length; i++) {
    for (int j = 0; j < cols[0].length; j++) {
      int x = i*squareSize;
      int y = j*squareSize;
      fill(cols[i][j], 10);
      noStroke();
      rect(x, y, squareSize+1, squareSize+1);
    }
  }
}

void checkTouching()
{
  for (int n = 0; n < ringNum; n++) {
    if (ring[n] != null) {
      for (int i = 0; i < cols.length; i++) {
        for (int j = 0; j < cols[0].length; j++) {
          int squareSize = (int) width/backNum;
          float xp = i*squareSize;
          float yp = j*squareSize;

          if (dist(ring[n].x, ring[n].y, xp, yp)< lngth/2) {
            cols[i][j] = 255;
          } 
          else {
            cols[i][j] = 0;
          }
        }
      }
    }
  }
}

void movement() {

  if (mousePressed) {
    for (int i = 0; i < ring.length; i++) {
      if (i == 0) {
        firstX = firstX + (((mouseX)-firstX)/15);
        firstY = firstY + (((mouseY)-firstY)/15);
        ring[i].follow(followX, followY);
      }
      else {
        followX = followX + (((firstX)-followX)/(i*2));
        followY = followY + (((firstY)-followY)/(i*2));
        ring[i].follow(followX, followY);
      }
    }
  }
}


void display() {

  for (int i = 0; i < ring.length; i++) {
    if (ring[i] != null) {
      ring[i].drawRing(lngth);
    }
  }
}


void breathe() {
  if (lngth > maxLngth) {
    grow = 2;
  }
  else if (lngth < minLngth) {
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


  /**void drawRing(float wdth) {
   noStroke();
   fill(0, 30, 75, 10);
   ellipse(x, y, wdth, wdth);
   fill(215, 220, 235, 45);
   ellipse(x+diffX, y+diffY, wdth/2, wdth/2);
   }*/

  void drawRing(float wdth) {
    noStroke();
    int num = (int)(wdth/2.0);
    for (int i = 0; i < num; i++) {
      fill(40, 60, 155, i);
      ellipse(x, y, wdth-i, wdth-i);
    }
  }

  void follow(float xp, float yp)
  {
    x = x + (((xp)-x)/2);
    y = y + (((yp)-y)/2);
  }
}


