
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52413*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
Carnival
by Daniel Buschek
February, 2012

Sit back and enjoy the show. :)
*/


Generator gen;

void setup() {
  size(800, 600, JAVA2D);
  frameRate(30);
  smooth();
  gen = new Generator(width/2, height/2);
}

void draw() {
  noStroke();
  fill(0, 60);
  rect(0, 0, width, height);
  gen.step();
  gen.draw();
}



class Generator {

  PVector loc;
  int birthrate = 10;
  int maxParticles = 300;
  float maxRad = 3;
  float fireImpulse = 5;
  float fireImpulseMax = 5;
  float startAngle = radians(0);
  float endAngle = radians(360);
  ArrayList<Particle> particles = new ArrayList<Particle>();


  public Generator(float x, float y) {
    this.loc = new PVector(x, y);
  }


  void step() {

    //Some noise-values for randomized parameter transitions:
    float rnd = noise(frameCount*0.05 + 1000, frameCount*0.05 + 1000); //Color
    float rnd2 = noise(frameCount*0.15); //Impulse, Color
    float rnd3 = noise(frameCount*0.15, frameCount*0.15); //Size
    float rnd4 = noise(frameCount*0.05); //Birthrate
    float rnd5 = noise(frameCount*0.005 + 1000); //Friction
    
    this.fireImpulse = rnd2 * this.fireImpulseMax;

    //Create new ones:
    if (this.particles.size() < maxParticles) {
      colorMode(HSB, 360);
      for (int i = 0; i < this.birthrate * rnd4; i++) {
        float angle = random(this.startAngle, this.endAngle);
        Particle p = new Particle(this.loc.x, this.loc.y, max(1, rnd3*this.maxRad), color((rnd*360 + rnd2*360)%360, 360, 360));
        p.acc.add(this.fireImpulse*cos(angle), this.fireImpulse*sin(angle), 0);
        p.frictionAcc = min(0.9, rnd5 + 0.4);
        p.frictionSpeed = min(0.9, 0.4 + rnd5 * 3);
        this.particles.add(p);
      }
      colorMode(RGB, 255);
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
  float lifetimeMax = 60*random(0.5, 1.5);
  float frictionAcc = 0.95;
  float frictionSpeed = 0.3;
  boolean removable = false;

  public Particle(float x, float y, float rad, int col) {
    this.loc = new PVector(x, y);
    this.lastLoc = this.loc.get();
    this.rad = rad;
    this.col = col;
  }

  void draw() {
    int c = color(red(this.col), green(this.col), blue(this.col), 255*(1-this.lifetime/this.lifetimeMax));
    stroke(c);
    strokeWeight(2*this.rad*(1+2*this.lifetime*log(this.lifetime)/this.lifetimeMax));
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
    this.acc.mult(this.frictionAcc);
    this.speed.mult(this.frictionSpeed);
    this.speed.add(this.acc);
    this.loc.add(this.speed);
  }
}



