
class Particle {
  PVector loc;
  PVector vel;
  float r;
  float b;
  color c;

  public Particle() {
    loc = new PVector(random(width),random(height));
    vel = new PVector(0,0);
    r = 5;
    b = 201;
    c = color(random(100),random(100),random(100));
  }

  public Particle(float x, float y) {
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    r = 5;
    b = 201;
    c = color(random(100),random(100),random(100));
  }

  private void setColor() {
    stroke(r,0,b);
    fill(r,0,b);
    if(colors) { 
      stroke(c); 
      fill(c); 
    }
  }

  public void collide(Particle target) {
    PVector force = PVector.sub(loc,target.loc);
    if(force.mag() > b) {
      return;
    }
    force.mult(r-b);
    force.limit(r/50);
    force.mult(0.5);
    vel.add(force);
    force.mult(-1);
    target.vel.add(force);
    setColor();
    if(lines) {
      strokeWeight(.5);
      line(loc.x,loc.y,target.loc.x,target.loc.y);
    }
    if(r < 200) r+=.5;
    if(b > -1) b-=.5;
  }

  public void update() {
    //update color
    if(b <= 200) b+=2;
    if(r > 5) r-=2;

    //update vel/location
    //vel.add(grav);
    float ox = loc.x;
    float oy = loc.y;
    loc.add(vel);
    setColor();
    if(interpolate) {
      strokeWeight(particle_size);
      line(ox,oy,loc.x,loc.y);
    }

    //check boundaries
    if(loc.y > height-4) {
      loc.y = ((height-4) + (sin(loc.x)));
      vel.y = -vel.y;
    }
    if(loc.y < 4) {
      loc.y = 4;
      vel.y = -vel.y;
    }
    if(loc.x > width) {
      loc.x = ((width-4) + (sin(loc.y)));
      vel.x = -vel.x;
    }
    if(loc.x < 0) {
      loc.x = (4 + (sin(loc.y)));
      vel.x = -vel.x;
    }

    //apply drag
    vel.mult(0.8);
  }

  public void render() {
    setColor();
    ellipseMode(CENTER);
    ellipse(loc.x,loc.y,particle_size,particle_size);
  }
}




