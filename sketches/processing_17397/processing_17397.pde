
import processing.opengl.*;


float NoiseScale = 0.005;
float NoiseOffsetX, NoiseOffsetY;

void setup() {
  size(800,300,OPENGL);
  noCursor();
}
void draw() {
  background(255);
  noFill();
  stroke(0,0,0,90);
  for(int i = 0; i<300;i++) {
    NoiseOffsetX += 12;
    NoiseOffsetY += 1.9;
    drawOneStream();
  }
}

void drawOneStream() {
  float px = 1;
  float py = height/2;
  float vx = 1;
  float vy = 0;
  int pcnt = 0;
  while((px>=0) && (px<width) && (py< height) && (py>=0)) {

    point(px,py);
    float xNoise = noise((pcnt+NoiseOffsetX) * NoiseScale);
    float yNoise = noise((pcnt + NoiseOffsetY) * NoiseScale);
    vx = ((2*vx) + 1 + map(xNoise, 0, 1,-1,1))/4.0;
    vy = ((3*vy) +  map(yNoise,0,1,-1,1))/4.0;
    px += 2*vx;
    py += 2*vy;
    pcnt++;
  }
} 


