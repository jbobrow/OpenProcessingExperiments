
//code based on http://www.learningprocessing.com/examples/chapter-9/example-9-8/ and simple particle systems in examples

int[] xpos = new int[300]; 
int[] ypos = new int[300];
float Psize;

ParticleSystem ps;
PGraphics buffer;


void setup() {
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  size(1920,1080);
  smooth();
  frameRate(100);
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw() {
  background(0,0,0);
  ps.run();
  ps.addParticle(mouseX,mouseY);
  display();
  //saveFrame ();
    }



void display() {

  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  if (mousePressed == true){
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  

  }
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i. 
    ellipseMode(CENTER);
    stroke(255,0);
    Psize = random(8,9);
    ellipse(xpos[i],ypos[i],(i/Psize),(i/Psize));  

  }
}

void mouseReleased () {
  float r = random(255);  
  float g = random(255);
  float b = random(255);
  fill(r,g,b);
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

class ParticleSystem {

ArrayList particles; // An arraylist for all the particles
PVector origin; // An origin point for where particles are born

ParticleSystem(int num, PVector v) {
particles = new ArrayList(); // Initialize the arraylist
origin = v.get(); // Store the origin point
for (int i = 0; i < num; i++) {
particles.add(new Particle(origin)); // Add "num" amount of particles to the arraylist
}
}

void run() {
// Cycle through the ArrayList backwards b/c we are deleting
for (int i = particles.size()-1; i >= 0; i--) {
Particle p = (Particle) particles.get(i);
p.run();
if (p.dead()) {
particles.remove(i);
}
}
}

void addParticle() {
particles.add(new Particle(origin));
}

void addParticle(float x, float y) {
particles.add(new Particle(new PVector(x,y)));
}

void addParticle(Particle p) {
particles.add(p);
}

// A method to test if the particle system still has particles
boolean dead() {
if (particles.isEmpty()) {
return true;
} else {
return false;
}
}

}




// A simple Particle class

class Particle {
PVector loc;
PVector vel;
PVector acc;
color pcolor;
float r;
float timer;

// Another constructor (the one we are using here)
Particle(PVector l) {
acc = new PVector(0,0.05,0);
vel = new PVector(random(-1,1),random(-2,0),0);
float angle = degrees(PVector.angleBetween(new PVector(-1,0),vel)) * 2;

println("colour " + angle);
// sat 100 b 100 h angle

loc = l.get();
r = 30.0;
timer = 20.0;
}

void run() {
update();
render();
}

// Method to update location
void update() {
vel.add(acc);
loc.add(vel);
timer -= 1.0;
}

// Method to display
void render() {
ellipseMode(CENTER);
//stroke(255,timer);
stroke(255,0);
//fill(100,timer);
ellipse(loc.x,loc.y,r,r);

}

// Is the particle still useful?
boolean dead() {
if (timer <= 0.0) {
return true;
} else {
return false;
}
}


} 




