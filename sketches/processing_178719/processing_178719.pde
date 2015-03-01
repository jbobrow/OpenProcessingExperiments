
Ball[] planets;
Ball sun;

//these variables effect the the whole thing
float G = 75; //the gravitational constant
float jump = 150;
int jumpGap = 30;
float sunWeight = 50;

/*determines if we can start drawing or not.
we don't draw until the sun is at the final and stable position. */
boolean canDraw = false;


void setup() {
  size(320, 400);
  background(255); //totally white background.


  //initialize the objects
  sun = new Ball((width/2)-50, height/2, sunWeight); 
  /*first we take the sun 50 pixels left to the center.
  and finally we place it at the center*/
  
  planets = new Ball[15];

  for (int i= 0; i<planets.length; i++) {
    planets[i] = new Ball(random(0, width), random(0, height), 5);
  }
}

void draw() {
  /*loop over the planets. calculate the force according to gravitational
  formula,apply it and display them. */
  for ( int i = 0; i<planets.length; i++) {
    PVector f = planets[i].attract(sun);
    planets[i].applyForce(f);
    planets[i].update();
    if (canDraw) planets[i].display();
  }


  /*for some moments, we keep moving the sun so we get elliptical pathway
  of the planets instead of straight line.*/
  if (frameCount ==jumpGap) {
    sun.loc.x+=jump;
    sun.loc.y+=jump;
  } else if ( frameCount == jumpGap*2) {
    sun.loc.x+=jump;
    sun.loc.y-=jump;
  } else if (frameCount == jumpGap*3) {
    sun.loc.x = width/2;
    sun.loc.y = height/2;
    canDraw = true;
  }
  
}

void mousePressed() {
  reset();
}

void reset() {
  /*we draw a white rectangle to erase everything and initialize
  the planets again with random position and color.*/
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  for (int i= 0; i<planets.length; i++) {
    planets[i] = new Ball(random(0, width), random(0, height), 5);
  }
  //again we stop drawing
  frameCount = 0;
  canDraw = false;
}

class Ball {
  PVector loc; //location
  PVector vel; //velocity
  PVector ac; //acceleration
  float mass; //mass
  PVector pLoc; //previous location
  color c;

  Ball(float x, float y, float m) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    ac = new PVector(0, 0);
    mass = m;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  void update() {
    vel.add(ac);
    pLoc = loc.get();
    loc.add(vel);
    ac.mult(0);
  }

  void display() {
    strokeWeight(.3);
    stroke(c);
    line(pLoc.x, pLoc.y, loc.x, loc.y);
  }

  void applyForce(PVector f) {

    ac.add(PVector.div(f, mass));
  }

  PVector attract( Ball b) {

    PVector f = PVector.sub(b.loc, loc);
    float dist = f.mag();
    dist = constrain(dist, 5, 25);
    f.normalize();
    float strength = (G*mass*b.mass)/(dist*dist);
    f.mult(strength);

    return f;
  }
}



