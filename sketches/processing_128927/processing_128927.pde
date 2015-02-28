
//basic from:schien@mail.ncku.edu.tw
//practice in class
//re-code:juichi lin

float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  background(255);
  xstart = random(50);
  xnoise = xstart;
  ynoise = random(50);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  int alph = int(255 * noiseFactor);
  stroke(0, alph);
  //line(x, y, x+1, y+1);
  
  float len=15 * noiseFactor;
  quad(x,y,len,x+1,len,y+1,x+1,y+1);
}



