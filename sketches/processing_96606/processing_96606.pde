
float r=0;
float g=150;
float b=255;
float noiseScale=0.02;
float noiseVal;

void setup() {
  size(1200, 800);
}

void draw() {
  r+=.01;
  g+=.005;
  b+=.001;
  for(int y = 0; y<height; y+=10) {
    for(int x = 0; x<width; x+=10) {
      noiseVal = noise((mouseX+x)*noiseScale, (mouseY+y)*noiseScale);
      fill(noiseVal*255, noiseVal*255, noiseVal*255);
      rect(x, y, 10, 10);
    }
  }
  noiseScale+=.0001;
}
