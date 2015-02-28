
// Homework 6 
// Joseph Oak © 2013

float ex, ey, ex2, ey2, ewd, eht, xspeed, yspeed, xspeed2, yspeed2, bufferwd, bufferht;
int randpos, randneg, randpos2, randneg2;

void setup(){
  size(400, 400);
  smooth();
  background(0);
  rectMode(CENTER);
  noStroke();
  frameRate(100);
  ex = width/2;
  ey = height/2;
  ex2 = width/2;
  ey2 = height/2;
  ewd = width * .25;
  eht = height * .25;
  xspeed = 0;
  yspeed = 1;
  xspeed2 = 0;
  yspeed2 = -1;
  bufferwd = ((ewd/2) + 9);
  bufferht = ((eht/2) + 9);
  randpos = int(random(1,5));
  randneg  = int(random(-4,0));
  randpos2 = int(random(1,5));
  randneg2 = int(random(-4,0));
}

void draw() {
  scrim();
  moveit2();
  circle2(ex2, ey2, ewd, eht);
  moveit();
  circle(ex, ey, ewd, eht);
}

// RANDOMLY ASSIGNS POSITION AND SPEED

void keyPressed() {
  xspeed = int(random(-4,5));
  yspeed = int(random(-4,5));
  xspeed2 = int(random(-4,5));
  yspeed2 = int(random(-4,5));
  ex = random(bufferwd, width - bufferwd);
  ey = random(bufferht, height - bufferht);
  ex2 = random(bufferwd, width - bufferwd);
  ey2 = random(bufferht, height - bufferht);
  //saveFrame("hw6.jpg");
}

// CREATES A SCRIM TO COVER THE CANVAS

void scrim() {
  noStroke();
  fill (0, 3);
  rect(width/2, height/2, width, height);
}

// CREATES A CIRCLE

void circle(float x, float y, float ewd, float eht) {
  fill(0);
  stroke(255);
  strokeWeight(7);
  ellipse(x, y, ewd, eht);
}

void circle2(float x, float y, float ewd, float eht) {
  fill(0);
  stroke(255, 100, 5);
  strokeWeight(7);
  ellipse(x, y, ewd, eht);
}

// MOVES OBJECTS

void moveit() {
  
  // SETS INITIAL SPEED
  
  ey = ey + yspeed;
  ex = ex + xspeed;
  
  // BOUNCE STATEMENTS
  
  if (ey > height - bufferht) { // BOUNCE BOTTOM
    yspeed = - yspeed;
    if (xspeed >= 0 && yspeed <= 0) { // JUDGES ANGLE OF ENTRY
      xspeed = randpos;
    }
  } if (ex > width - bufferwd) { // BOUNCE RIGHT
    xspeed = - xspeed;
    if (xspeed <= 0 && yspeed <= 0) { // JUDGES ANGLE OF ENTRY
      yspeed = randneg;
    }
  } else if (ey < bufferht) { // BOUNCE TOP
    yspeed = - yspeed;
    if (xspeed >= 0 && yspeed >= 0) { // JUDGES ANGLE OF ENTRY
      xspeed = randpos;
    }
  } else if (ex < bufferwd) { // BOUNCE LEFT
    xspeed = - xspeed;
    if (xspeed <= 0 && yspeed >= 0) { // JUDGES ANGLE OF ENTRY
      yspeed = randneg;
    }
  }
}

void moveit2() {
  
  // SETS INITIAL SPEED
  
  ey2 = ey2 + yspeed2;
  ex2 = ex2 + xspeed2;
  
  // BOUNCE STATEMENTS
  
  if (ey2 > height - bufferht) { // BOUNCE BOTTOM
    yspeed2 = - yspeed2;
    if (xspeed2 >= 0 && yspeed2 <= 0) { // JUDGES ANGLE OF ENTRY
      xspeed2 = randpos2;
    }
  } if (ex2 > width - bufferwd) { // BOUNCE RIGHT
    xspeed2 = - xspeed2;
    if (xspeed2 <= 0 && yspeed2 <= 0) { // JUDGES ANGLE OF ENTRY
      yspeed2 = randneg2;
    }
  } else if (ey2 < bufferht) { // BOUNCE TOP
    yspeed2 = - yspeed2;
    if (xspeed2 >= 0 && yspeed2 >= 0) { // JUDGES ANGLE OF ENTRY
      xspeed2 = randpos2;
    }
  } else if (ex2 < bufferwd) { // BOUNCE LEFT
    xspeed2 = - xspeed2;
    if (xspeed2 <= 0 && yspeed2 >= 0) { // JUDGES ANGLE OF ENTRY
      yspeed2 = randneg2;
    }
  } 
}



