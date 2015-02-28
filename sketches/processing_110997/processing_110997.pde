
Particle[] particles;
PVector g;
float maxTTL;
float bounce;
float maxVel;
float rad;
boolean physics;

void setup() {
  physics = false;
  size(500, 500);
  background(255);
  particles = new Particle[1000];
  g = new PVector(0, 100);
  maxVel = 200;
  maxTTL = 10;
  bounce = 0.4;
  rad = 8;
  initParticles();
  smooth(5);
  frameRate(60);
}

void draw() {
  background(255);
  handleParticles();
}

void handleParticles() {
  for (int i = 0; i < particles.length; i++) {
    if (particles[i].ttl <= 0) particles[i] = randomParticle();
    if (physics) collision(i);
    particles[i].move();
    particles[i].display();
  }
}

void collision(int i) {
  for(int j = 0; j < i; j++)
    particles[i].collision(particles[j]);
}

void initParticles() {
  for (int i = 0; i < particles.length; i++) {
    particles[i] = randomParticle();
  }
}

Particle randomParticle() {
  return new Particle(new PVector(mouseX, mouseY), new PVector(random(-maxVel, maxVel), random(-maxVel, maxVel)), random(maxTTL), color(random(255), random(255), random(255)));
}

public class Particle {
  PVector pos, vel, acc;
  float ttl, tl;
  int col;
  
  public Particle(PVector sPos, PVector sVel, float ttl) {
    col = color(255);
    pos = sPos;
    vel = sVel;
    acc = new PVector(0,0);
    this.ttl = ttl;
    tl = 0;
  }
  
  public Particle(PVector sPos, PVector sVel, float ttl, color col) {
    this.col = col;
    pos = sPos;
    vel = sVel;
    acc = new PVector(0,0);
    this.ttl = ttl;
    tl = 0;
  }
  
  void move() {
    if (pos.x - rad/2 < 0 || pos.x + rad/2 > width) {
      if (pos.x - rad/2 < 0) pos = new PVector(rad/2, pos.y);
      else pos = new PVector(width - rad/2, pos.y);
      vel = new PVector(-vel.x * bounce, vel.y * bounce);
      acc = new PVector(0, acc.y * bounce);
    }
    if (pos.y - rad/2 < 0 || pos.y + rad/2 > height) {
      if (pos.y - rad/2 < 0) pos = new PVector(pos.x, rad/2);
      else pos = new PVector(pos.x, height - rad/2);
      pos.sub(PVector.div(vel, frameRate));
      vel = new PVector(vel.x * bounce, -vel.y * bounce);
      acc = new PVector(acc.x * bounce, 0);
    }
    acc.add(PVector.div(g, frameRate));
    vel.add(PVector.div(acc, frameRate));
    pos.add(PVector.div(vel, frameRate));
    ttl -= 1/frameRate;
    tl += 1/frameRate;
  }
  
  void collision(Particle that) {
    PVector line = PVector.sub(that.pos, pos);
    if (tl > 1 && line.mag() < rad) {
      float angle = atan(line.y / line.y);
      
      float speed1 = that.vel.mag();
      float speed2 = vel.mag();
      
      float dir1 = atan(that.vel.y / that.vel.x);
      float dir2 = atan(vel.y / vel.x);
      
      float finalVelX2 = speed1 * cos(dir1 - angle);
      float finalVelY2 = speed1 * sin(dir1 - angle);
      float finalVelX1 = speed2 * cos(dir2 - angle);
      float finalVelY1 = speed2 * sin(dir2 - angle);
      
      float velx1 = cos(angle) * finalVelX1 + cos(angle + PI/2) * finalVelY1;
      float vely1 = sin(angle) * finalVelX1 + sin(angle + PI/2) * finalVelY1;
      float velx2 = cos(angle) * finalVelX2 + cos(angle + PI/2) * finalVelY2;
      float vely2 = sin(angle) * finalVelX2 + sin(angle + PI/2) * finalVelY2;
      
      that.vel = new PVector(velx1, vely1);
      vel = new PVector(velx2, vely2);
      
      line.setMag(rad - line.mag());
      that.pos = PVector.add(that.pos, PVector.mult(line, 0.51));
      pos = PVector.add(pos, PVector.mult(line, -0.51));
    }
  }
  
  void display() {
    if (!physics || tl > 1) {
      stroke(col, map(ttl, -1/frameRate, maxTTL, 0, 255));
      strokeWeight(rad);
      point(pos.x, pos.y);
    } else {
      noFill();
      stroke(col, map(ttl, -1/frameRate, maxTTL, 0, 255));
      strokeWeight(1);
      ellipse(pos.x, pos.y, rad, rad);
    }
  }
}
