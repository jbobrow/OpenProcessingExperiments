
//Particle

ParticleSystem ps;
float s = dist(mouseX, mouseY, pmouseX, pmouseY) + 1;
void setup() {
size(600, 600);
colorMode(RGB, 255, 255, 255, 100);
ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
smooth();
}

void draw() {
background(255);

fill(255);
rect(0, 0, 200, 600);
fill(200);
rect(200, 0, 200, 600);
fill(0);
rect(400, 0, 200, 600);

fill(0);
rect(0, 300, 400, 200);
fill(200);
rect(200, 300, 400, 200);
fill(255);
rect(400, 300, 400, 200);




noStroke();
ps.run();
ps.addParticle(mouseX,mouseY);

  if(mouseX != 0 && mouseY != 0 && pmouseX !=0 && pmouseY != 0) {

    fill(0, 102);
    rect(mouseX, mouseY, s, s);
    point(mouseX, mouseY);
  }
}



// Création de la class ParticleSystem
class ParticleSystem {

ArrayList particles; // An arraylist for all the particles
PVector origin; // Point d'origine des particules

ParticleSystem(int num, PVector v) {
particles = new ArrayList();
origin = v.get(); // Stocke le point d'origine
for (int i = 0; i < num; i++) {
particles.add(new Particle(origin));
}
}

void run() {

for (int i = particles.size()-1; i >= 0; i--) {
Particle p = (Particle) particles.get(i);
p.run();
if (p.dead()) {
particles.remove(i);
}
}
}



// Ajouter une particule a l'origine

void addParticle() {
particles.add(new Particle(origin));
}

void addParticle(float x, float y) {
particles.add(new Particle(new PVector(x,y)));
}

void addParticle(Particle p) {
particles.add(p);
}



// Verifier si il reste des particules
boolean dead() {
if (particles.isEmpty()) {
return true;
} else {
return false;
}
}

}



// Simple Particle class

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
timer = 100.0;
}

void run() {
update();
render();
}


void update() {
vel.add(acc);
loc.add(vel);
timer -= 1.0;
}


void render() {
ellipseMode(CENTER);

fill(100,timer);

   if (mousePressed == true) {
    rect(loc.x,loc.y,random(50,51),random(50,1));
}
displayVector(vel,loc.x,loc.y,10);
}



//Test
boolean dead() {
if (timer <= 0.0) {
return true;
} else {
return false;
}
}



//Code pour orienter les particules
void displayVector(PVector v, float x, float y, float scayl) {
pushMatrix();
float arrowsize = 4;
// Translate to location to render vector
translate(x,y);
// Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
rotate(v.heading2D());
// Calculate length of vector & scale it to be bigger or smaller if necessary
float len = v.mag()*scayl;
// Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
rect(mouseX, mouseY, 50, 50);

popMatrix();
}

}

