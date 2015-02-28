
/*  
 *  DLA - Crystal Simulation 
 *
 *  More Info: http://stungeye.com/archives/2007/10/usually_permane.php
 *
 *  Wally Glutton 2007
 *  http://stungeye.com
 *
 *  License: This is free and unencumbered software released into the public domain.
 *
 */

import controlP5.*;
ControlP5 controlP5; 

// Our state-machine states.
final static int RANDOM_POSITION = 0;
final static int CHECK_NEIGHBOURS = 1;
final static int MOVE_ABOUT = 2;
final static int DONE = -1;

// Some colours.
color white = color(255,255,255);
color black = color(0,0,0);
color grey  = color(150,150,150);

// Starting conditions
int num_particles = 150;
float radius = 10;

// Variable conditions
int max_particles = 1000;
float radius_increment = 0.03;

ArrayList particles;

void setup() {
  size(300,300);
  restart();
  controlP5 = new ControlP5(this);
  controlP5.addSlider("growth",0,5,3,0,height-20,width/2,14);
}

void restart() {
  background(black);
  stroke(white);
  radius = 10;

  particles = new ArrayList();
  for (int i=0; i < num_particles; i++) {
    particles.add(new Particle());
  }
  // Seed Points
  point(width/2-4,height/2-4);
  point(width/2+4,height/2+4);
  point(width/2-4,height/2+4);
  point(width/2+4,height/2-4);
}

void mousePressed() {
  if (mouseY < (height-20))
    restart();
}

void growth(int theValue) {
  switch (theValue) {
  case 0: 
    radius_increment = 0.06; 
    break;
  case 1: 
    radius_increment = 0.05; 
    break;
  case 2: 
    radius_increment = 0.04; 
    break;
  case 3: 
    radius_increment = 0.03; 
    break;
  case 4: 
    radius_increment = 0.02; 
    break;
  case 5: 
    radius_increment = 0.01; 
    break;
  }
}

void draw() {
  int num_particles = particles.size();
  loadPixels();
  for (int i = 0; i < num_particles; i++) {
    Particle p = (Particle) particles.get(i);
    p.run();
  }

  // Add points while the integer component of the radius is evenly divisible by 10.
  // Don't add past the set maximum for particles.
  if ( ((int)radius % 10 == 0) && (num_particles < max_particles) ) {
    if (odds(15) && (radius < (width/2 +20))) {
      particles.add(new Particle());
      //println("p:" + particles.size() + " r:" + radius);
    }
  }  
} 

class Particle {
  int x,y;
  int state;
  int ttl;

  Particle() {
    state = 0;
    ttl = 0;
  } 

  void run() {
    switch(state) {
      // Place a particle "randomly" within a circular band centred on mid-screen.
      // The radius of this band grows as particles are added to the crystal.
    case RANDOM_POSITION:
      // Escape the state machine if we are shooting particles out beyond the left/right edge of the window.
      if (radius > (width/2 +5)) {
        state = -1; // Maybe this should be replaced with noLoop?
        break;
      }
      float r = random(radius,radius+10);
      float theta = random(2*PI);
      x = int(r * cos(theta) + width/2);
      y = int(r * sin(theta) + height/2);
      if (p(x,y,white)) break; // Break if we "land" on a crystalized point. State doesn't change. i.e. Redo RANDOM_POSITION
      stroke(grey);
      point(x,y);
      state = CHECK_NEIGHBOURS;
      break;

      // If the particle is next to a solidified crystal point, then it too must crystalize.
      // Otherwise it should move about.
    case CHECK_NEIGHBOURS:
      if (has_neighbours(x,y)) {
        stroke(white);
        point(x,y);
        state = RANDOM_POSITION;
        radius += radius_increment;
        ttl = 0;
      } 
      else {
        stroke(black);
        point(x,y);
        state = MOVE_ABOUT;
      }
      break;

      // "Randomly" move about then check for crystalized neighbours.
    case MOVE_ABOUT:
      x = int(random(x-1,x+2));
      y = int(random(y-1,y+2));
      int x2 = x - width/2;
      int y2 = y - height/2;
      float dist = sqrt(x2*x2 +y2*y2);
      // A "gravity" of sorts. Particles which are far away from the radius or have
      // been floating around for a while are more likely to move towards mid-screen.
      if (odds(dist - radius + ttl/400)) {
        if (odds(50)) {
          if (x > width/2) x--; 
          else x++;
        } 
        else {
          if (y > height/2) y--; 
          else y++;
        }
      }
      // Don't overwrite crystalized pixels.
      if (p(x,y,white)) break;
      // If we move outside the window, set a new "random" position.
      if ((x > width) || (y > height)) {
        state = RANDOM_POSITION;
        break;
      }
      // Use perlin noise to make the moving particles shimmer.
      stroke(255*noise(x,y));
      point(x,y);
      state = CHECK_NEIGHBOURS;
      ttl++;
    } 
  } 
} 

// Returns true if pixel @ (x,y) is of color c, else false.
boolean p(int x, int y, color c) {
  if ((x < 0) || (x > width)) return false;
  if ((y < 0) || (y > height)) return false;
  if ((y*width+x) > (width * height)) return false;
  return (c == pixels[y*width+x]);
}

// Are my neighbouring pixels crystalized?
// The 8 crystalizing cases are written as 8 separate expressions to allow for experimentation.
boolean has_neighbours(int x, int y) {
  if (p(x-1,y,white)) return true;  
  if (p(x+1,y,white)) return true;  
  if (p(x,y-1,white)) return true;  
  if (p(x,y+1,white)) return true;  

  // Diagonal neighbours only cause us to crystalize 25% of the time.
  if (p(x+1,y+1,white)) return odds(25);
  if (p(x-1,y-1,white)) return odds(25);
  if (p(x-1,y+1,white)) return odds(25);
  if (p(x+1,y-1,white)) return odds(25);

  return false;
}

boolean odds(float percent) {
  float value = random(100);
  return (percent > value);
}


