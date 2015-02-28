
void setup() {
  size(400, 400);
  rectMode(CENTER);
  dir = 0;

  appleXPos = random(width);
  appleYPos = random(height);

  expandSnake();

  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = width/2;
    ypos[i] = height/2;
  }

  frameRate(150);
}

float[] xpos = new float[1];
float[] ypos = new float[1];

int trail = 10;

int dir;

int score;

float appleXPos, appleYPos;

boolean go = true;

void draw() {
  background(0);
  if (go) {
    apple();
    moveUpArray();
    move();
    changeDir();
    goThroughWalls();
    collide();
    showScore();
  } 
  else {
    startScreen();
  }
}  

void apple() {
  stroke(0, 0, 255);
  strokeWeight(14);
  point(appleXPos, appleYPos);
  stroke(255);
  strokeWeight(5);
}

void expandSnake() {
  for (int i = 0; i < 15; i++) {
    trail++;
    xpos = expand(xpos, trail);
    ypos = expand(ypos, trail);
    xpos[xpos.length-1] = xpos[xpos.length-2];
    ypos[ypos.length-1] = ypos[ypos.length-2];
  }
}

void moveUpArray() {
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
    //point(xpos[i], ypos[i]);
    rect(xpos[i], ypos[i], 1, 1);
  }
}

void move() {
  if (dir == 0) {
    xpos[xpos.length-1]++;
  } 
  else if (dir == 1) {
    ypos[ypos.length-1]++;
  } 
  else if (dir == 2) {
    xpos[xpos.length-1]--;
  } 
  else if (dir == 3) {
    ypos[ypos.length-1]--;
  }
}

void changeDir() {
  if (keyPressed) {
    if ((keyCode == UP || key == 'w') && dir != 1) {
      dir = 3;
    }
    if ((keyCode == LEFT || key == 'a') && dir != 0) {
      dir = 2;
    }
    if ((keyCode == DOWN || key == 's') && dir != 3) {
      dir = 1;
    }
    if ((keyCode == RIGHT || key == 'd') && dir != 2) {
      dir = 0;
    }
  }
}

void goThroughWalls() {
  if (xpos[xpos.length-1] >= width) {
    xpos[xpos.length-1] = 1;
  }
  if (xpos[xpos.length-1] <= 0) {
    xpos[xpos.length-1] = width-1;
  }

  if (ypos[ypos.length-1] >= height) {
    ypos[ypos.length-1] = 1;
  }
  if (ypos[ypos.length-1] <= 0) {
    ypos[ypos.length-1] = height-1;
  }
}

void collide() {
  if (dir == 0) {
    if (get((int)xpos[xpos.length-1]+5, (int)ypos[ypos.length-1]) == color(255)) {
      go = false;
    } 
    else if (get((int)xpos[xpos.length-1]+5, (int)ypos[ypos.length-1]) == color(0, 0, 255)) {
      appleXPos = random(width);
      appleYPos = random(height);
      expandSnake();
      score++;
    }
  } 

  if (dir == 1) {
    if (get((int)xpos[xpos.length-1], (int)ypos[ypos.length-1]+5) == color(255)) {
      go = false;
    } 
    else if (get((int)xpos[xpos.length-1], (int)ypos[ypos.length-1]+5) == color(0, 0, 255)) {
      appleXPos = random(width);
      appleYPos = random(height);
      expandSnake();
      score++;
    }
  } 

  if (dir == 2) {
    if (get((int)xpos[xpos.length-1]-5, (int)ypos[ypos.length-1]) == color(255)) {
      go = false;
    } 
    else if (get((int)xpos[xpos.length-1]-5, (int)ypos[ypos.length-1]) == color(0, 0, 255)) {
      appleXPos = random(width);
      appleYPos = random(height);
      expandSnake();
      score++;
    }
  } 

  if (dir == 3) {
    if (get((int)xpos[xpos.length-1], (int)ypos[ypos.length-1]-5) == color(255)) {
      go = false;
    } 
    else if (get((int)xpos[xpos.length-1], (int)ypos[ypos.length-1]-5) == color(0, 0, 255)) {
      appleXPos = random(width);
      appleYPos = random(height);
      expandSnake();
      score++;
    }
  }
}

void showScore() {
  textSize(16);
  textAlign(CENTER);
  text("SCORE : " + score, width/2, height/8);
}

void startScreen() {
  textSize(50);
  text("SCORE : " + score, width/2, height/3);
  textSize(25);
  text("- press space to restart -", width/2, height*2/3);
}

void keyReleased() {
  if (go == false) {
    if (key == ' ') {
      dir = 0;
      score = 0;
      appleXPos = random(width);
      appleYPos = random(height);      
      trail = 10;
      expandSnake();
      for (int i = 0; i < xpos.length; i++) {
        xpos[i] = width/2;
        ypos[i] = height/2;
      }
      go = true;
    }
  }
}


void reset() {
  go = true;
}



