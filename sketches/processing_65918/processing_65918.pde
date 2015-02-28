
//variation on Pearson's i.1 code

int k = 0;

void setup() {
  size(600, 600);
  background(255);
//  smooth();
  noStroke();
}
void draw() {
  k = k + 1;
  if (k >1000) {
    k = 0;
  }
  fill(k, 10);
  rect(0, 0, width, height);

  fill(random(255), random(255), random(255), random(100)); 
  float xstart = random(10);
  float ynoise = random(10);
  translate(width/2, height/2, 0);
  for (float y = -(height/8); y <= (height/8); y+=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -(width/8); x <= (width/8); x+=3) {
      xnoise += 0.02;

      rotate(1);
      drawPoint(x, y, noise(xnoise, ynoise));
//      x = x +10;
//      y = y +10;
            
    }
  }
}


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
  float edgeSize = noiseFactor * random(26);
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}
