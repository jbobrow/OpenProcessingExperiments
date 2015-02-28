
PImage img;
float xstart, ystart, squaresize;

void setup() {
  size(800, 600);
  img = loadImage("tdr.png");
  xstart = random(30);
  ystart = random(30);
  squaresize = height/8;
}

void draw() {
  image(img,0,0);
  fill(0,0,0,5);
  noStroke();
  rect(0, 0, width, height);
  fill(255,11,11);
  xstart += 0.06;
  ystart += 0.06;
  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.08;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=4) {
      xnoise += 0.04;
      drawPoint(x*cos(y),y*tan(x), noise(xnoise, ynoise));
    }
  } 
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 12, y * noiseFactor * 9);
  float edgeSize = noiseFactor * 9;
  ellipse(2, 2, edgeSize, edgeSize);
  popMatrix();  
}


