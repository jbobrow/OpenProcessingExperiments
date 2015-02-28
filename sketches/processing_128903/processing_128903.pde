
// made by: Abel Jansma
// abel_jansma (at) hotmail (dot) com

//This code simulates the emergent behaviour of firefly-synchronisation.
//It uses a flowfield based off of 'the nature of code' by Daniel Shiffman.
//
//Each firefly has a period, which is the same for all, and a phase, which differs at first.
//Each firefly looks for other firing fireflies and adjusts it's phase accordingly, 
//by adding a certain amount to it's phase, thus firing more quickly that period.
//
//After enough cycles, synchronised pulses emerge, and waves become visible.
//Clicking with the mouse adds more fireflies.

ArrayList<Blinker> blinkers = new ArrayList<Blinker>();
float tOff = 0;
int period = 40;
int blinkNum = 200;
Grid flowfield = new Grid();

void setup() {
  size(1000, 500);
  smooth();
  frameRate(30);


  // blinkNum fireflies are created, with random position and phase (count)
  for (int i = 0; i<=blinkNum; i++) {
    PVector pos = new PVector(random(0, width), random(0, height));
    float count = random(0, period);
    blinkers.add(new Blinker(period, count, pos));
  }
}



void draw() {
  // a rectangle is drawn with opacity<255, so trails form behind the fireflies
  fill(0, 190);
  rect(0, 0, width, height);

  // a time-dependent flowfield is generated
  flowfield = new Grid();
  flowfield.update();
  
  // clicking adds fireflies
  if (mousePressed) {
    blinkers.add(new Blinker(period, period, new PVector(mouseX, mouseY)));
  }


  for (Blinker blinky: blinkers) {

    blinky.update(blinkers, flowfield);
    blinky.display();
  }
}


class Blinker {

  int period;      // the same for all fireflies
  float count;     // determines the phase
  PVector loc;     // firefly's location
  int state;       // state; either 0 or 1, off or on
  int duration = 5;// how many frames a pulse lasts
  float sensitivity = 0.1; // this is the variable that most determines the synchronisation-behaviour

  PVector vel = new PVector();
  PVector acc = new PVector();

  Blinker(int Period, float Count, PVector location) {

    period = Period;
    count = Count;
    loc = location;
  }


  void update(ArrayList<Blinker> Blinkers, Grid flowfield) {

    // count keeps track of the cycle, increases every frame
    count += 1;

    loc.add(vel);
    // look what flowfield-vector to listen to
    acc = flowfield.returnVec(loc);
    // weigh that vector by an arbitrary amount to make it look more dynamic
    acc.mult(random(0.1, 3.5));


    // boost is used to add the influence of other fireflies
    // every flash by another firedly adds a bit to the phase, 
    // making the current one fire more quickly
    float boost = 0;

    for (Blinker other: blinkers) {
      // for every other firefly that is on:
      if (other.getState() == 1 && other.getLoc() != loc) {
        PVector dVec = PVector.sub(loc, other.getLoc());
        float dist = dVec.mag();
        // in 3 dimensions, light falls off with 1/r^2,
        // so the influence is scaled accordingly
        float scale = float(width)/(dist*dist);


        boost += sensitivity*scale;

        // if the firefly is just behind the rest, boost is positive
        // if the firefly is just ahead of the rest, boost is negative

          if (count < period/2.0) {
          boost *= -1;
        }

        // a force to make sure the fireflies don't pile up,
        // I find this tends to happen with flowfields
        if (dist < 10) {
          dVec.mult(10/dist);
          acc.add(dVec);
        }
      }
    }

    vel.add(acc);
    acc.mult(0);
    vel.limit(8);

    // if the boost makes the phase bigger that the period, 
    // adding extra phase stops when count = period

    if (count + boost > period) {
      // I don't know why this piece of ugly code is necessary, 
      // but count = period doesn't work...
      while (count<=period) {
        count +=.1;
      }
    }
    // otherwise; add the extra phase
    else {
      count += boost;
    }

    // during the time between the count reaching period 
    // and count reaching period+duration, state = 1, firefly lights up
    if (count >= period && count <= (period + duration)) {
      state = 1;
    }
    else {
      if (state == 1) {
        count = 0;
      }
      state = 0;
    }
    wrapEdges();
  }


  void display() {
    // state off: firefly black, state on: white
    if (state == 0) {
      fill(0);
    }
    if (state == 1) {
      fill(255);
    }
    noStroke();
    ellipse(loc.x, loc.y, 4, 4);
  }


  // function to create torus-like world
  void wrapEdges() {

    if (loc.x<=0) {
      loc.x = width;
    }
    if (loc.x>width) {
      loc.x = 0;
    }
    if (loc.y<=0) {
      loc.y = height;
    }
    if (loc.y>height) {
      loc.y = 0;
    }
  }



  PVector getLoc() {
    return loc;
  }

  int getState() {
    return state;
  }
}


// I copied this code from something I made a while ago
// It is based off of Daniel Shiffman's book 'the nature of code'
// I highly recommend the book



class Grid {
  int res = 100;
  int rows = height/res + 1;
  int cols = width/res + 1;
  PVector[][] grid;


  Grid() {

    grid = new PVector[cols][rows];
    float xOff = 0;
    for (int i = 0; i < cols; i++) {
      float yOff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xOff, yOff, tOff), 0, 1, -PI, PI);
        grid[i][j] = new PVector(cos(theta), sin(theta));
        yOff += 0.1;
      }
      xOff += 0.1;
    }
  }

  PVector returnVec(PVector location) {
    int x = int(constrain(location.x/res, 0, cols-1));
    int y = int(constrain(location.y/res, 0, rows-1));
    return grid[x][y].get();
  }


  void drawvec(PVector vec, int x, int y) {

    pushMatrix();
    translate(x, y);
    rotate(vec.heading());
    stroke(255);
    line(0, 0, 10, 0);
    popMatrix();
  }
  void update() {
    
    // uncomment to display flowfield
//        for (int i = 0; i < cols; i++) {
//          for (int j = 0; j < rows; j++) {
//            drawvec(grid[i][j], i*res, j*res);
//          }
//        }
    
    tOff+= 0.1;
  }
}



