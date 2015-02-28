
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/53059*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
Island
by Daniel Buschek
February, 2012

Drag around the little handles along the coastline to raise the island of your dreams.
Right-click a handle to bring the corresponding hill into the foreground.
*/


float coastHeight;

int numSegs = 20;
ArrayList<Segment> segs = new ArrayList<Segment>();
Segment dragged;

void setup() {

  size(800, 600);
  frameRate(30);
  smooth();
  colorMode(HSB, 360);

  coastHeight = height/3;

  for (int i = 0; i < numSegs; i++)
    segs.add(new Segment(i*width/(float)numSegs, (i+1)*width/(float)numSegs, height-coastHeight));
}


void draw() {

  float numSteps = 20;
  for (int i = 0; i < numSteps; i++) {
    float cycle = (1 + sin(frameCount * 0.15 + i)/8)/(9/8.0);
    fill(35 * i/numSteps, 60, 280 + 80 * i/numSteps * cycle);
    rect(0, i/numSteps * (height - coastHeight), width, (height - coastHeight)/numSteps);
  }

  for (Segment s : segs)
    s.draw();

  for (Segment s : segs)
    s.drawAnchor();

  noStroke();
  for (int i = 0; i < numSteps; i++) {
    float cycle = (1 + sin(frameCount * 0.15 + i)/8)/(9/8.0);
    fill(200, 140, 60 + 300 * (numSteps - i)/numSteps * cycle);
    rect(0, height - coastHeight + i/numSteps * coastHeight, width, coastHeight/numSteps);
  }
}

void mouseDragged() {

  if (dragged != null) {
    dragged.anchor.x = constrain(mouseX, dragged.left.x - 4*dragged.length, dragged.right.x + 4*dragged.length);
    dragged.anchor.y = constrain(mouseY, 0, height - coastHeight);
  }
}

void mousePressed() {

  for (Segment s : segs)
    if (s.checkMouse()) {
      dragged = s; 
      break;
    }

  if (mouseButton == RIGHT && dragged != null) { 
    segs.remove(dragged);
    segs.add(dragged);
  }
}

void mouseReleased() {
  dragged = null;
}



class Segment {

  PVector left, right, anchor;
  float length;
  Generator gen;

  public Segment(float fromX, float toX, float y) {

    this.left = new PVector(fromX, y);
    this.right = new PVector(toX, y);
    this.length = toX - fromX;
    this.anchor = new PVector(fromX + this.length/2, y);
  }

  boolean checkMouse() {
    return (abs(mouseX-this.anchor.x) < 10 && abs(mouseY-this.anchor.y) < 10);
  }

  void draw() {

    int col = 0;
    float h = this.left.y - this.anchor.y;

    if (h < (height-coastHeight)/10)
      col = color(45, 100, 360);
    else if (h < (height-coastHeight)/3)
      col = color(120, 200, 240);
    else if (h < (height-coastHeight)/2)
      col = color(60, 200, 240);
    else if (h < (height-coastHeight)/1.25)
      col = color(20, 200, 200);
    else
      col = color(0, 70, 100);

    int strokeCol = 0;
    if (this.anchor.y < (height-coastHeight)/10) {
      if (this.gen == null)
        this.gen = new Generator(this.anchor.x, (height-coastHeight)-h*0.7);
      this.gen.loc.x = this.anchor.x;
      this.gen.step();
      this.gen.draw();
      strokeCol = color(30 + sin(frameCount*0.15)*30, 360, 360);
      strokeWeight(5);
    }
    else {
      this.gen = null;  
      strokeWeight(1);
    }

    for (int i = 0; i < 4; i++) {
      if (i == 0)
        stroke(strokeCol);
      else
        noStroke(); 
      fill(hue(col), saturation(col), brightness(col) + sin((1 + i)/3.0 * HALF_PI) * brightness(col)/2);
      bezier(this.left.x - this.length * 4, this.left.y, 
      this.anchor.x, this.anchor.y + i*h/4, 
      this.anchor.x, this.anchor.y + i*h/4, 
      this.right.x + this.length * 4, this.right.y);
    }
  }

  void drawAnchor() {

    if (mouseY > height - coastHeight + 10)
      return;
    noFill();
    strokeWeight(2);
    stroke(0);
    ellipse(this.anchor.x, this.anchor.y, 10, 10);
  }
}



class Generator {

  PVector loc;
  int birthrate = 1;
  int maxParticles = 30;
  float maxRad = 10;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  public Generator(float x, float y) {
    this.loc = new PVector(x, y);
  }
  
  void step() {
    
    //Create new ones:
    if (this.particles.size() < maxParticles) {
      for (int i = 0; i < this.birthrate; i++) {
        Particle p = new Particle(this.loc.x, this.loc.y, 
        random(this.maxRad/4, this.maxRad), color(0 + random(60), 360, 360));
        p.acc.add(random(-3, 3), random(-8, -5), 0);
        this.particles.add(p);
      }
    }

    //Delegate step:
    for (Particle p : this.particles)
      p.step();

    //Delete old ones:
    ArrayList<Particle> trash = new ArrayList<Particle>();  
    for (Particle p : this.particles)
      if (p.removable) 
        trash.add(p);
    for (Particle p : trash)
      this.particles.remove(p);
  }

  void draw() {
    for (Particle p : this.particles)
      p.draw();
  }
}



class Particle {

  PVector lastLoc;
  PVector loc;
  PVector speed = new PVector();
  PVector acc = new PVector();
  int col;
  float rad;
  float lifetime = 0;
  float lifetimeMax = 120*random(0.5, 1.5);
  float frictionAcc = 0.95;
  float frictionSpeed = 0.8;
  boolean removable = false;

  public Particle(float x, float y, float rad, int col) {
    this.loc = new PVector(x, y);
    this.lastLoc = this.loc.get();
    this.rad = rad;
    this.col = col;
  }

  void draw() {

    stroke(this.col);
    strokeWeight(2*this.rad);
    line(this.loc.x, this.loc.y, this.lastLoc.x, this.lastLoc.y);
  }

  void step() {

    //Save last location:
    this.lastLoc = this.loc.get();

    //Aging:
    this.lifetime++;
    if (this.lifetime >= this.lifetimeMax)
      this.removable = true;

    //Movement:
    this.acc.add(0, 0.5, 0);
    this.acc.mult(this.frictionAcc);
    this.speed.mult(this.frictionSpeed);
    this.speed.add(this.acc);
    this.loc.add(this.speed);

    if (this.lastLoc.y >= height-coastHeight)
      this.removable = true;
  }
}



