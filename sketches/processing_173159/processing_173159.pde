
float nStart, nSize, noiseY, theta;
int frames = 18;

void setup() {
  size(600, 400);
  nStart = random(1000);
  stroke(0, 150);
}

void draw() {
  randomSeed(66);
  background(255);
  int stepX = 8;
  int stepY = 20;
  nSize = nStart;
  for (int y=0; y<height*1.2; y+= stepY) {
    float f = random(50, 255);
    for (int x=0; x<width*1.2; x+=stepX) {
      randomSeed(millis());
      fill(max(min(f + random(-0.1,0.1), 255), 50));
      float sz = noise(nSize+y, noiseY)*100;
      // float sz = noise(sin(theta+x*2),cos(theta+y*2))*100;
      ellipse(x, y, sz, sz);
      nSize +=.15;
    }
  }
  noiseY += 0.1;
    theta -= TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

void keyPressed() {
  saveFrame("image-###.gif");
}
