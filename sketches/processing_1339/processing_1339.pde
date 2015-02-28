
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  color c;
  float a;

  public Particle(int lx, int ly,float al) {
    loc = new PVector(lx,ly);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    c = color((int) random(maxRed),(int) random(maxGreen),(int) random(maxBlue));
    a = al;
  }
  
  void update() {

    if(flocking) {
      
      PVector t = new PVector(0,0);
      float d;
      for(int i = 0; i < particles.length; i++) {
        if(particles[i] != null) {
          d = PVector.sub(particles[i].loc,loc).mag();
          if(d < flockRadius) {
            t.add(PVector.sub(particles[i].loc,loc));
          }
        }
      }
      acc.set(t);
    }
    
    if(mousePressed) {
      PVector m = new PVector(mouseX,mouseY);
      PVector n = PVector.sub(m,loc);
      if(n.mag() < brushSize) {
        acc.set(n);
      }
    }

    randAcc();

    acc.limit(maxSteer);

    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);

    borders();
  }
  
  void randAcc() {
    acc.x += (int) (random(variation) - (int) (variation/2));
    acc.y += (int) (random(variation) - (int) (variation/2));
  }

  void borders() {
    if (loc.x < -1) loc.x = width+1;
    if (loc.y < -1) loc.y = height+1;
    if (loc.x > width+2) loc.x = -1;
    if (loc.y > height+2) loc.y = -1;

  }

  void render() {
    stroke(c,a);
    point(loc.x,loc.y);
    if(drawLines) {
      pushMatrix();
      translate(loc.x,loc.y);
      rotate(vel.heading2D());
      line(0,0,vel.mag() * lineSize,0);
      popMatrix();
    }
  }
}


