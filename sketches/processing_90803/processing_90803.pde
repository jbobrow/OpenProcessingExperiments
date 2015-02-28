
// HOMEWORK 7
// JOSEPH OAK © 2013

float halfwd, halfht, x, y, halfside, triheight, randx, randy, randint, dleft, dright;
float triright, trileft, by, px, contact, ginc, randcoorx, randcoory, prandcoorx, prandcoory; 
float d, x1, y1, x2, y2, time, accuracy, score, shotstaken, crandcoorx, crandcoory;
float xspeed, yspeed, ex, ey, randpos, randneg, bufferwd, bufferht, ewd, eht;
int trigger, randcolor1, randcolor2, randcolor3, countdown;
int phase, startTime, gameTime;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  frameRate(60);
  halfwd = (width/2);
  halfht = (height/2);
  halfside = width * .0625;
  x = width/2;
  y = height - (halfside);
  triheight = y - (halfside * sqrt(3));
  trigger = 0;
  contact = ((height * .0375)/2) + by;
  ginc = height * .108;
  randx();
  randy();
  randcolor1 = int(random(0, 255));
  randcolor2 = int(random(0, 255));
  randcolor3 = int(random(0, 255));
  score = 0;
  gameTime = 30000;
  crandcoorx = randcoorx;
  crandcoory = randcoory;
  
  ex = width/2;
  ey = height/2;
  ewd = halfside;
  eht = halfside;
  xspeed = - 4;
  yspeed = 4;
  bufferwd = (halfside * 2)/2;
  bufferht = (halfside * 2)/2;
  randpos = 4;
  randneg  = - 4;
}

void draw() {
  background( 0 );
  if ( phase == 0 ) {
    instructions( );
  }
  else if (phase == 1) {
     play();
  } else {
    score();
  }
}

// PRINTS INSTRUCTIONS
void instructions() {
  textAlign(CENTER);
  textSize(15);
  text("You have 30 seconds to hit as many red targets as possible.", halfwd, halfht * .75);
  text("Move with your mouse. Press A or Right Click to Shoot.", halfwd, halfht * .875);
  text("The score will account for both targets hit and accuracy.", halfwd, halfht);
  text("Press ENTER to start the game.", halfwd, halfht * 1.25);
}

// GAME
void play() {
  setpx();
  scrim();
  grid();
  drawtriangle();
  drawbullet();
  istriggerpressed();
  target();
  timer();
  checkTime();
}

void mousePressed() {
  if (phase == 1) {
    trigger = 1;
    shotstaken++;
  }
}

void keyPressed() {
  // STARTS/RESETS GAME
  if (keyCode == ENTER) {
    if (phase == 0 || phase == 2) {
        phase = 1;
        startTime = millis();
        score = 0;
        shotstaken = 0;
     }
  }
  // TRIGGER
    if (key == 'a') {
      trigger = 1;
      shotstaken++;
    }
}

// RESETS BULLET POSITION
void istriggerpressed() {
  if (by <= 0) {
    by = height * .8;
    trigger = 0;
  }
}

// SETS PREVIOUS X
void setpx() {
  if (trigger == 1) {
    px = px;
  } else if (trigger == 0) {
    px = x;
  }
}

// DRAWS SCRIM
void scrim() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
}

// DRAWS GRID
void grid() {
  stroke(100);
  strokeWeight(1);
  // DRAWS DIVISION LINE
  line(0, halfside * 12, width, halfside * 12);
  // DRAWS BASE
  fill(0);
  noStroke();
  rect(0, height - (halfside), width, (halfside * 2));
  stroke(255);
  line(0, height - halfside, width, height - halfside);
}

// DRAWS TRIANGLE
void drawtriangle() {
  x = mouseX;
  triright = x - halfside;
  trileft = x + halfside;
  fill(255);
  stroke(255);
  triangle(trileft , y, x, triheight, triright, y);
}

// DRAWS BULLET
void drawbullet() {
  stroke(255);
  strokeWeight(3);
  if (trigger == 1) {
    fill(255);
    noStroke();
    ellipse(px, by, 10, 10);
    by = by - 30;
  }
  calcdistance();
}

