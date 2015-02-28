
int numDots = 3;
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
        float dist = dist(x,y,theDots[d].pos.x,theDots[d].pos.y);
        if(dist >= closestDistance) {
          continue;
        }
        closestDistance = dist;
        closestDot = theDots[d];
      }
      pixels[x+y*height]--;
      pixels[x+y*height]<<=1;
      pixels[x+y*height] %= closestDot.c;
    }
  }
  updatePixels();
  
  for(int d=0; d < numDots; d++) {
    theDots[d].display();
    theDots[d].update();
  }
}

void keyPressed() {
  saveFrame("voronoitrip.png");
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
    fill(c);
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

