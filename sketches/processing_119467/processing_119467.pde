
//Adding Dimensions
//A noise grid
//Test 015 [Date:20131106] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//A noise grid

float xstart, xnoise, ynoise;

void setup() {

  size(600, 300);
  background(255);
  //background(137, 193, 135);
  float xstart = random(10);
  float xnoise = xstart;
  float ynoise = random(10);
  for (int y = 0; y <= height; y += 6) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x += 5) {
      xnoise += 0.1;

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  
  float XX = 25*noiseFactor;
  float YY = 50*noiseFactor;
  int alph = int(noiseFactor*200);
  fill(211, 240, 198, alph);
  ellipse(x, y, XX, YY);
  
  //float len = 10*noiseFactor;
  //rect(x, y, len, len);

  //int alph = int(noiseFactor * 255);
  //stroke(0, alph);
  //line(x, y, x+1, y+1);
}



