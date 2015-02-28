
class Ball {
  
  PVector pos;
  
  float diam;
  
  color c;
  
  Ball(PVector p, float r) {
    pos = new PVector(p.x, p.y);
    
    diam=r;
    colorMode(HSB,360,100,100);
    c = color(random(360),40,70);
  }
  
  void display() {
    strokeWeight(1);
    stroke(190);
    fill(c);
    ellipse(pos.x,pos.y,diam,diam);
  }
  
  boolean collision(Drop d) {
    boolean haveCollided = false;
    if (pos.dist(d.pos)<=diam*.5) haveCollided=true;
    return haveCollided;
  }
}

