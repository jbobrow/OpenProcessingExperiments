
float xstart, xnoise, ynoise;
float Red;
float Green;
float Blue;

void setup() {
  size(900, 900);
  smooth();
  Red = random(255);
  Green = random(255);
  Blue = random(255);
  background(Red, Green, Blue);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);

  for (int y = 0; y <= height; y += 5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x += 5) {
      xnoise += 0.1;

      //int alph = int(noise(xnoise, ynoise)*255);
      //stroke(Red, Green, Blue); 
      line(x, y, x+(int(random(255))), y+(int(random(255))));
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor*radians(360));
  //stroke(Red, Green, Blue);
  line(0, 0, 20, 0);
  noStroke();
  Red = random(255);
  Green = random(255);
  Blue = random(255);
  fill(Red, Green, Blue);
  //spot1 = random(0,100);
  //spot2 = random(0, 250);
  float len = int(random(0, 250)*noiseFactor);
  ellipse(x, y, len, len);
  popMatrix();
}



