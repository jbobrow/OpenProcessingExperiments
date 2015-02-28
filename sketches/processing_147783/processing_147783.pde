
int row = 5;
int cols = 5;
Brick[] Bricks = new Brick[25];
Ball b1 = new Ball();
Paddle p1 = new Paddle();
int score = 0;
int life = 1;
int start = 1;
//PVector bLoc1 = new PVector(b1.x - b1.diameter/2, b1.y + b1.diameter/2);
//PVector bLoc2 = new PVector(b1.x + b1.diameter/2, b1.y + b1.diameter/2);
//PVector pLoc1 = new PVector(p1.x - p1.widt/2, p1.y - p1.heigh/2);
//PVector pLoc2 = new PVector(p1.x + p1.widt/2, p1.y - p1.heigh/2);
//Brick br1 = new Brick(20,30);

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
  String url = "http://i1252.photobucket.com/albums/hh579/larrywoah/BrickBreaker_zps2ae73eb1.png";
  //webImg = loadImage(url, "png");


  Bricks[0] = new Brick(50, 100);
  Bricks[1] = new Brick(110, 100);
  Bricks[2] = new Brick(170, 100);
  Bricks[3] = new Brick(230, 100);
  Bricks[4] = new Brick(290, 100);
  Bricks[5] = new Brick(350, 100);
  Bricks[6] = new Brick(410, 100);

  Bricks[7] = new Brick(50, 150);
  Bricks[8] = new Brick(110, 150);
  Bricks[9] = new Brick(170, 150);
  Bricks[10] = new Brick(230, 150);
  Bricks[11] = new Brick(290, 150);
  Bricks[12] = new Brick(350, 150);
  Bricks[13] = new Brick(410, 150);

  Bricks[14] = new Brick(50, 200);
  Bricks[15] = new Brick(110, 200);
  Bricks[16] = new Brick(170, 200);
  Bricks[17] = new Brick(230, 200);
  Bricks[18] = new Brick(290, 200);
  Bricks[19] = new Brick(350, 200);
  Bricks[20] = new Brick(410, 200);

  Bricks[21] = new Brick(50, 250);
  Bricks[22] = new Brick(230, 250);
  Bricks[23] = new Brick(410, 250);
}
void draw() {
  background(0);
  fill(255);

  if (start == 1) {

    textSize(21); 
    fill(211, 49, 50);
    text("CLICK ON THE SCREEN TO PLAY!", 80, height/2); 
    //image(webImg, 0, 0);
  } 
  else {
  }
  if (start == 0) {
    b1.create();
    p1.create();
    stroke(0);

    textSize(21); 
    fill(211, 49, 50);
    text("SCORE = " + score, 25, 50);

    if (score == 120) {
      textSize(21); 
      fill(30, 49, 255);
      text("CONGRADULATION YOU WON!", 50, 90);

    }


    if (b1.x > width || b1.x < 0) {
      b1.toLeft();
    } 

    if (b1.y > height || b1.y < 0) {
      b1.hit();
    }

    
    if (b1.x - b1.diameter/2 > p1.x - p1.widt/2 && b1.y + b1.diameter/2 > p1.y - p1.heigh/2) {
      b1.hit();
    }

    //create bricks
    for (int i = 0; i< 24; i++)
    {
      Bricks[i].isHit();
    }

    if (b1.y > p1.y + 20) {
      life = 0;
      b1.x = -20;
      b1.y = -20;
    }


    //if hit bricks bounce off
    for (int i = 0; i< 24; i++) {
      if (Bricks[i].visible == true) {
        if (b1.x + b1.diameter/2 >= Bricks[i].x + Bricks[i].widt/2 && b1.y + b1.diameter/2 >= Bricks[i].y - Bricks[i].heigh/2) {
          b1.hit();
          Bricks[i].visible = false;
          score+=5;
          powerUp((int)random(-10,10));
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
        }
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
    y = 0;
    xSpd = 2.5;
    ySpd = 3.5;
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
  boolean hit;
  boolean visible = true;

  Brick(float LocX, float LocY) {
    hit = false;
    x = LocX;
    y = LocY;
    widt = 30;
    heigh = 13;
  }

  void isHit() {
    if (visible) {
      rectMode(CENTER);
      rect(x, y, widt, heigh);
      fill(211, 49, 50);
    }
    if (!visible) {
      visible = false;
      fill(0, 0, 0);
    }
  }
}


void gameover() {
  fill(211, 49, 50);
  text("GAMEOVER!!!, press r to restart!", 40, height/2);
}

void reset() {
  life = 1;
  for (int i = 0; i< 24; i++) {
    score = 0;
    Bricks[i].visible = true;
  }
  b1.x = 150;
  b1.y = 125;
  b1.xSpd = 2.5;
  b1.ySpd = 3.5;
  b1.diameter = 14.5;
  p1.widt = 100;
  start = 1;
}
void mouseClicked() {
  start = 0;
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
