
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52378*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
Knots
by Daniel Buschek
February, 2012

Click or drag to move head of chain.
*/

float knotRad = 4;
int numKnots = 50;
Knot[] knots = new Knot[numKnots];


void setup() {

  size(800, 600);
  frameRate(30);
  smooth();
  background(0);

  colorMode(HSB, 360);
  for (int i = 0; i < numKnots; i++) {
    knots[i] = new Knot(width/2 + i*2*knotRad - (numKnots*knotRad), height/2 - knotRad, color(i * 360/numKnots, 360, 360));
  }
  colorMode(RGB, 255);
  
  for (int i = 1; i < numKnots; i++) {
    knots[i].linkWith(knots[i-1]);
  }
}


void draw() {

  noStroke();
  fill(0, 120);
  rect(0, 0, width, height);

  for (int i = 0; i < numKnots; i++)
    knots[i].draw();

  for (int i = 0; i < numKnots; i++)
    knots[i].move();
}


void mouseDragged() {
  knots[0].loc = new PVector(mouseX, mouseY);
}


void mousePressed() {
  knots[0].loc = new PVector(mouseX, mouseY);
}



class Knot {

  int col;

  PVector loc;
  PVector lastLoc;
  PVector acc = new PVector();
  PVector speed = new PVector();

  Knot link;

  float ropeLength = 2*knotRad;

  public Knot(float x, float y, int col) {
    this.loc = new PVector(x, y);
    this.lastLoc = new PVector(x, y);
    this.col = col;
  }


  void draw() {

    PVector diff = PVector.sub(this.loc, this.lastLoc);
    float dist = diff.mag();
    diff.normalize();
    diff.mult(30);
    
    strokeWeight(knotRad);
    stroke(this.col);
    line(this.loc.x, this.loc.y, this.lastLoc.x, this.lastLoc.y);

    noStroke();
    for (int i = 1; i < 4; i++) {
      fill(color(red(this.col), green(this.col), blue(this.col), 33));
      ellipse(this.loc.x, this.loc.y, i*2*knotRad, i*2*knotRad);
    }
  }


  void move() {

    this.lastLoc = this.loc.get();

    if (this.link != null) {
      PVector diff = PVector.sub(this.link.loc, this.loc);
      float dist = diff.mag();

      diff.normalize();
      diff.mult((dist-this.ropeLength)/2);
      this.acc.add(diff);
      this.acc.limit(10);
    }

    this.acc.mult(0.4);
    this.speed.mult(0.6);
    this.speed.add(this.acc);
    this.loc.add(this.speed);
  }


  void linkWith(Knot k) {
    this.link = k;
  }
}



