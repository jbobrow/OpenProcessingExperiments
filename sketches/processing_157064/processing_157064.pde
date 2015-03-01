
Mover[] mover = new Mover[200];
float topspeed = 6;
int atomSize = 6;

void setup() {
  size(640,360);
  for(int cnt = 0; cnt < mover.length; cnt++){
      mover[cnt] = new Mover();
  }
  smooth();
  frameRate(120);
  background(0);
}

void draw() {
  noStroke();
  fill(0,1);
  rect(0,0,width,height);
  for(int cnt = 0; cnt < mover.length; cnt++){
   mover[cnt].update();
   mover[cnt].checkEdges();
   mover[cnt].display();
  }
}
void mouseReleased(){
  for(int cnt = 0; cnt < mover.length; cnt++){
      mover[cnt] = new Mover();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  color col;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration= new PVector(0,0);
    col = color(random(100,255),random(100,255),random(100,255));
  }

  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(random(0.5));
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void display() {
    stroke(col);
    strokeWeight(atomSize);
    point(location.x,location.y);
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }

}
