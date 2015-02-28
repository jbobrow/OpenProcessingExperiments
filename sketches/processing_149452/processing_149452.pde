
int row = 5;
int cols = 5;
Brick[] Bricks = new Brick[37];
Ball b1 = new Ball();
Paddle p1 = new Paddle();
int score = 0;
int life = 1;
int start = 1;
PImage GameOver;
PImage GameOver1;
PImage BrickBreaker;
PImage StartImage;
int resetTime;
int totalTime = 1000;
int startTime = 5;
String currentDiff;
boolean GG = false;


//y = m1(rx-rx1)+y1 for line 1
//y = ((xc - x ) / m1) + yc for line 2
//if x3,y3 > radius of ball it collides
// line1 | y = m1(x-x1)+y1
// line2 | y = ( (xc - x) /m1 +) + yc
// x3 = x1 + ((xc - x1) / m1^2) + ((yc -y1)/m1)
// y3 = m1(x3-x1)+y1

void setup() {
  size(450, 800);
  noCursor();
  smooth();
  GameOver = loadImage("FeroWin.png");
  GameOver1 = loadImage("GameOver1.png");
  StartImage = loadImage("Start.png");
  BrickBreaker = loadImage("BrickBreaker.png");
  resetTime = millis();

  Bricks[0] = new Brick(50, 100);
  Bricks[1] = new Brick(50, 150);
  Bricks[2] = new Brick(50, 200);
  Bricks[3] = new Brick(50, 250);
  Bricks[4] = new Brick(50, 300);
  Bricks[5] = new Brick(50, 350);
  Bricks[6] = new Brick(50, 400);

  Bricks[7] = new Brick(170, 100);
  Bricks[8] = new Brick(170, 150);
  Bricks[9] = new Brick(170, 200);
  Bricks[10] = new Brick(170, 250);
  Bricks[11] = new Brick(170, 300);
  Bricks[12] = new Brick(170, 350);
  Bricks[13] = new Brick(170, 400);

  Bricks[14] = new Brick(290, 100);
  Bricks[15] = new Brick(290, 150);
  Bricks[16] = new Brick(290, 200);
  Bricks[17] = new Brick(290, 250);
  Bricks[18] = new Brick(290, 300);
  Bricks[19] = new Brick(290, 350);
  Bricks[20] = new Brick(290, 400);

  Bricks[21] = new Brick(50, 350);
  Bricks[22] = new Brick(170, 350);
  Bricks[23] = new Brick(290, 350);
  Bricks[24] = new Brick(50, 130);
  Bricks[25] = new Brick(170, 130);
  Bricks[26] = new Brick(290, 130);
  Bricks[27] = new Brick(50, 370);
  Bricks[28] = new Brick(170, 370);
  Bricks[29] = new Brick(290, 370);
  
  Bricks[30] = new Brick(410, 100);
  Bricks[31] = new Brick(410, 150);
  Bricks[32] = new Brick(410, 200);
  Bricks[33] = new Brick(410, 250);
  Bricks[34] = new Brick(410, 300);
  Bricks[35] = new Brick(410, 350);
  Bricks[36] = new Brick(410, 400);
}
void draw() {
  background(0);
  fill(255);

  if (start == 1) {

    textSize(21); 
    fill(211, 49, 50);

    image(BrickBreaker, 75, 0);
    image(StartImage, 0, 500);
  } 
  else if (start ==2) {
    textSize(21);
    text("b for easy", 190, 300 );
    text("h for hard", 190, 450 );
    text("i for insane", 180, 650 );
    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        b1.xSpd = 3.5;
        b1.ySpd = 3.5;
        currentDiff = "Easy";
        start =0;
      }
      if (key == 'h' || key == 'H') {
        b1.xSpd = 7;
        b1.xSpd = 7;
        currentDiff = "Hard";
        start = 0;
      }
      if (key == 'i' || key == 'I') {
        b1.xSpd = 14;
        b1.xSpd = 14;
        currentDiff = "Insane";
        start = 0;
      }
    }
  }
  if (start == 0) {
    int passedTime = millis() - resetTime;
    if (startTime != 0 ) {
      text("Ready in : " + startTime, 200, 250);
    }
    if (passedTime > totalTime) {
      startTime--;
      resetTime = millis();
    }
  }
  if (startTime == 0) {
    totalTime = 99999999;
    b1.create();
    p1.create();
    stroke(0);

    textSize(21); 
    fill(211, 49, 50);
    text("SCORE = " + score, 25, 50);

    textSize(21);
    text("Difficulty: " + currentDiff, 230, 760);

    if (score == 180) {
      textSize(21); 
      fill(30, 49, 255);
      text("CONGRATULATION YOU WON!", 70, 90);
    }


    if (b1.x > width || b1.x < 0) {
      b1.toLeft();
    } 

    if (b1.y > height || b1.y < 0) {
      b1.hit();
    }


    //when hit right side of paddle

    if (b1.x + b1.diameter/2 >= p1.x + p1.widt/2 && b1.y + b1.diameter/2 > p1.y - p1.heigh/2) {
      b1.hit();
    }

    //when hit left side of paddlel
    if (b1.x - b1.diameter/2 > p1.x - p1.widt/2 && b1.y + b1.diameter/2 > p1.y - p1.heigh/2) {
      b1.hit();
    }

    //create bricks
    for (int i = 0; i< 37; i++)
    {
      Bricks[i].create();
    }

    if (b1.y > p1.y + 20) {
      life = 0;
      b1.x = -20;
      b1.y = -20;
    }


    //if hit bricks left/top/bottom/right side the ball will bounce off
    for (int i = 0; i< 37; i++) {
      //left side
      if (Bricks[i].visible == true) {
        if (b1.x + b1.diameter/2 >= Bricks[i].x && b1.y >= Bricks[i].y && b1.y <= Bricks[i].y + Bricks[i].heigh && b1.x + b1.diameter/2 <= Bricks[i].x + Bricks[i].widt) {
          b1.hit();
          Bricks[i].destroy();
          score+=5;
          if (currentDiff == "Insane") {
            powerUp((int)random(-10, 10));
          }
        }

        //rightside
        if (b1.x +b1.diameter/2 >= Bricks[i].x + Bricks[i].widt&& b1.y >= Bricks[i].y && b1.y <= Bricks[i].y + Bricks[i].heigh && b1.x - b1.diameter/2 <= Bricks[i].x + Bricks[i].widt ) {
          b1.hit();
          Bricks[i].destroy();
          score+=5;
          if (currentDiff == "Insane") {
            powerUp((int)random(-10, 10));
          }
        }

        //top
        if (b1.y - b1.diameter / 2 <= Bricks[i].y + Bricks[i].heigh && b1.x >= Bricks[i].x && b1.y + b1.diameter / 2 >= Bricks[i].y && b1.x <= Bricks[i].x + Bricks[i].widt) {
          b1.hit();
          Bricks[i].destroy();
          score+=5;
          if (currentDiff == "Insane") {
            powerUp((int)random(-10, 10));
          }
        }

        //bottom
        if (b1.y - b1.diameter / 2 >= Bricks[i].y && b1.x >= Bricks[i].x && b1.y - b1.diameter / 2 <= Bricks[i].y+ 6 && b1.x <= Bricks[i].x + Bricks[i].widt ) {
          b1.hit();
          Bricks[i].destroy();
          score+=5;
          if (currentDiff == "Insane") {
            powerUp((int)random(-10, 10));
          }
        }
      }
    }
  }

  //if life is below 1 game over.
  if (life < 1 ) {
    gameover();
  }

  if (keyPressed) {
    if (life < 1) {
      if (key == 'r' || key == 'R') {
        reset();
        b1.hit();
      }
    }
  }
}


