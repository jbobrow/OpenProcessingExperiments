
//initializing variables
Mole topRight;
Mole topCenter;
Mole topLeft;

Mole midRight;
Mole midCenter;
Mole midLeft;

Mole bottomRight;
Mole bottomCenter;
Mole bottomLeft;

Timer timer;
boolean gameOver;

int score;
int timeLeft;

PFont f;
PImage[] hammer;

void setup() {
  size(550, 550);
  imageMode(CENTER);
  textAlign(CENTER);
  score = 0;

  f = loadFont("Quicksand-Light-48.vlw");
  fill(255);

  timer = new Timer(30);
  timer.startTimer();

  hammer = new PImage[2];
  hammer[0] = loadImage("hammer.png");
  hammer[1] = loadImage("hammerdown.png");

  topRight = new Mole(90+25, 75);
  topCenter = new Mole(250+25, 75);
  topLeft = new Mole(410+25, 75);

  midRight = new Mole(90+25, 235);
  midCenter = new Mole(250+25, 235);
  midLeft = new Mole(410+25, 235);

  bottomRight = new Mole(90+25, 395);
  bottomCenter = new Mole(250+25, 395);
  bottomLeft = new Mole(410+25, 395);
}

void draw() {
  if (gameOver == false) {
    background(0);
    noCursor();

    //timeLeft = (30 - (millis()/1000));

    timeLeft = (int) (30 - timer.passedTime);

    topRight.display();
    topCenter.display();
    topLeft.display();

    midRight.display();
    midCenter.display();
    midLeft.display();

    bottomRight.display();
    bottomCenter.display();
    bottomLeft.display();

    topRight.update();
    topCenter.update();
    topLeft.update();

    midRight.update();
    midCenter.update();
    midLeft.update();

    bottomRight.update();
    bottomCenter.update();
    bottomLeft.update();

    displayTimeScore();

    if (mousePressed) {
      image(hammer[1], mouseX, mouseY);
    }
    else {
      image(hammer[0], mouseX, mouseY);
    }
    if (timer.isFinished()) {
      midRight.moleGameOver();
    }
  } 
  else {
    //gameOver is true
    background(0);
    cursor();
    textFont(f, 48);
    text("Game Over\nScore = " + score, width/2, height/2 - 50);

    //draw replay button
    rectMode(CENTER);
    fill(255);
    rect(width/2, height-150, 150, 50);
    fill(0);
    textFont(f, 30);
    text("replay", width/2, height-140);

    fill(255);

    //if click on replay
    if (mouseX > (width/2 - 75) &&  mouseX < (width/2 + 75) && mouseY < height-150 + 25 && mouseY > height-150 - 25) {
      fill(0);
      rect(width/2, height-150, 150, 50);
      fill(255);
      textFont(f, 30);
      text("replay", width/2, height-140);
      if (mousePressed) {
        reset();
      }
    }
    //reset
  }
}

void mousePressed() {
  topRight.checkHit();
  topCenter.checkHit();
  topLeft.checkHit();

  midRight.checkHit();
  midCenter.checkHit();
  midLeft.checkHit();

  bottomRight.checkHit();
  bottomCenter.checkHit();
  bottomLeft.checkHit();
}

void displayTimeScore() {
  textFont(f, 30);
  text("Time: " + timeLeft + " Score: " + score + "\nGoal: Don't Hit X", width/2, height - 50);
}

void reset() {
  score = 0;
  timer.totalTime = 30;
  timer.startTimer();

  topRight.currentMole = 0;
  topCenter.currentMole = 0;
  topLeft.currentMole = 0;

  midRight.currentMole = 0;
  midCenter.currentMole = 0;
  midLeft.currentMole = 0;

  bottomRight.currentMole = 0;
  bottomCenter.currentMole = 0;
  bottomLeft.currentMole = 0;

  gameOver = false;
}

class Mole {
  float xPos;
  float yPos;

  PImage[] moles;
  int currentMole;

  //Timer gameTimer;
  //Timer imageTimer;

  //boolean timerStarted = false;

  // how long to stay in this currentMole
  int totalCurrentMoleTime;

  // how long have we been in this currentMole?
  int currentMoleTime;

  //constructor

  Mole(float x, float y) {
    xPos = x;
    yPos = y;

    //start it empty
    currentMole = 0;

    //load the images
    moles = new PImage[9];
    for (int i = 0; i < moles.length; i++) {
      moles[i] = loadImage("mole" + i + ".jpg");
    }

    /*//initialize the timers
     gameTimer = new Timer(30);
     imageTimer = new Timer((int) random(1, 4));*/

    resetTimers();
  }

  void resetTimers()
  {
    // pick a random amount of time to stay in this currentMole
    totalCurrentMoleTime = int(random(50, 600));

    // reset our current counter
    currentMoleTime = 0;
  }

  void update()
  {
    // increase amount of time in our current currentMole
    currentMoleTime++;

    // have we gone over our total currentMole time?
    if (currentMoleTime >= totalCurrentMoleTime)
    {
      // switch!
      if (currentMole == 0) { 
        currentMole = (int) random(0, 9);
      }
      else { 
        currentMole = 0;
      }

      // reset timers
      resetTimers();
    }
  }


  void display() {
    image(moles[currentMole], xPos, yPos);
  } 



  //hits
  void checkHit() {
    //generic
    if (dist(mouseX, mouseY, xPos, yPos) < 70) {
      //if good
      if (currentMole > 0 && currentMole < 7) {
        currentMole = 0;
        score++;
      } 
      //is evil
      else if (currentMole == 7 || currentMole == 8) {
        moleGameOver();
      }
    }
  }


  void moleGameOver() {
    gameOver = true;
  }
}

class Timer {

  int savedTime; //when timer starts
  int totalTime; //how long the timer should go for
  int passedTime;

  Timer(int time) {
    totalTime = time;
  }

  void startTimer() {
    savedTime = millis()/1000; //seconds
  }

  boolean isFinished() {
    passedTime = (millis()/1000) - savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}




