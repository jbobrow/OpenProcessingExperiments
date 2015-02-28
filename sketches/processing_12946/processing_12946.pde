
// ** 3267618 - Billy Tran - Projection Display **

// Metaphor - Sydney is a city packed like sardines

// Adapted from example 8-2 from learningprocessing.org by Daniel Shiffman

// Array of 3 car objects, 100 objects of each type
redcar[] redcar_array = new redcar[100];
greencar[] greencar_array = new greencar[100];
bluecar[] bluecar_array = new bluecar[100];

// Code setup
void setup() {
  size(600,300);
  smooth();
  frameRate(60);
  
  // Array, color, random x spawn location, random y spawn location, random speed
  for (int i = 0; i < redcar_array.length; i++ ) {
    redcar_array[i] = new redcar(color(0,0,255), random(-200,800), random(0,300), random(-3,0)); 
  }
  
   for (int j = 0; j < greencar_array.length; j++ ) {
    greencar_array[j] = new greencar(color(0,255,0), random(0,600), random(-100,300), random(-3,0)); 
  }
  
  for (int k = 0; k < bluecar_array.length; k++ ) { 
    bluecar_array[k] = new bluecar(color(255,0,0), random(-200,800), random(0,300), random(0,3)); 
  }
  
  
}

// Initialise code
void draw() {
  background(0);
  
  // Activate car behaviour and display on screen
  // Repeated for other 2 cars
  for (int i = 0; i < redcar_array.length; i++ ) {
    redcar_array[i].red_move();
    redcar_array[i].red_display();
  }
  
  for (int j = 0; j < greencar_array.length; j++ ) {
    greencar_array[j].green_move();
    greencar_array[j].green_display();
  }
  
  for (int k = 0; k < bluecar_array.length; k++ ) {
    bluecar_array[k].blue_move();
    bluecar_array[k].blue_display();
  }
}

// Car classes, all identical except for prefixes of code, size, color and direction

// Blue car, moving right to left, largest car
class bluecar { 
  color bc;
  float bx, by, bspeed;

  bluecar(color blue_c, float blue_x, float blue_y, float blue_speed) {
    bc = blue_c;
    bx = blue_x;
    by = blue_y;
    bspeed = blue_speed;
  }

  // Shape and size of car
  void blue_display() {
    rectMode(CENTER);
    fill(bc);
    rect(bx, by, 20, 10);
  }

  // Determines threshold to make car loop back to random location within parameters
  void blue_move() {
    bx = bx + bspeed;
    if (bx > width + 20) {
      bx = random(-1400, -20); // Respawn location parameters
    }
  }
}

// Red car, moving left to right, smallest car
class redcar { 
  color rc;
  float rx, ry, rspeed;

  redcar(color red_c, float red_x, float red_y, float red_speed) {
    rc = red_c;
    rx = red_x;
    ry = red_y;
    rspeed = red_speed;
  }

  void red_display() {
    rectMode(CENTER);
    fill(rc);
    rect(rx, ry, 40, 20);
  }

  void red_move() {
    rx = rx + rspeed;
    if (rx < -40) {
      rx = random(640, 1200);
    }
  }
}

// Green car, moving up
class greencar { 
  color gc;
  float gx, gy, gspeed;

  greencar(color green_c, float green_x, float green_y, float green_speed) {
    gc = green_c;
    gx = green_x;
    gy = green_y;
    gspeed = green_speed;
  }

  void green_display() {
    rectMode(CENTER);
    fill(gc);
    rect(gx, gy, 15, 25);
  }

  void green_move() {
    gy = gy + gspeed;
    if (gy < -20) {
      gy = random(400, 800);
    }
  }
}

