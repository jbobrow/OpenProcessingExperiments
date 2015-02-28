
/*
  Copyright (C) 2007 Andre Seidelt, All Rights Reserved.
 
 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from the
 use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:
 
 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software in
 a product, an acknowledgment in the product documentation would be
 appreciated but is not required.
 
 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.
 
 3. This notice may not be removed or altered from any source distribution.
 */
final static int RAD = 20;       // radius of the arcs
final static int WIDTH = 50;     // width of the sketch in 'fields'
final static int HEIGHT = 30;    // height of the sketch in 'fields'
final static int PAUSE = 200;    // pause between iterations
final static int MAX_SEEDS = 8;  // max number of seeds
final static int STROKE = 4;     // stroke width

int[][] parts;   // matrix containing the fields
Tail[][] tails;  // matrix containing the sequences which leaded to this part

// setup sketch
void setup() {
  size(RAD*WIDTH, RAD*HEIGHT);
  frameRate(20);

  seed();
}

// draw sketch
void draw() {
  // this does not work in setup() for no reason
  ellipseMode(CENTER);
  stroke(255);
  strokeWeight(STROKE);
  noFill();
  smooth();
  
  // delay display
  delay(PAUSE);
  boolean noChange = true;

  // iterate over all parts
  for(int x = 0; x < WIDTH; x++) {
    for(int y = 0; y < HEIGHT; y++) {
      switch(parts[x][y]) {
      case 1:
        if(belowOrRight(x, y)) {
          noChange = false;
        }
        break;
      case 2:
        if(belowOrLeft(x, y)) {
          noChange = false;
        }
        break;
      case 3:
        if(aboveOrRight(x, y)) {
          noChange = false;
        }
        break;
      case 4:
        if(aboveOrLeft(x, y)) {
          noChange = false;
        }
        break;
      }
    }
  }

  // nothing added, re-seed
  if(noChange) {
    delay(PAUSE);
    seed();
  }
}

// seed a random number of tails
void seed() {
  background(0);
  parts = new int[WIDTH][HEIGHT];
  tails = new Tail[WIDTH][HEIGHT];
  int seeds = round(random(MAX_SEEDS/2,MAX_SEEDS));
  for(int i = 0; i < seeds; i++) {
    int xStart = round(random(0,WIDTH-1));
    int yStart = round(random(0,HEIGHT-1));
    int type = round(random(1,4));
    add(xStart, yStart, type, null);
  }
}

// add above or left of the current piece if allowed
// return true if a piece was added
boolean aboveOrLeft(int x, int y) {
  Tail t = tails[x][y];
  if((y-1 >= 0) && (parts[x][y-1] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(1)) {
      add(x, y-1, 1, t);
    } 
    else if(t.isAllowed(2)){
      add(x, y-1, 2, t);
    }
    return true;
  } 
  else if((x-1 >= 0) && (parts[x-1][y] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(1)) {
      add(x-1, y, 1, t);
    } 
    else if(t.isAllowed(3)){
      add(x-1, y, 3, t);
    }
    return true;
  } 
  else {
    return false;
  }
}

// add above or right of the current piece if allowed
// return true if a piece was added
boolean aboveOrRight(int x, int y) {
  Tail t = tails[x][y];
  if((y-1 >= 0) && (parts[x][y-1] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(1)) {
      add(x, y-1, 1, t);
    } 
    else if(t.isAllowed(2)){
      add(x, y-1, 2, t);
    }
    return true;
  } 
  else if((x+1 < WIDTH) && (parts[x+1][y] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(2)) {
      add(x+1, y, 2, t);
    } 
    else if(t.isAllowed(4)){
      add(x+1, y, 4, t);
    }
    return true;
  } 
  else {
    return false;
  }
}

// add below or left of the current piece if allowed
// return true if a piece was added
boolean belowOrLeft(int x, int y) {
  Tail t = tails[x][y];
  if((y+1 < HEIGHT) && (parts[x][y+1] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(3)) {
      add(x, y+1, 3, t);
    } 
    else if(t.isAllowed(4)){
      add(x, y+1, 4, t);
    }
    return true;
  } 
  else if((x-1 >= 0) && (parts[x-1][y] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(1)) {
      add(x-1, y, 1, t);
    } 
    else if(t.isAllowed(3)){
      add(x-1, y, 3, t);
    }
    return true;
  } 
  else {
    return false;
  }
}

// add below or right of the current piece if allowed
// return true if a piece was added
boolean belowOrRight(int x, int y) {
  Tail t = tails[x][y];
  if((y+1 < HEIGHT) && (parts[x][y+1] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(3)) {
      add(x, y+1, 3, t);
    } 
    else if(t.isAllowed(4)) {
      add(x, y+1, 4, t);
    }
    return true;
  } 
  else if((x+1 < WIDTH) && (parts[x+1][y] == 0)) {
    int which = round(random(0,1));
    if((which == 0) && t.isAllowed(2)) {
      add(x+1, y, 2, t);
    } 
    else if (t.isAllowed(4)) {
      add(x+1, y, 4, t);
    }
    return true;
  } 
  else {
    return false;
  }
}

// add a piece and do bookkeeping
void add(int x, int y, int type, Tail last) {
  parts[x][y] = type;
  tails[x][y] = new Tail(last, type);
  float start = 0.0;
  float end = 0.0;
  int xPos = (x+1)*RAD;
  int yPos = (y+1)*RAD;
  switch(type) {
  case 1:
    xPos += RAD/2;
    yPos += RAD/2;
    start = PI;
    end = PI+PI/2;
    break;
  case 2:
    xPos -= RAD/2;
    yPos += RAD/2;
    start = PI+PI/2;
    end = TWO_PI;
    break;
  case 3:
    xPos += RAD/2;
    yPos -= RAD/2;
    start = PI/2;
    end = PI;
    break;
  case 4:
    xPos -= RAD/2;
    yPos -= RAD/2;
    start = 0.0;
    end = PI/2;
    break;
  }

  arc(xPos, yPos, RAD, RAD, start, end);
}


