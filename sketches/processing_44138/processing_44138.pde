
void setup() {
  size(500,300);
  background(255);
  strokeWeight(0.5);
  smooth();
  frameRate(12);
}

int _end = 5;
int _step = 5;
void draw() {
  _end += _step;
  if (_end > 100) {
    _step = -1*_step;
  }
  if (_end < 0) {
    _step = -1*_step;
  }
  background(255,10);
  rotate(radians(1));
  
  
  int centX = width/2;
  int centY = height/2;
  
  float x,y;
  for (int i = 0; i < _end; i++) {
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke(random(100),random(20),random(80),80);
    
    int startangle = int(random(360));
    int endangle = 1440 + int(random(360));
    int anglestep = 5 + int(random(3));
    for (float ang = startangle; ang <=endangle;ang+=anglestep) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise)*200)-100;
      float rad = radians(ang);
      x = centX + (thisRadius*cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x,y,lastx,lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}
//saveFrame("RandomSpiral-####.jpg");

