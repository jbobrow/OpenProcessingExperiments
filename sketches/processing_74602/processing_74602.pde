
int n = 1000; // number of travellers
float speed = .5; // pixels per frame
float erraticness = .01; // change direction 1% of the time 
float trailLength = .95; // 0-1
boolean useRgb = true; // false means white travellers

PVector points[] = new PVector[n];
PVector direction[] = new PVector[n];
color colors[] = new color[n];
color
  lcd0 = color(255, 0, 0),
  lcd1 = color(0, 255, 0),
  lcd2 = color(0, 0, 255);
  
void setup() {
  size(512, 512);
  noSmooth();
  for(int i = 0; i < n; i++) {
    points[i] = randomPosition();
    direction[i] = randomDirection();
    colors[i] = randomColor();
  }
}

void draw() {
  noStroke();
  fill(0, (1 - trailLength) * 255);
  rect(0, 0, width, height);
  
  noFill();
  stroke(255);
  for(int i = 0; i < n; i++) {
    // sometimes pick a new direction
    if(random(1) < erraticness) {
      direction[i] = randomDirection();
    }
    
    // move forward
    PVector scaledDirection = direction[i].get();
    scaledDirection.mult(speed);
    points[i].add(scaledDirection);
    
    // bounce off walls
    if(points[i].x < 0 || points[i].x > width ||
      points[i].y < 0 || points[i].y > height) {
      direction[i].mult(-1);
    }
    
    if(useRgb) {
      stroke(colors[i]);
    }
    point((int) points[i].x, (int) points[i].y);
  }
}

PVector randomPosition() {
  return new PVector(random(width), random(height));
}

PVector randomDirection() {
  float theta = random(0, TWO_PI);
  PVector p = new PVector(sin(theta), cos(theta));
  p.x = round(p.x);
  p.y = round(p.y);
  return p;
}

color randomColor() {
  switch(int(random(3))) {
    case 0: return lcd0;
    case 1: return lcd1;
    default: return lcd2;
  }
}
