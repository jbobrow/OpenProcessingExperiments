
//Adding Dimensions
//A noise grid
//Test 016 [Date:20131106] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//A noise grid
//Moving bugs

float xstart, xnoise, ynoise;

void setup() {

  size(600, 300);
  //background(255);
  background(137, 193, 135, 50);
  frameRate(4);
}

void draw() {
  background(137, 193, 135, 50);
  float xstart = random(5);
  float xnoise = xstart;
  float ynoise = random(15);
  for (int y = 0; y <= height; y += 6) {
    ynoise += 0.8;
    xnoise = xstart;
    for (int x = 0; x <= width; x += 5) {
      xnoise += 0.1;

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {

  int alph = int(noiseFactor*200);

  pushMatrix();
  translate(x, y);
  rotate(noiseFactor*radians(720)); 
  //rotate(noiseFactor*radians(30));

  float edgeSize = noiseFactor*32; 
  float R = 211 + (noiseFactor*125);
  float G = 240 + (noiseFactor*115);
  float B = 198 + (noiseFactor*215);
  fill(R, G, B, alph);
  stroke(R, G, B);
  strokeWeight(1);
  ellipse(x, y, edgeSize/2, edgeSize/6);
  popMatrix();
}



