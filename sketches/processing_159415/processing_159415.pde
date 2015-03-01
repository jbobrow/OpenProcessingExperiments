
// Tweak of http://www.openprocessing.org/sketch/96117
// 
// by Tim McNamara
//  -- http://timmcnamara.co.nz
//  -- @timClicks
//
// changes include
//  -- decreased colour palette
//  -- minimise impact of particle life span
//  -- fiddling with the colorSeperation variable parametes to the noise function

int elapsedFrames = 1;
int maxCol=3;
int stepsPerDraw=4;
float offsetX=random(100);
float offsetY=random(100);
float timeVariance = 1;
float colorSeparation = 1.2;
int maxLifeTime = 7;
int numberOfPoints = 1600;
 
ArrayList points = new ArrayList();
 
void setup() {
  smooth();
  size(800, 600);
  background(255);
  createPoints();
}
 
void draw() {
  for (int step=0;step<stepsPerDraw;step++)
  {
    for (int i = 0; i < points.size(); i++) {
      Point localPoint = (Point) points.get(i);
 
      if (localPoint.isDead == true) {
        points.remove(i);
      }
 
      localPoint.update();
      localPoint.draw();
    }
  }
  elapsedFrames++;
}

void keyPressed() {
  if (key == ' ') {
    offsetX=random(10);
    offsetY=random(10);
 
    for (int i = 0; i < points.size(); i++) {
      Point localPoint = (Point) points.get(i);
      localPoint.isDead = true;
    }
    noStroke();
    fill(0);
    rect(0, 0, width, height);
    createPoints();
  }
  if (key == 'r') {
    createPoints();
  }
}
 
void createPoints() {
  for (int i = 0; i < numberOfPoints; i++) {
    PVector pos = new PVector(random(width), random(height));
    PVector vel = new PVector(0, 0);
    Point punt = new Point(pos, vel, maxLifeTime*0.5+random(maxLifeTime*0.5), (int)random(maxCol));     
    points.add(punt);
  }
}
 
class Point {  
  PVector pos, vel, noiseVec;
  float noiseFloat, lifeTime, age;
  boolean isDead;
  int col;
 
  public Point(PVector _pos, PVector _vel, float _lifeTime, int _col) {
    pos = _pos;
    vel = _vel;
    col = _col;
    lifeTime = _lifeTime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
  }
 
  void update() {
    noiseFloat = noise(
        offsetX+pos.x * 0.0015,
        offsetY+pos.y * 0.0015,
        col*colorSeparation+cos(elapsedFrames*0.01)*timeVariance);
    noiseVec.x = cos(((noiseFloat -0.3) * TWO_PI) * 5);
    noiseVec.y = sin(((noiseFloat -0.3)* TWO_PI) * 5);
 
    vel.add(noiseVec);
    vel.div(3);
    pos.add(vel);
 
    if (1.0-(age/lifeTime) == 0) {
      isDead = true;
    }
 
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      isDead = true;
    }
 
    age++;
  }
 
  void draw() {  
    //fill(vel.x * 255, vel.y * 255, pos.x * 100 ,20);
    int r, g, b;
    switch(col)
    {
    case 0:
      r=140;
      g=0;
      b=220;
      break;
    case 1:
      r=0;
      g=140;
      b=220;
      break;

    case 2:
      r=0;
      g=0;
      b=255;
      break;
    default:
      r=255;
      g=255;
      b=255;
      break;
    }      
    float a = 2;//min(2, age);
    fill(r, g, b, a);
    noStroke();   
    ellipse(pos.x, pos.y, 4, 4);
  }
};
