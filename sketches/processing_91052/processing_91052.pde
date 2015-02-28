
ParticleSystem ps;
void setup() {
size(720, 480);
ps = new ParticleSystem(width/2, height/2);
background(0);
}
void draw() {
background(0);
//ps.ParticleSystem(mouseX, mouseY);

ps.addParticle();
ps.origin.x=mouseX;
ps.origin.y=mouseY;
ps.run();
}

//Particle Class
class Particle {
PVector location;
PVector acceleration;
PVector velocity;
float life;
float mass = 5;
int col;

Particle(PVector loc) {
location = loc.get();
life = 255.0;
acceleration = new PVector(0, 1);
velocity = new PVector(random(-3, 5), random(-5, 0));
 col = color(random(255),random(255),random(255),random(255));
}

void update() {
velocity.add(acceleration);
location.add(velocity);
acceleration.mult(0);
life -= 3.0;
}

void display() {
    ellipseMode(CENTER);
    noStroke();
   fill(col);
    ellipse(location.x,location.y,random(2,10),random(2,10));

}

void applyForce(PVector force) {
PVector f = force.get();
f.div(mass);
acceleration.add(f);
}

void run() {
update();
display();
}

boolean isDead() {
  if (life < random(30,40)) {
    velocity = new PVector(random(-3, 5), random(10, 0));
  }
if (life < 0.0) {
return true;
} else {
return false;
}
}
}
//particleSystem Class
import java.util.*;
class ParticleSystem {
ArrayList<Particle> particles;
PVector origin;

ParticleSystem(float x, float y) {
origin = new PVector(x,y);
x = mouseX;
y = mouseY;
particles = new ArrayList<Particle>();
}

void addParticle() {
particles.add(new Particle(origin));
}

void applyForce(PVector f) {
for (Particle p: particles) {
p.applyForce(f);
}
}

void run() {
for (int i = particles.size()-1; i > 0; i--) {
Particle p = particles.get(i);
p.run();

if (p.isDead()) {
particles.remove(p);
}
}
}
}

