
class Caterpillar {

  int x;
  float y;
  int shadowX;
  int shadowY;
  int h;
  int diam;
  int jumpDirection;
  int jumpCount;
  float jumpChange;
  boolean rest;

  Caterpillar(int tempX, int tempH) {

    x = tempX;
    shadowX = tempX;

    y=250;
    shadowY = 255;

    h = tempH;
    diam = 20;

    jumpCount = 24-h*2;

    jumpDirection = -1;
    jumpChange = .7;
  }

  void displayCaterpillar() {

    noStroke();
    ellipseMode(CENTER);
    fill (0, 100);
    ellipse(shadowX, shadowY, 20, 10);
    
    if (h == 1)
    {
      stroke(0);
      line(x, y, x+10, y-20);
      line(x, y, x-10, y-20);
      noStroke();
      ellipseMode(CENTER);
      fill(245, 7, 35);
      ellipse(x, y, diam, diam);
      fill(0);
      rect(x-2, y-2, 2, 2);
      rect(x+6, y-2, 2, 2);
      rect(x+2, y+3, 1, 1);
    }
    else
    {
      noStroke();
      ellipseMode(CENTER);
      fill(245, 7, 35);
      ellipse(x, y, diam, diam);
    }
  }

  void jump() {

    if (rest == false)
      y -= jumpChange*jumpDirection;


    if (y<=240)
      jumpDirection*=-1;

    if (y >= 251)
      jumpDirection*=-1;

    if (y == 250)
      rest=true;

    if (rest)
      jumpCount++;

    if (jumpCount >= 24)
    {
      rest = false;
      jumpCount = 0;
    }
  }
}