class Ball {
  float x;
  float y;
  float xSpd;
  float ySpd;
  float diameter;
  Ball() {
    x = 150;
    y = (int)(random(500, 600));
    xSpd = 5;
    ySpd = 5;
    diameter = 14.5;
  }

  void create() {
    if (life > 0 ) {
      ellipseMode(CENTER);
      ellipse(x, y, diameter, diameter);
      fill(165);

      x += xSpd;
      y += ySpd;
    }
  }

  //change ball direction
  void toRight() {
    xSpd *= -1;
  }

  //same as above
  void toLeft() {
    xSpd *= -1;
  }

  //when ball exceed ...
  void hit() {
    ySpd *= -1;
  }
}


class Paddle {
  float x;
  float y;
  float widt;
  float heigh;

  Paddle() {
    x = width/2;
    y = 730;
    widt = 100;
    heigh = 10;
  }

  void create() {
    x = mouseX;
    fill(255, 255, 255);
    rectMode(CENTER);
    rect(x, y, widt, heigh);
  }
}


class Brick {
  float x;
  float y;
  float widt;
  float heigh;
  int r;
  int g;
  int b;
  boolean hit = false;
  boolean visible = true;

  Brick(float LocX, float LocY) {
    hit = false;
    x = LocX;
    y = LocY;
    widt = 30;
    heigh = 13;
  }

  void create() {
    if (visible) {
      rect(x, y, widt, heigh);
      fill(211, 49, 50);
    }
  }

  void destroy() {
    visible = false;
    fill(0, 0, 0);
  }
}


void gameover() {
  fill(211, 49, 50);
  background(0, 0, 0);
  image(GameOver, 0, 500);
  image(GameOver1, 0, 0);
  text("Sorry son! Press R to retry", 40, height/2);
  start = 0;
}

void reset() {
  life = 1;
  for (int i = 0; i< 37; i++) {
    score = 0;
    Bricks[i].visible = true;
  }
  b1.x = 150;
  b1.y = (int)(random(500, 600));
  if(currentDiff == "Easy") {
  b1.xSpd = 3.5;
  b1.ySpd = 3.5;
  } else if(currentDiff == "Hard") {
  b1.xSpd = 7;
  b1.ySpd = 7;
  } else {
  b1.xSpd = 14;
  b1.ySpd = 14;
  }
  p1.widt = 100;
  GG = true;
  start = 0;
}


void mouseClicked() {
  if (GG == false) {
    start = 2;
    GG = true;
  }
}

void powerUp(int i) {
  if (i == 10) {
    p1.widt += 10;
  }
  if (i == -1 ) {
    while (p1.widt > 50) {
      p1.widt -= 10;
    }
  }
}



