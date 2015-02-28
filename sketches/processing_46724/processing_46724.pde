
int numDots = 10;
Dot[] theDots = new Dot[numDots];

void setup() {
  size(500,500);
  noStroke();
  
  for(int i=0; i < numDots; i++) {
    theDots[i] = new Dot(new PVector(width/2,height/2),new PVector(random(-5,5),random(-5,5)),color(map(i,0,numDots,0,255)));
  }
}

void draw() {
  loadPixels();
  for(int x=0; x < width; x++) {
    for(int y=0; y < height; y++) {
      Dot closestDot = null;
      float closestDistance = 99999;
      for(int d=0; d < numDots; d++) {
        float dist = dist(theDots[d].pos.x,theDots[d].pos.y,x^y,y);
        if(dist >= closestDistance) {
          continue;
        }
        closestDistance = dist;
        closestDot = theDots[d];
      }
      pixels[x+y*height] = closestDot.c;
    }
  }
  updatePixels();
  
  for(int d=0; d < numDots; d++) {
    theDots[d].update();
  }
}

class Dot {
  color c;
  PVector pos;
  PVector speed;
  
  Dot(PVector pos_, PVector speed_, color c_) {
    pos = pos_;
    c = c_;
    speed = speed_;
  }
  
  void display() {
    int cc = int(red(c));
    if(abs(cc - 128) <= 20) {
      cc = 255;
    }
    fill(abs(cc-255));
    ellipse(pos.x,pos.y,10,10);
  }
  
  void update() {
    pos.add(speed);
    
    if(pos.x < 0 || pos.x > width) {
      speed.x *= -1;
    }
    
    if(pos.y < 0 || pos.y > height) {
      speed.y *= -1;
    }
  }
}

