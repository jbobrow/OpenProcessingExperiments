
// using previous data to make lines
PImage graham;
float x,y;
float prevX, prevY;

float x2, y2;
void setup() {
  colorMode(HSB, 360, 100, 100);
  size(900,465);
  smooth();
  background(0,0,0);
  strokeWeight(.5);
  graham = loadImage("slayer.png");
  frameRate(120);
}

void draw() {

  for(int i = 0 ; i < 200000; i++) {
    x = random(width);
    y = random(height);
    float c = map(mouseX, 0, width, 100, 0);
    float d = map(mouseY, 0, height, 100, 0);
    color cp = graham.get(int(x),int(y));
    color cpPrev = graham.get(int(prevX), int(prevY));
    float b = hue(cp);
    float bPrev = hue(cpPrev);
    if(b != 0 && bPrev != 0 && dist(x,y,prevX,prevY) < 40) {
      stroke(0,c,d,50);
      line(x,y,prevX, prevY);
    }
    prevX = x;
    prevY = y;
  }
  for(int i = 0 ; i < 1000; i++) {
    float c = map(mouseX, 0, width, 0, 100);
    float d = map(mouseY, 0, height, 0, 100);
    x = random(width);
    y = random(height);
    color cp = graham.get(int(x),int(y));
    float b = hue(cp);
    if(b == 0) {
      float ellSize = random(5, 22);
      noStroke();
      fill(0, c, d, 40);
      ellipse(x, y, ellSize, ellSize);
    }
  }
}

