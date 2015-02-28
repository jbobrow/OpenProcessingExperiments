
//the field in windy spring : wind will change its color with different floating and coloful pollen 
//Chang Kuo Ping department of ID
float xstart, xnoise, ynoise;
void setup() {
  size(800, 500, P3D);
  background(255);
  frameRate(5);
}

void draw() {
  background(244, 255, 190);
  rotateX(radians(45));
  xstart = random(20);
  xnoise = xstart;
  ynoise = random(20);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.3;
    xnoise = xstart;

    for (int x = 0; x <= width; x+=2) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
      drawPoint2(x, y, noise(xnoise, ynoise));
    }
  }
}
//draw red wind
void drawPoint(float x, float y, float noiseFactor) {
  float edgeSize=noiseFactor*100;
  int alph = int(80 * noiseFactor);
  strokeWeight(random(1, 2)*edgeSize);
  stroke(mouseX+random(200,220),(mouseX/3)+(mouseY/3),mouseY-random(120),alph);
  //stroke(random(200, 220), random(50, 100), random(120), alph);
  line(x, y, x, y+1);
}
// draw mild grass
void drawPoint2(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(180));
  float edgeSize = noiseFactor * 20;
  //float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  noStroke();
  fill(random(150,200),random(150,250),7,alph);
  //fill(random(150,200),random(150,220),7, alph);
  ellipse(0, 0, edgeSize, edgeSize/2.5);
  popMatrix();
}



