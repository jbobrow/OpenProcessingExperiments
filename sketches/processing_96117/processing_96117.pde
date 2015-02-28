
int elapsedFrames = 0;
int maxCol=7;
int stepsPerDraw=1;
float offsetX=random(10);
float offsetY=random(10);
float timeVariance = 0.01;
float colorSeparation = 0.01;
int maxLifeTime = 10;
int numberOfPoints = 15000;

ArrayList points = new ArrayList();

void setup() {
  smooth();
  size(600, 600);
  background(0);
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
    noiseFloat = noise(offsetX+pos.x * 0.0025, offsetY+pos.y * 0.0025, col*colorSeparation+cos(elapsedFrames*0.01)*timeVariance);
    noiseVec.x = cos(((noiseFloat -0.3) * TWO_PI) * 5);
    noiseVec.y = sin(((noiseFloat - 0.3) * TWO_PI) * 5);

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
      r=255; 
      g=255; 
      b=0; 
      break;
    case 1: 
      r=255; 
      g=0; 
      b=255; 
      break;

    case 2: 
      r=0; 
      g=255; 
      b=255; 
      break;
    case 3: 
      r=255; 
      g=0; 
      b=0; 
      break;  
    case 4: 
      r=0; 
      g=255; 
      b=0; 
      break;   
    case 5: 
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
    fill(r, g, b, min( 20, age));
    noStroke();
    //ellipse(pos.x, pos.y, 1-(age/lifeTime), 1-(age/lifeTime));    
    ellipse(pos.x, pos.y, 1, 1);
  }
};



