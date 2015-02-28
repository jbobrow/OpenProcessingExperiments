
//Homework 7
//Sabrina Li
//Copyright Sabrina Li March 2013 Pittsburgh, PA

float tx, ty, td, txSpeed, tySpeed;
float cx, cy, cd, cxSpeed, cySpeed;
int gamePhase;
int startTime, gameTime;
int count;

void setup() {
  size(400, 400);
  textSize(18);
  textAlign(CENTER);
  smooth();
  noStroke();
  tx = random(width);
  ty = random(height);
  td = 50;
  txSpeed = random(6, 8);
  tySpeed = random(3, 5);
  
  cx = random(width);
  cy = random(height);
  cxSpeed = 1;
  cySpeed = 1;
  
  gamePhase = 0;
  startTime = 0;
  gameTime = 30000;
  count = 0;
}

void draw() {
  background(60, 160, 160);
  if (gamePhase == 0) {
    showInstructions();
  } else if (gamePhase == 1) {
    playGame();
  } else {
    score();
  }
}

void showInstructions() {
   text("Press any key to start the game.", width/2, 180);
}

void keyPressed() {
   if (gamePhase == 0) {
     gamePhase = 1;
     startTime = millis( );
   };
}

void playGame() {
  drawTarget(tx, ty, td);
  moveTarget();
  drawCross();
  moveCross();
  checkCollision();
  displayScore();
  displayTime();
}
  
void drawTarget(float x, float y, float d) {
  noStroke();
  fill(255);
  ellipse(tx, ty, td, td);
  fill(60);
  ellipse(tx, ty, td*.75, td*.75);
  fill(255);
  ellipse(tx, ty, td/2, td/2);
  fill(60, 160, 160);
  ellipse(tx, ty, td/4, td/4);
}

void moveTarget() {
  tx += txSpeed;
  ty += tySpeed;
  if (tx > width) {
    txSpeed = -txSpeed;
  } else if (tx < 0) {
    txSpeed = -txSpeed;
  };
  if (ty > height) {
    tySpeed = -tySpeed;
  } else if (ty < 0) {
    tySpeed = -tySpeed;
  }
}

void drawCross() {
  stroke(255, 0, 0);
  strokeWeight(2);
  line(cx-width/60, cy-width/60, cx+width/60, cy+width/60);
  line(cx-width/60, cy+width/60, cx+width/60, cy-width/60);
  if (mouseX <= 0 || mouseX >= width || mouseY <= 0 || mouseY >= height) {
    count = 0;
  }
}

void moveCross() {
  cx += cxSpeed;
  cy += cySpeed;
  if (cx > width) {
    cx = 0;
    count = 0;
  } else if (cx < 0) {
    cx = width;
    count = 0;
  };
  if (cy > height) {
    cy = 0;
    count = 0;
  } else if (cy < 0) {
    cy = height;
    count = 0;
  }
}

void mouseDragged() { //from class notes 7
  if (mouseX > pmouseX) {
    cxSpeed += .25;
  } else if (mouseX < pmouseX) {
    cxSpeed -= .25; 
  };
  if (mouseY > pmouseY) {
    cySpeed += .25;
  } else if (mouseY < pmouseY) {
    cySpeed -= .25; 
  };
}
  

void checkCollision() {
  float distance = dist(tx, ty, cx, cy);
  if (distance < td/2) {
    count++;
    background(255);
    tx = random(width);
    ty = random(height);
    td = 50;
    txSpeed = random(6, 8);
    tySpeed = random(3, 5);
  };
}

void displayScore() {
  fill(255);
  text("Hits: " + count, width/2, height*.9);
}

void displayTime() {
  fill(255);
  text("Time Played of " + gameTime/1000 + ": " + (millis()/1000), width/2, height*.8);
  if (millis() > gameTime) {
    gamePhase = 2;
  }
}

void score() {
  fill(255);
  text("Game Over", width/2, height*.2);
  if (count == 1) {
    text("You made " + count + " hit.", width/2, height*.3);
  } else {
    text("You made " + count + " hits.", width/2, height*.3);
  };
}


