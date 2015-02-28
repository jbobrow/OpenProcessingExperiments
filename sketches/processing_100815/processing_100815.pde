
Line[] line = new Line[8];
int numLines = 2;
int currentLine;
boolean inGame;
int scoreToWin;
int countIfRoundOver;
boolean inRound;

void setup() {
  size(800, 500);
  background(0);
  colorMode(HSB);
  smooth();
  for (int i = 0; i < numLines; i++) {
    line[i] = new Line(i, 255/line.length*i);
  }
  frameRate(80);
  for (int i = 0; i < numLines; i++) {
    line[i].turnSpeed = .03/numLines;
  }
  scoreToWin = (numLines-1)*10;
}

void draw() {
  if (inGame) {
    checkGame();
    if (inRound) {
      border();
      for (int i = 0; i < numLines; i++) {
        line[i].make();
        line[i].move();
        if (line[i].alive) {
          line[i].check();
        }
        movePlayers();
        checkRound();
      }
      showStats();
    } 
    else {
      for (int i = 0; i < numLines; i++) {
        if (line[i].alive) {
          advanceRound(i);
        }
      }
    }
  } 
  else {
    loseScreen();
  }
}

void checkGame() {
  for (int i = 0; i < numLines; i++) {
    if (line[i].score == scoreToWin) {
      inGame = false;
    }
  }
}

void checkRound() {
  if (countIfRoundOver == numLines-1) {
    inRound = false;
  }
}

void advanceRound(int i) {
  background(0);
  textSize(30);
  text("Player "+(i+1)+" Wins the Round", 250, height/3);
  text("- press space to continue -", 250, height/2);
  showStats();
  if (keyPressed) {
    if (key == ' ') {
      resetVarsRound();
    }
  }
}

void loseScreen() {
  background(0);
  showStats();
  for (int i = 0; i < numLines; i++) {
    if (line[i].score == scoreToWin) {
      textSize(50);
      text("Player "+(i+1)+" Wins", 180, height*9/10);
    }
    textSize(20);
    text((i+1), 25, i*50+50);
    addPlayer();
    changeColor(i);
    setControls(i);
  }
  textSize(25);
  text("- press space to start a new game -", 575, height*15/16);
  if (keyPressed) {
    if (key == ' ') {
      resetVarsGame();
    }
  }
}

void changeColor(int i) {
  for (int j = 0; j < 255; j++) {
    stroke(j, 255, 255);
    strokeWeight(8);
    line(j+100, i*50+50, j+100, i*50+65);

    if (mousePressed) {
      if (mouseX >= 100 && mouseX <= 355
        && mouseY >= i*50+50 && mouseY <= i*50+65) {
        line[i].c = mouseX-100;
      }
    }
  }
  stroke(255);
  strokeWeight(6);
  line(100+line[i].c, i*50+45, 100+line[i].c, i*50+70);

  stroke(line[i].c, 255, 255);
  strokeWeight(7);
  line(50, i*50+55, 70, i*50+55);
}

boolean awaitingInputLeft, awaitingInputRight;
int whichSetKey;

void setControls(int i) {
  textSize(20);
  text("Left", 400, 25);
  text("Right", 450, 25);
  if (!line[i].usingArrowKeys) {
    text(line[i].leftKey, 400, i*50+55);
    text(line[i].rightKey, 450, i*50+55);
  } 
  else {
    textSize(18);
    if (line[i].leftKeyCode == 37) {
      text("LEFT", 400, i*50+55);
    }
    if (line[i].leftKeyCode == 38) {
      text("UP", 400, i*50+55);
    }
    if (line[i].leftKeyCode == 39) {
      text("RIGHT", 400, i*50+55);
    }
    if (line[i].leftKeyCode == 40) {
      text("DOWN", 400, i*50+55);
    }
    
    if (line[i].rightKeyCode == 37) {
      text("LEFT", 450, i*50+55);
    }
    if (line[i].rightKeyCode == 38) {
      text("UP", 450, i*50+55);
    }
    if (line[i].rightKeyCode == 39) {
      text("RIGHT", 450, i*50+55);
    }
    if (line[i].rightKeyCode == 40) {
      text("DOWN", 450, i*50+55);
    }
  }
  setKeys();
  if (mousePressed) {
    if (mouseX >= 390 && mouseX <= 410
      && mouseY >= i*50+50 && mouseY <= i*50+70) {
      awaitingInputLeft = true;
      whichSetKey = i;
    }

    if (mouseX >= 440 && mouseX <= 460
      && mouseY >= i*50+50 && mouseY <= i*50+70) {
      awaitingInputRight = true;
      whichSetKey = i;
    }
  }
}

void setKeys() {
  if (awaitingInputLeft) {
    stroke(200);
    strokeWeight(5);
    line(390, whichSetKey*50+70, 410, whichSetKey*50+70);
    if (keyPressed) {
      line[whichSetKey].usingArrowKeys = false;
      line[whichSetKey].leftKey = key;
      awaitingInputLeft = false;
      if (key == CODED) {
        line[whichSetKey].usingArrowKeys = true;
        line[whichSetKey].leftKeyCode = keyCode;
        awaitingInputLeft = false;
      }
    }
  }
  if (awaitingInputRight) {
    stroke(200);
    strokeWeight(5);
    line(440, whichSetKey*50+70, 460, whichSetKey*50+70);
    if (keyPressed) {
      line[whichSetKey].usingArrowKeys = false;
      line[whichSetKey].rightKey = key;
      awaitingInputRight = false;
      if (key == CODED) {
        line[whichSetKey].usingArrowKeys = true;
        line[whichSetKey].rightKeyCode = keyCode;
        awaitingInputLeft = false;
      }
    }
  }
}

