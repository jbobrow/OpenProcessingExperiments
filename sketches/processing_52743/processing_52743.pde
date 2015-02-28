
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52743*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
 Plankton
 by Daniel Buschek
 February 2012
 
 Click, hold or drag to apply a pushing (left mouse-button) or pulling (right mouse-button) current.
 */


float offsetBottom = 100;

int numStuff = 100;
Stuff[] stuffs = new Stuff[numStuff];

int maxBubbles = 100;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();


void setup() {

  size(800, 600);
  frameRate(30);
  smooth();
  colorMode(HSB, 360);

  for (int i = 0; i < numStuff; i++)
    stuffs[i] = new Stuff();
}


void draw() {

  if (mousePressed)
    handleMouse();

  noStroke();
  float numSteps = 20;
  for (int i = 0; i < numSteps; i++) {
    float cycle = (1 + sin(frameCount * 0.25 + i)/8)/(9/8.0);
    fill(200, 100, 360 * (numSteps - i)/numSteps * cycle);
    rect(0, i/numSteps * (height-offsetBottom), width, (height-offsetBottom)/numSteps);
  }
  fill(30, 100, 100);
  rect(0, height-offsetBottom, width, offsetBottom);

  for (int i = 0; i < numStuff; i++) {

    stuffs[i].move();
    stuffs[i].draw();
  }

  ArrayList<Bubble> trash = new ArrayList<Bubble>();
  for (Bubble b : bubbles) {
    b.move();
    b.draw();
    if (b.removable)
      trash.add(b);
  }
  for (Bubble b : trash)
    bubbles.remove(b);
}



void handleMouse() {

  PVector mv = new PVector(mouseX, mouseY);

  if (bubbles.size() < maxBubbles) {
    Bubble b;
    if (mouseButton == LEFT) {
      b = new Bubble(mouseX + random(-10, 10), mouseY + random(-10, 10));
      b.acc.add(random(-15, 15), random(-15, 15), 0);
    }
    else {
      b = new Bubble(mouseX + random(-200, 200), mouseY + random(-200, 200));
      PVector diff = PVector.sub(mv, b.loc);
      float dist = diff.mag();
      diff.normalize();
      diff.mult(10 + random(15));
      b.acc.add(diff);
    }
    bubbles.add(b);
  }

  for (int i = 0; i < numStuff; i++) {
    PVector diff = PVector.sub(stuffs[i].loc, mv);
    float dist = diff.mag();
    diff.normalize();
    diff.mult(8000/stuffs[i].mass/(dist*log(dist)));
    if (mouseButton == RIGHT) 
      diff.mult(-1);
    diff.limit(5);
    stuffs[i].acc.add(diff);
  }
}


class Stuff {

  PVector loc, speed, acc;
  float mass, rad;

  public Stuff() {
    this.loc = new PVector(width/2, height-offsetBottom - 40);
    this.speed = new PVector();
    this.acc = new PVector();
    this.rad = random(5, 25);
    this.mass = this.rad * 2;
  }

  void move() {     
    this.acc.add(0, 0.15, 0);   
    this.acc.mult(0.9);
    this.speed.mult(0.7);
    this.speed.add(this.acc);
    this.loc.add(this.speed);

    if (this.loc.x <= this.rad) { 
      this.loc.x = this.rad; 
      this.acc.x = abs(this.acc.x); 
      this.speed.x = abs(this.speed.x);
    }
    else if (this.loc.x >= width-this.rad) { 
      this.loc.x = width-this.rad; 
      this.acc.x = -abs(this.acc.x); 
      this.speed.x = -abs(this.speed.x);
    }
    if (this.loc.y >= height-this.rad-offsetBottom) { 
      this.loc.y = height-this.rad-offsetBottom; 
      this.acc.y = 0; 
      this.acc.x *= 0.4;
      this.speed.x *= 0.4;
      this.speed.y = -abs(this.speed.y);
    }
  }

  void draw() {
    fill(90, 100 + this.rad/25 * 100, 100 + 260 * (height-this.loc.y)/height);
    ellipse(this.loc.x, this.loc.y, 2*this.rad, 2*this.rad);
  }
}


class Bubble {

  PVector loc, speed, acc;
  float age, ageMax, rad;
  boolean removable;

  public Bubble(float x, float y) {
    this.loc = new PVector(x, y);
    this.speed = new PVector();
    this.acc = new PVector();
    this.rad = random(3, 10);
    this.age = 0;
    this.ageMax = 30;
    this.removable = false;
  }

  void move() {     

    this.age++;
    if (this.age >= this.ageMax)
      this.removable = true;

    PVector force = new PVector(0, -0.5);   
    this.acc.add(force);   
    this.acc.mult(0.7);
    this.speed.mult(0.8);
    this.speed.add(this.acc);
    this.loc.add(this.speed);
  }

  void draw() {
    stroke(360, 0, 360, (1-this.age/this.ageMax) * 360);
    fill(200, 60, 200 + 160 * (height-this.loc.y)/height, (1-this.age/this.ageMax) * 360);
    ellipse(this.loc.x, this.loc.y, 2*this.rad, 2*this.rad);
  }
}



