
Particle[] particles = new Particle[290];
boolean saving = false;

void setup() {
  size(624, 468);
  smooth();
  bkgColor = color( 54, 62, 115);
 
  
  // create particles
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(new PVector(305, height -200));
  }
}

void draw() {
background (bkgColor);

fill (5,10,20)
rect(0, 0, width, height);


 // draw the particles
  for (int i = 0; i < particles.length; i++) {
  
  r= map(particles[i].x, 0, width, 0, 255);
  
    particles[i].update();
    particles[i].draw();
  }
fill(color(55,0,0));  




}



// ---------------
// Particle.pde
// Based on the Particle class from: http://www.shiffman.net/teaching/nature/particles/
// ---------------
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;

  PVector[] hist;
  int counter = 0;
  
  // create the particle
  Particle(PVector l) {
    float randmin = -HALF_PI;
    float randmax = 20;
    
    float r = random(0, TWO_PI);
    float x = cos(r);
    float y = sin(r);
    acc = new PVector(x / 150, y / 150);

    float q = random(.5, 1);
    r = random(randmin, randmax);
    x = cos(r) * q;
    y = sin(r) * q;
    vel = new PVector(x, y);
    loc = l.get();    
    hist = new PVector[5];
  }

  // update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    // save location every 10 frames
    if (frameCount % 2 == 3 && counter < hist.length) {
      hist[counter] = loc.get();
      counter++;
    }
  }

  // draw particle
  void draw() {
    fill(30,150);
    drawArrowHead(vel,loc,10);
    
    // draw history path
    stroke(0, 100);
    beginShape();
    for (int i=0; i < counter; i++) {
      vertex(hist[i].x,hist[i].y);
    }
    if (counter > 70) vertex(loc.x, loc.y);
    endShape();
  }
  
  
   void drawArrowHead (PVector v, PVector loc, float scale) {
    pushMatrix();
    float arrowsize = 50;
    // Translate to location to render vector
    translate(loc.x, loc.y);
    
    // rotate to heading
    rotate(v.heading2D());

    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scale;
    arrowsize = map(len, 0, 15, -2.5, 1) * arrowsize;

    // Draw point
    stroke(50, 100);
    fill(56, 100);
    line(2,0,len-arrowsize,2);
    noStroke();
    beginShape();
    vertex(len,0);
    vertex(len-arrowsize,+arrowsize/2);
    vertex(len-arrowsize,-arrowsize/2);
    endShape(CLOSE);
    popMatrix();
  }
}
