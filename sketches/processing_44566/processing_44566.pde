
int beginColor = int (random(361));


void setup() {
  size (900, 300);
  smooth();
  frameRate(15);
 // noiseSeed(0);
  colorMode(HSB, 360, 100, 100);    // HueSatBright, 360 degrees, 100%, 100%
  noLoop();
}

void draw() { 
  int beginColor = int (random(361));
  for (int xCounter = 0; xCounter < width; xCounter++)
  {
    int brightVal = 1;
    for (int yCounter = -20; yCounter < height; yCounter+=20)
    {
      if (brightVal >= 40)
      {
        brightVal = 0;
      }
      stroke(beginColor, int (noise(101) * 101), (brightVal * 2.78)/2);
      brightVal = int(random(101));
      line(float(xCounter), float(yCounter), float(xCounter), float(yCounter)+20);
    }
  }
}

void mouseReleased(){
  redraw();
}


