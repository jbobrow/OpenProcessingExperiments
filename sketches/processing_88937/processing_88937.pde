
int cx;
int cy;
int orbitSize;
float orbitTime;
int circleSize;

int junkAmount = 250;

Satellite[] spaceJunk = new Satellite[junkAmount];

void setup(){
  
  size(800,800);
  background(255);
  noStroke();
  smooth();
  
  cx = width/2;
  cy = height/2;
  orbitSize = 200;
  orbitTime = 1000.0;
  circleSize = 50;
  
  for (int i= 0; i<junkAmount; i++) {
    spaceJunk[i] = new Satellite(width/2, height/2);
  }
  
}

void draw(){
  background(255);
  fill(0);
  ellipse(width/2,height/2, 100,100);
  
  for (int i = 0; i < junkAmount; i++) {
    spaceJunk[i].display();
  }
  
}

class Satellite {
  int cx;
  int cy;
  int orbitSize;
  float orbitTime;
  int circleSize;

  Satellite(int _cx, int _cy) {

    cx = _cx;
    cy = _cy;
    orbitSize = int(random(110, 300));
    orbitTime = random(900.0, 2000.0);
    circleSize = int(random(5, 20));
  }

  void display() {

    float t = millis()/orbitTime;

    int x = int(cx+orbitSize*cos(t));
    int y = int(cy+orbitSize*sin(t));
    
    fill(0,255,0);

    ellipse(x, y, circleSize, circleSize);
  }
}



