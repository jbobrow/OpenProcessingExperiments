
// GLOBAL VARIABLES  ------------------------------------------------------------------

float ts = 15;  //topspeed
float m = .25;  //scale
float o = 255; //opacity
float PS = 2; //particle size
float r, g, b; //colors


// DECLARE -------------------------------------------------------
particle[] particles = new particle[1000];


void setup() {
  size(1000, 600);
  smooth();
  noCursor();
  frameRate(60);

  // INITIALIZATION -------------------------------------------------
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new particle();
  }
}

void draw() {
  noStroke();
  background(0); 

  // FUNCTIONS ------------------------------------------------------

  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].checkEdges();
    particles[i].display();
  }
}


// CLASS  -----------------------------------------------------------------------------

class particle {

  PVector loc;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  particle() {
    loc = new PVector( random(0, width), random(0, height) ); // spawns particles in these ranges
    velocity = new PVector(0, 0);
    topspeed = ts;
  }

  void update() {

    //acceleration algorithm

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);  // Find vector aiming at mouse

    dir.normalize();     // Normalize
    dir.mult(m);       // Scale 
    acceleration = dir;  // Set to acceleration

    // Velocity changes by acceleration.  loc changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    loc.add(velocity);
  }

  void display() {
    noStroke();
    fill(r, g, b, o+50);

    o = random(255);

    if ( dist(loc.x, loc.y, mouseX, mouseY) < 250 && mousePressed ) {  // glow effect will only affect within 250 radius
      PS = constrain( 8 / dist(loc.x, loc.y, mouseX, mouseY)+1, 1.5, 6 ); // closer to mouse, bigger glow
      r =  2550 / dist(loc.x, loc.y, mouseX, mouseY);
      g = constrain( dist(loc.x, loc.y, mouseX, mouseY)/2, 0, 200 );
      b = 0;
    } 
    else { // normal mode particles
      PS = 1.5;
      r = 0;
      g = constrain( dist(loc.x, loc.y, mouseX, mouseY)/2, 0, 200 );
      b = constrain( dist(loc.x, loc.y, mouseX, mouseY), 0, 255 );
    }
    rectMode(CENTER);
    rect(loc.x, loc.y, PS, PS); // primitive glow particle


    fill(255, 255, 255, o);
    rect(loc.x, loc.y, PS, PS);



    // BEHAVIOURS ------------------------------------------------------

    if (mousePressed) {  
      if (mouseButton == LEFT && dist(loc.x, loc.y, mouseX, mouseY) < 100 ) {
        m = 1; //scales more when right-clicked
      } 
      if (mouseButton == RIGHT && dist(loc.x, loc.y, mouseX, mouseY) < 100 ) {
        m = m+0.0001; //scales exponentially when center-clicked (slowly accelerates)
      }
      if (mouseButton == CENTER) {
        m = 0.1; //scales when clicked
      }
    } 
    else if (keyPressed) {  
      m = -0.1; //pushes away
    } 
    else {
      m = 0.01; //normal scale
    }

    fill(255, 255, 255, o/50);
    rect(loc.x, loc.y, PS*3, PS*3);
  }

  // BORDER BEHAVIOUR -----------------------------------------------

  void checkEdges() {  //keeps particles within the screen
    /*
   // far border
     if ( dist(width/2, height/2, loc.x, loc.y) >= width*3 ) {
     loc.x = loc.x*-1;
     loc.y = loc.y*-1;
     }
     */
    /*
    //border stop
    if (loc.x > width) {
      loc.x = width;
    } 
    else if (loc.x < 0) {
      loc.x = 0;
    }

    if (loc.y > height) {
      loc.y = height;
    }  
    else if (loc.y < 0) {
      loc.y = 0;
    }
    */
        //border infinite loop
    if (loc.x > width) {
      loc.x = 0;
    } 
    else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    }  
    else if (loc.y < 0) {
      loc.y = height;
    }
    
  }
}
