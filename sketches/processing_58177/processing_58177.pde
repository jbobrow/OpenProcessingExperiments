
PGraphics sky;
int numOfWaves = 3;
Waves[] waves;

void setup() {
  size(600,400);
  smooth();
  
  int startX = -50;
  int startY = height-150;
  int waveWidth = width+100;
  int waveHeight = 200;
  
  waves = new Waves[numOfWaves];
  
  for (int i = 0; i<numOfWaves; i++) {
    waves[i] = new Waves(startX,startY+(30*i),waveWidth,waveHeight);
  }
  
  makeBackground();
}

void draw() {
  image(sky,0,0);
  for (int i = 0; i<numOfWaves; i++) {
    waves[i].update();
    waves[i].display();
  }
}

void makeBackground() {
  sky = createGraphics(width,height,P2D);
  sky.beginDraw();
  sky.smooth();
  colorMode(HSB, 360, 100, 100);
  color skyC;
  float skyS;
  
  sky.loadPixels();
  for (int y=0;y<height;y++) {
    for (int x=0;x<width;x++) {
      skyS = map(y,0,height,100,0);
      skyC = color(190,skyS,100);
      sky.set(x,y,skyC);
    }
  }
  colorMode(RGB,255,255,255);
  sky.updatePixels();
  sky.endDraw();
}
  

