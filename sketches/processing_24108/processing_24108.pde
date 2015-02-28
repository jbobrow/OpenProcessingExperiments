
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 10.0;
    timer = 150.0;
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
    r -= 0.1;
  }

  void render() {
    ellipseMode(CENTER);
    noStroke();
    fill(mouseX-timer,timer,mouseY-timer);
    tint(timer, 255, 255, 255); 
    ellipse(loc.x,loc.y,r,r);
  }
  
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
   void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    translate(x,y);
    stroke(255);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  } 

}


