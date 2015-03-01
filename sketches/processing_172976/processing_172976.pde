
/*
 * undulating osculations
 * by  scott_me 
 * edited by GoToLoop
 
 circles are subject to two forces: an attraction to a neighbour,
 and a force perpendicular to that one.  however, because that 
 perpendicular force is defined with a sine function, some circles want
 to travel clockwise and some counter.
 */

static final int NUM=1<<8,  //number of circle elements
                 IDX=NUM-1, 
                 DIAM=5;    //diameter of circles
static final float RATE=0.2,    //rate of attraction between neighbour circles
                   P_RATE=0.2   //rate of perpendicular force
                   LIMIT=5.0;   //preferred distance between neigbours

final PVector places[]=new PVector[NUM];

static final float[] perp=new float[NUM];
static final color[] hues=new color[NUM];

void setup() {
  size(600, 600, JAVA2D);
  smooth(8);
  noStroke();

  ellipseMode(CENTER);
  colorMode(HSB, NUM, 1, 1);

  for (int i=0; i<NUM; i++) {
    places[i]=new PVector(random(width), random(height)); //creates new circles
    perp[i]=sin(TWO_PI*i/NUM )*P_RATE;  //calculates perpendicular forces
    hues[i]=color((float) i, 1, 1);   //calculates colour of circles
  }
}

void draw() {
  background(20);
  PVector pos=places[0];

  for (int i=0; i<NUM; ) {
    display(hues[i], pos);
    move(perp[i], pos, pos=places[++i&IDX]);
  }
}

void keyTyped() {
  for (PVector p : places)
    p.set(random(width), random(height), 0);
}

void mousePressed() {
  if (mouseButton = LEFT)  keyTyped();
}

void display(color wheel, PVector place) {
  fill(wheel);
  ellipse(place.x, place.y, DIAM, DIAM);
}

void move(float right, PVector p, PVector n) {
  v=new PVector();
  v.set(n);
  v.sub(p);  //v becomes vector separating a circle from its neighbour

  float len=v.mag();
  adjust=(len-LIMIT)/len;

  v.mult(adjust*RATE);  //attraction to neighbour calculated
  p.add(v);  //attraction to neighbour is added to position

  v.normalize();
  p.add(v.y*right, -v.x*right, 0);  //perpendicular force is added to position

  p.x=constrain(p.x, DIAM, width-DIAM);  //  keeps circles  
  p.y=constrain(p.y, DIAM, height-DIAM);  //  within frame
}



