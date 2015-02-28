
//Adding Dimensions
//A noise grid
//Test 015 [Date:20131106] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//A noise grid
//Moving grass

float xstart, xnoise, ynoise, ystart;

void setup() {

  size(600, 300);
  background(255);
  //background(137, 193, 135);
  xstart = random(15);
  ystart = random(5);
  frameRate(60);
}
void draw() {

  background(255);
  xstart += 0.01;
  ystart += 0.01;
 
  float xnoise = xstart; 
  float ynoise = ystart;

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
  
  float XX = 30*noiseFactor;
  float YY = 90*noiseFactor;
  int alph = int(noiseFactor*200);
  stroke(alph);
  fill(211, 240, 198, alph);
  ellipse(x, y, XX, YY);
}



