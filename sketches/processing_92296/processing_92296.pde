
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];
PImage ship;
int shipY = 85;
int shipX = 110;
int objectCount = 6;
int level = 1;

//initialise score variable
int score;
int ballSize = 30;
boolean fire = false;

//Initialise gameOver variable
int gameOver = 0;

//int startGame;
int getRandomY() {
  return int(random(70, 710));
}

int[] ballx = { 
  800, 800, 800, 800, 800, 800
};

int[] bally = { 
  getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY()
  };


  void setup() {
    size(1000, 800);
    background(0);
    ship = loadImage("rocketShip.png");
    stroke(255);
    strokeWeight(5);
    noCursor();
    drawStars();
  }

void draw() {
  background(7, 39, 64);
  imageMode(CENTER);
  noFill();
  noStroke();
  strokeWeight(0);
  frameRate(30);
  fill(255);
  textSize(24);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Score", 40, 20);
  text(score, 40, 40);

  moveStars();
  spaceShip();
  moveShip();

  if (fire) {
    bullet(mouseY);
    fire = false;
  }
  ballFalling();
  gameFinish();
  if (score >= 10) {
    ballSize = 25;
    level = 2;
  }
  if (score >= 25) {
    ballSize = 25;
    level = 3;
  }
  if (score >= 40) {
    ballSize = 15;
    level = 4;
  }
  if (score >= 55) {
    ballSize = 15;
    level = 5;
  }
  if (score >= 65) {
    ballSize = 10;
    level = 6;
  }
  if (score >= 75) {
    ballSize = 10;
    level = 7;
  }
  if (score >= 85) {
    ballSize = 5;
    level = 8;
  }
}

//Play the game


//draw stars

void drawStars() {
  for (int i = 0;i < 100; i++) {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
  }
}

//move stars
void moveStars() {
  for (int i = 0;i < 100; i++) {
    float co = map(speed[i], 1, 5, 100, 255);
    stroke(co);
    strokeWeight(speed[i]);
    point(x[i], y[i]);

    x[i] = x[i] - speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
  }
}

//draws spaceship

void spaceShip() {
  image(ship, shipX, shipY, 134, 100);
}

//move spaceship w/ mouse
void moveShip() {
  shipY = constrain(mouseY, 60, 710);
  shipX = constrain(mouseX, 67, 400);
}

void ballFalling() { 
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(2);
  for (int i=0; i<objectCount; i++) {
    if (level == 1) {
      fill (39, 154, 240);
      ellipse(ballx[i]-=1, bally[i], ballSize, ballSize);
    }
    if (level == 2) {
      fill (229, 5, 255);
      ellipse(ballx[i]-=2, bally[i], ballSize, ballSize);
    }
    if (level == 3) {
      fill (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      ellipse(ballx[i]-=3, bally[i], ballSize, ballSize);
    }
    if (level == 4) {
      fill (232, 165, 21);
      ellipse(ballx[i]-=3, bally[i], ballSize, ballSize);
    }
    if (level == 5) {
      fill (37, 203, 55);
      ellipse(ballx[i]-=4, bally[i], ballSize, ballSize);
    }
    if (level == 6) {
      fill (7, 247, 245);
      ellipse(ballx[i]-=4, bally[i], ballSize, ballSize);
    }
    if (level == 7) {
      fill (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      ellipse(ballx[i]-=5, bally[i], ballSize, ballSize);
    }
    if (level == 8) {
      fill (214, 4, 4);
      ellipse(ballx[i]-=5, bally[i], ballSize, ballSize);
    }
  }
}

// fire mechanic
void mousePressed() {
  frameRate(18);
  {
    fire = true;
  }
  // bullet();
}

void bullet(int shotX) {
  boolean strike = false;
  if (level <=3) {
    for (int i = 0; i < objectCount; i++)
    {
      float bulletX = shipX;
      float bulletY = shipY +5;
      if ((shotX >= (bally[i]-ballSize/2)) && (shotX <= (bally[i]+ballSize/2))) {
        strike = true;
        stroke(10, 247, 35);
        strokeWeight(4);
        line(bulletX, bulletY, width, bulletY);
        ellipse(ballx[i], bally[i], 
        ballSize+25, ballSize+25);
        ballx[i] = width;
        bally[i] = getRandomY();


        // update score
        score++;
      }
    }
    float bulletX = shipX;
    float bulletY = shipY +5;
    if (strike == false)
    {
      stroke(10, 247, 35);
      strokeWeight(3);
      line(bulletX, bulletY, width, bulletY);
    }
  }
  if (level >=4) {
    for (int i = 0; i < objectCount; i++)
    {
      float bulletX = shipX;
      float bulletY = shipY +5;
      if ((shotX >= (bally[i]-ballSize/2)) && (shotX <= (bally[i]+ballSize/2))) {
        strike = true;
        stroke(10, 247, 35);
        strokeWeight(1);
        line(bulletX, bulletY, width, bulletY);
        ellipse(ballx[i], bally[i], 
        ballSize+25, ballSize+25);
        ballx[i] = width;
        bally[i] = getRandomY();


        // update score
        score++;
      }
    }
    float bulletX = shipX;
    float bulletY = shipY +5;
    if (strike == false)
    {
      stroke(10, 247, 35);
      strokeWeight(1);
      line(bulletX, bulletY, width, bulletY);
    }
  }
}


//GameOver
void gameFinish()
{
  for (int i=0; i< objectCount; i++)
  {
    if (ballx[i]<=0)
    {


      fill(color(255, 0, 0));
      fill(255, 0, 0);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      text("Well done! Your score was : "+ score, width/2, height/2 + 50);

      noLoop();
    }
  }
}



