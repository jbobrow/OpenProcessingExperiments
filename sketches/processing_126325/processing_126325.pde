
ArrayList particles;
PVector force;
float wall;

void setup() {
  background(0);
  frameRate(30);
  size(600, 600);
  stroke(0);
  strokeWeight(3);
  fill(150);
  smooth();
  wall = -1;

  particles= new ArrayList();
}


void draw() {
  background(255); 
  stroke(0);
  text("x: add 10, z: remove 10, c: hard/looped walls", 175, 10);
  text("click to add", width/2-30, 590);
  //    camera(-width, -height, (height) / tan(PI/6), 2*width,2*height, 0, 1, 1, 1);
  for (int i = particles.size()-1;i >= 0; i--) {
    for (int j= particles.size()-1;j >= 0; j--) {

      particle a=(particle)particles.get(i);
      particle b=(particle)particles.get(j);
      float deltforce = applyCentralForce(a, b, 1f, 50f);
      a.update();
      PVector ac = a.loc.get();
      PVector bc = b.loc.get();
      ac.sub(bc);
      if (  ac.mag()<100 ) {
        strokeWeight(100* deltforce);    
        stroke(0);
        line(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
      }
    }
  }
}

void mousePressed() {
  particles.add(new particle(mouseX, mouseY ));
}

void keyPressed() {
  if (key == 'x') {
    for (int i=0;i<10;i++) {
      particles.add(new particle(random(width), random(height) ));
    }
  }
  if (key == 'z' && (particles.size() >20) ) {
    for (int i=0;i<9;i++) {
      particles.remove(i);
    }
  }
  if (key == 'c') {
    wall = -wall;
  }
}

public float applyCentralForce(particle a, particle b, float strength, float minDistance) {
  PVector dir = PVector.sub(a.loc, b.loc);
  float d = dir.mag();
  if (d < minDistance) d = minDistance;
  dir.normalize();
  float force = (strength * a.mass * b.mass)/(d*d) ;
  dir.mult(force);
  b.applyForce(dir);
  dir.mult(-1f);
  a.applyForce(dir);
  return force;
}


public class particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  boolean fixed;

  public particle(float x, float y) {
    loc= new PVector(x, y);
    vel= new PVector(0, 0);
    acc= new PVector(0, 0, 0);
    mass=random(25) ;
    fixed = false;
  }

  public void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);

    if (wall > 0) {
      //looped walls
      if (loc.x<0)  loc.x=width;
      if (loc.y<0) loc.y=height;
      if (loc.x>width)loc.x=0;
      if (loc.y>width) loc.y=0;
    } 
    else {
      //hard walls
      if (loc.x<0)  vel.x=-vel.x;
      if (loc.y<0) vel.y=-vel.y;
      if (loc.x>width)vel.x=-vel.x;
      if (loc.y>width) vel.y=-vel.y;
    }

    //Top Speed
    if (vel.mag()> 4) {
      vel.normalize();
      vel.mult(4);
    }

    strokeWeight(.1);
    stroke(0, 125, 0);
    noFill();
    ellipse(loc.x, loc.y, 3*mass, 3*mass);
  }

  void applyForce(PVector force) {
    acc.add(PVector.div(force, mass));
  }
}