// DRAWS BOUNCING TARGET
void target() {
  moveit();
  circle(ex, ey);
  if (d <= bufferht) {
    fill(255);
    ellipse(ex, ey, halfside * 2, halfside * 2);
    randx();
    randy();
    ex = randcoorx;
    ey = halfside;
    by = height * .8;
    trigger = 0;
    score++;
    delay(50);
  }
}

void circle(float x, float y) {
  fill(255, 0, 0);
  noStroke();
  ellipse(x, y, halfside * 2, halfside * 2);
}

// CALCULATES THE DISTANCE BETWEEN THE TARGET AND THE BULLET
void calcdistance() {
  x1 = ex;
  y1 = ey;
  x2 = px;
  y2 = by;
  d = int(dist(x1, y1, x2, y2));
}

// WRITES TIME REMAINING AND SCORE ABOVE PLAYER
void timer() {
  time = gameTime/1000;
  countdown = gameTime/1000 - ((millis( ) - startTime))/1000;
  textSize(60);
  fill(255);
  if (countdown <= 20 && countdown >= 11) {
    fill(255, 255, 0);
  } else if (countdown <= 10) {
      fill(255, 0, 0);
  }
  textAlign(CENTER);
  text (countdown, x, halfside * 10.5);
  textSize(30);
  fill(255);
  text(int(score), x, halfside * 12);
}

// CHECKS GAME TIME
void checkTime() {
  if (countdown == 0) {
    phase = 2;
  }
}   

// RANDOMIZES X COORDINATE
void randx() {
  randint = int(random(0, 6));
  
  if (randint == 0) {
    randcoorx = halfside * 2;
  }
  if (randint == 1) {
    randcoorx = halfside * 4;
  }
  if (randint == 2) {
    randcoorx = halfside * 6;
  }
  if (randint == 3) {
    randcoorx = halfside * 8;
  }
  if (randint == 4) {
    randcoorx = halfside * 10;
  }
  if (randint == 5) {
    randcoorx = halfside * 12;
  }
}

// RANDOMIZES Y COORDINATE
void randy() {
  randint = int(random(1, 6));
  
  if (randint == 1) {
    randcoory = halfside * 3;
  }
  if (randint == 2) {
    randcoory = halfside * 5;
  }
  if (randint == 3) {
    randcoory = halfside * 7;
  }
  if (randint == 4) {
    randcoory = halfside * 9;
  }
  if (randint == 5) {
    randcoory = halfside * 11;
  }
}

// BOUNCE COMMANDS
void moveit() {
  
  // SETS INITIAL SPEED
  
  ey = ey + yspeed;
  ex = ex + xspeed;
  
  // BOUNCE STATEMENTS
  
  if (ey > (halfside * 12) - bufferht) { // BOUNCE BOTTOM
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

// GAME END SCREEN
void score() {
   accuracy = score/shotstaken * 100; // CALCULATES ACCURACY
   fill(255);
   textSize(15);
   textAlign(CENTER);
   text(+ int(score) + " targets hit", halfwd, halfht * .625);
   text(+ int(shotstaken) + " shots taken", halfwd, halfht * .75);
   text("You were " + int(accuracy) + "% accurate.", halfwd, halfht * .875);
   // GIVES PLAYER RANK
   if (score >= 50 && accuracy > 95) {
     fill(random(255), random(255), random(255));
     text("Rank: Legendary", halfwd, halfht * 1.125);
   } else if (score >= 40 && accuracy > 85) {
     fill(0, 255, 0);
     text("Rank: Sharpshooter", halfwd, halfht * 1.125);
   } else if (score >= 30 && accuracy > 75) {
     fill(255);
     text("Rank: Marksman", halfwd, halfht * 1.125);   
   } else if (score >= 20 && accuracy > 65) {
     fill(255, 255, 0);
     text("Rank: Scout", halfwd, halfht * 1.125);  
   } else {
     fill(255, 0, 0);
     text("Rank: Novice", halfwd, halfht * 1.125);
   }
   // PLAY AGAIN
   fill(255);
   text("Press ENTER to play again", halfwd, halfht * 1.375);
}



