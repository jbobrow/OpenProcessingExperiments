
class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector(); 
  float r = 6;

  void setup() {
    pos.set(width/2,height/2,0);
    vel.x = 5;
    vel.y = 5;
  }

  void draw() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void update() {
    pos.add(vel);
    if (pos.x+r>width || pos.x-r<0) vel.x=-vel.x;
    if (pos.y+r>height || pos.y-r<0) vel.y=-vel.y;
  }
}