void addPlayer() {
  strokeWeight(4);
  stroke(80, 255, 255);
  line(20, 0, 20, 30);
  line(20, 30, 80, 30);
  line(80, 0, 80, 30);
  stroke(0, 255, 255);
  line(90, 0, 90, 30);
  line(90, 30, 180, 30);
  line(180, 0, 180, 30);
  fill(200);
  text("add", 50, 10);
  text("remove", 135, 10);
}

void mouseReleased() {
  if (mouseX >= 14 && mouseX <= 86
    && mouseY >= 0 && mouseY <= 36) {
    if (!inGame) {
      if (numLines < line.length) {
        numLines++;
        scoreToWin = (numLines-1)*10;
      }
      for (int i = 0; i < numLines; i++) {
        if (line[i] == null) {
          line[i] = new Line(i, 255/line.length*i);
        }
      }
    }
  }
  if (mouseX >= 84 && mouseX <= 186
    && mouseY >= 0 && mouseY <= 36) {
    if (numLines > 2) {
      numLines--;
      scoreToWin = (numLines-1)*10;
    }
  }
}

void resetVarsRound() {
  inRound = true;
  countIfRoundOver = 0;
  background(0);
  for (int i = 0; i < numLines; i++) {
    line[i].xpos = random(500/4, 500*3/4);
    line[i].ypos = random(height/4, height*3/4);
    line[i].angle = random(-2*PI, 2*PI);
    line[i].alive = true;
    line[i].makingHole = true;
  }
}

void resetVarsGame() {
  inGame = true;
  countIfRoundOver = 0;
  for (int i = 0; i < numLines; i++) {
    line[i].score = 0;
    line[i].xpos = random(500/4, 500*3/4);
    line[i].ypos = random(height/4, height*3/4);
    line[i].angle = random(-2*PI, 2*PI);
    line[i].alive = true;
    line[i].makingHole = true;
    line[i].turnSpeed = .03/numLines;
  }
  scoreToWin = (numLines-1)*10;
}

void border() {
  stroke(200);
  noFill();
  rect(0, 0, 500, height);
  fill(0);
  rect(500, 0, 300, height);
}

void showStats() {
  fill(200);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Score To Win : "+scoreToWin, 675, 25);
  for (int i = 0; i < numLines; i++) {
    text("Player "+(i+1)+" : "+line[i].score, 675, i*50+75);
    stroke(line[i].c, 255, 255);
    strokeWeight(7);
    line(580, i*50+77, 600, i*50+77);
  }
}

boolean[] left = new boolean[20];
boolean[] right = new boolean[20];
int result;

void movePlayers() {
  for (int i = 0; i < numLines; i++) {
    if (left[i]) {
      line[i].moveLeft();
    }
    if (right[i]) {
      line[i].moveRight();
    }
  }
}

void keyPressed() {
  for (int i = 0; i < numLines; i++) {
    if (!line[i].usingArrowKeys) {
      if (key == line[i].leftKey)  left[i] = true;
      if (key == line[i].rightKey)  right[i] = true;
    } 
    else {
      if (keyCode == line[i].leftKeyCode)  left[i] = true;
      if (keyCode == line[i].rightKeyCode)  right[i] = true;
    }
  }
}

void keyReleased() {
  for (int i = 0; i < numLines; i++) {
    if (!line[i].usingArrowKeys) {
      if (key == line[i].leftKey)  left[i] = false;
      if (key == line[i].rightKey)  right[i] = false;
    } 
    else {
      if (keyCode == line[i].leftKeyCode)  left[i] = false;
      if (keyCode == line[i].rightKeyCode)  right[i] = false;
    }
  }
}

class Line {
  float xpos;
  float ypos;
  float angle;
  float turnSpeed;
  boolean alive;
  float c;
  boolean makingHole;
  int makeHole;
  int distToHole;
  int countDistToHole;
  int score;
  int me;
  char leftKey, rightKey;
  boolean usingArrowKeys;
  int leftKeyCode, rightKeyCode;

  Line(int _me, int _c) {
    xpos = random(500/4, 500*3/4);
    ypos = random(height/4, height*3/4);
    angle = random(-2*PI, 2*PI);
    alive = true;
    me = _me;
    c = _c;
    makingHole = true;
  }

  void make() {
    if (alive && !makingHole) {
      for (int i = 1; i < 3; i++) {
        strokeWeight(6.5-i);
        stroke(c, 255, 255, i*255/3);
        point(xpos, ypos);
      }
    }
    makeHoles();
  }

  void makeHoles() {
    if (makingHole) {
      xpos+=cos(angle);
      ypos+=sin(angle);
      movePlayers();
      makeHole++;
    }
    if (makeHole <= 7) {
      makingHole = true;
    } 
    else {
      makingHole = false;
    }
    if (countDistToHole >= distToHole) {
      distToHole = (int)random(500);
      makeHole = 0;
      countDistToHole = 0;
    }
    countDistToHole++;
  }

  void move() {
    if (alive) {
      xpos+=cos(angle);
      ypos+=sin(angle);
    }
  }

  void moveRight() {
    angle+=turnSpeed;
  }

  void moveLeft() {
    angle-=turnSpeed;
  }

  void check() {
    if (get((int)(xpos+cos(angle)*4), (int)(ypos+sin(angle)*4)) != color(0)) {
      alive = false;
      
      for (int i = 0; i < numLines; i++) {
        if (i != me) {
          if (line[i].alive) {
            line[i].score++;
          }
        }
      }
      countIfRoundOver++;
    }
  }
}



