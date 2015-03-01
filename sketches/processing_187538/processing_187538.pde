
ArrayList particles = new ArrayList();
float box = 150;

void setup() {
  size(540,540, P3D);
  noFill();
  strokeWeight(2);
}

void draw() {
  background(0);
  if ((frameCount % 3) == 0) {
    float x = random(-box, box);
    float z = random(-box, box);
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
    for (int i = 0; i < 50; i++) {
      particles.add(new Particle(new PVector(x+random(2, 5), -box+random(2, 5), z+random(2, 5)), acc));
      //particles.add(new Particle(new PVector(0, 0, 0)));
    }
  }

  translate(width/2, height/2);
  rotateY(radians(1+mouseX/3));
  stroke(255);
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.move();
    p.applyForce(new PVector(0, 0.1, 0));
    
    float b = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount))*cos(radians(p.loc.y))*40;
    
    p.changeVel(b);
    p.boundary(b);
    if(p.life < 0){
      particles.remove(p); 
    }
  }
}

class Particle {
  PVector loc, vel, acc;
  float bounce = -0.3;

  int hits = 0;
  float life = random(200, 300);
  float maxLife = life;

  Particle(PVector loc, PVector acc) {
    this.loc = loc;
    vel = new PVector();
    this.acc = acc;
  }

  void move() {
    life--;
    //stroke(0, 150, 255, map(life, 0, maxLife, 1, 255));
    stroke(0, 150, 255);
    point(loc.x, loc.y, loc.z);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void changeVel(float b) {
    /* We do this so we can make an explosion effect and because we only want to make the explostion once and only when it hits the boundary, we use hits to
    make sure we only change the acceleration when it first hits. */
    if (loc.y > box-b) hits++;
    if (loc.y > box-b && hits == 1) acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  }

  void applyForce(PVector force) {
    acc.add(PVector.div(force, 1));
  }

  void boundary(float b) {
    /* 
    We check every x, y and z boundary, reverse the velocity and say the location is equal to the boundary. 
    We do this so the particles can't escape the area no matter what. 
    */
    if (loc.x < -box) { 
      vel.x *= bounce; 
      loc.x = -box;
    }
    if (loc.x > box) { 
      vel.x *= bounce; 
      loc.x = box;
    }

    if (loc.y < -box) { 
      vel.y *= bounce; 
      loc.y = -box;
    }
    if (loc.y > box-b) { 
      vel.y *= bounce; 
      loc.y = box-b;
    }

    if (loc.z < -box) { 
      vel.z *= bounce; 
      loc.z = -box;
    }
    if (loc.z > box) { 
      vel.z *= bounce; 
      loc.z = box;
    }
  }
}

