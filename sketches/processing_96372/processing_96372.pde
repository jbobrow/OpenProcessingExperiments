
SpaceShip myShip;
PImage ship;

import ddf.minim.*;

//initialize audio
Minim minim;
AudioSample laser;
AudioSample explosion;
AudioSample explosion2;
AudioSample explosion3;
AudioPlayer gPit;

//star array
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];


//meteorite count
int objectCount = 9;

//controls meteorite size
int ballSize = 30;

color laserColor = color(10, 247, 35);
color meteoriteColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));

//starting level
int level = 1;

//level counter
int levelCount = 1;

//run in full Screen mode
boolean sketchFullScreen() {
  return true;
}

//initialise score variable
int score;

boolean fire = false;

//Initialise gameOver variable
int gameOver = 0;

//int startGame;
int getRandomY() {
  return int(random(70, 710));
}

//meteorite array
int[] meteorX = { 
  800, 800, 800, 800, 800, 800, 800, 800, 800
};

int[] meteorY = { 
  getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY(),
};

void setup() {
  // size of sketch
  size(displayWidth, displayHeight);
  ship = loadImage("rocketShip.png");
  myShip = new SpaceShip(ship);
  //loads audio
  minim = new Minim(this);
  //loads laser sample file
  laser = minim.loadSample("laser.aiff", 256);
  //loads explosion sample file 
  explosion = minim.loadSample("explosion.aiff", 256);
  explosion2 = minim.loadSample("explosion2.aiff", 256);
  explosion3 = minim.loadSample("explosion3.wav", 256);
  //loads theme music file
  gPit = minim.loadFile("gravelPit.mp3");
  //loads ship image
  stroke(255);
  strokeWeight(5);
  noCursor();
  drawStars();
  gPit.play();
}

void draw() {
  background(7, 39, 64);
  imageMode(CENTER);
  noFill();
  noStroke();
  strokeWeight(0);
  frameRate(30);
  textSize(24);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Score", 40, 20);
  text(score, 40, 40);
  text("Shield Health", 1200, 20);
  text(myShip.healthCount, 1210, 40);
  text("%", 1250, 40);
  fill(255);
  textSize(40);
  text("Level", width/2, 50);
  text(levelCount, width/2 + 80, 50);

  moveStars();
  myShip.display();
  myShip.moveShip();
  myShip.shipHit();
  myShip.shield();

  if (fire) {
    myShip.bullet(mouseY);
    fire = false;
  }

  meteoRite();

  if (score >= 15) {
    level = 2;
    levelCount = 2;
  }
  if (score >= 30) {
    ballSize = 25;
    level = 3;
    levelCount = 3;
  }
  if (score >= 45) {
    ballSize = 20;
    level = 4;
    levelCount = 4;
  }
  if (score >= 60) {
    ballSize = 20;
    level = 5;
    levelCount = 5;
  }
  if (score >= 75) {
    ballSize = 15;
    level = 6;
    levelCount = 6;
  }
  if (score >= 90) {
    ballSize = 10;
    level = 7;
    levelCount = 7;
  }
  if (score >= 105) {
    ballSize = 6;
    level = 8;
    levelCount = 8;
  }

  gameFinish();
}

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
    if (x[i] < 0) { // if stars are less then zero
      x[i] = width; // x becomes the width, gives the illusion of wraparound
    }
  }
}

void meteoRite() { 
  stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  strokeWeight(3);
  for (int i=0; i<objectCount; i++) {
    if (level == 1) {
      fill (39, 154, 240);
      ellipse(meteorX[i]-=2, meteorY[i], ballSize, ballSize);
    }
    if (level == 2) {
      fill (229, 5, 255);
      ellipse(meteorX[i]-=3, meteorY[i], ballSize, ballSize);
    }
    if (level == 3) {
      fill (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      ellipse(meteorX[i]-=3, meteorY[i], ballSize, ballSize);
    }
    if (level == 4) {
      fill (21, 40, 232);
      ellipse(meteorX[i]-=3, meteorY[i], ballSize, ballSize);
    }
    if (level == 5) {
      fill (37, 203, 55);
      ellipse(meteorX[i]-=4, meteorY[i], ballSize, ballSize);
    }
    if (level == 6) {
      fill (int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      ellipse(meteorX[i]-=5, meteorY[i], ballSize, ballSize);
    }
    if (level == 7) {
      fill (234, 123, 12);
      ellipse(meteorX[i]-=6, meteorY[i], ballSize, ballSize);
    }
    if (level == 8) {
      fill (214, 4, 4);
      ellipse(meteorX[i]-=8, meteorY[i], ballSize, ballSize);
    }
  }
}

void mousePressed() {
  laser.trigger();
  frameRate(18);
  fire = true;
}

void gameFinish() {
  for (int i=0; i< objectCount; i++)
  {
    if (myShip.healthCount <=0 || meteorX[i]<=0)
    {

      textSize(24);
      fill(255, 0, 0);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);

      if (level == 1) {
        text("Your not really trying to hard are you?  Your Score is: "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 2) {
        text("There is no TRY, only DO!  Your Score is: "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 3) {
        text("Would you kindly, TRY HARDER! Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 4) {
        text("If you feel you are down on your luck, check the level of your effort. Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 5) {
        text("The difference between try and triumph is a little umph. Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 6) {
        text("Some people dream of success... while others wake up and work hard at it. Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 7) {
        text("You now see how deep the rabbit hole goes... Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
      if (level == 8) {
        text("FLAWLESS VICTORY. Your Score is : "+ score, width/2, height/2 + 50);
        noLoop();
        stop();
      }
    }
  }
}

void stop() {
  laser.close();
  explosion.close();
  explosion2.close();
  explosion3.close();
  minim.stop();  
  super.stop();
}

/* image array for planets, not sure how to make them move and switch in and out
 PImage[] images = new PImage[6];
 for ( int i = 0; i< images.length; i++ )
 {
 images[i] = loadImage( i + ".jpg" );   // make sure images "0.jpg" to "5.jpg" exist
 }
 
 */
class SpaceShip {
  int shipY;
  int shipX;
  int shipTint;
  boolean shipStrike;
  int healthCount;

  SpaceShip(PImage _ship) {
    shipY = 85;
    shipX = 110;
    shipTint = 275;
    shipStrike = false;
    ship = _ship;
    healthCount = 100;
  }

  void display() {
   tint(255,shipTint);
    image(ship, shipX, shipY, 134, 100);
    println (shipTint);
  }


  void moveShip() {
    shipX = constrain(mouseX, 67, 500);
    shipY = constrain(mouseY, 50, 750);
  }

  void shield() {
    if (shipTint == 275) {
      healthCount = 100;
    }
    if (shipTint == 220) {
      healthCount = 80;
    }
    if (shipTint == 165) {
      healthCount = 60;
    }
    if (shipTint == 110) {
      healthCount = 40;
    }
    if (shipTint == 55) {
      healthCount = 20;
    }
    if (shipTint == 0) {
      healthCount = 0;
    }
  }

  void shipHit() {
    boolean shipStrike = false;
    for (int i = 0; i < objectCount; i++) {
      if (( shipY+20 >= (meteorY[i]-ballSize)) && (shipY-20 <= (meteorY[i]+ballSize)) && (shipX+50 >= (meteorX[i]-ballSize)) && (shipX-50 <= (meteorX[i]+ballSize))) {
        shipStrike = true;
        explosion3.trigger();
        ellipse(meteorX[i], meteorY[i], ballSize+25, ballSize+25);      
        meteorX[i] = width;
        meteorY[i] = getRandomY();

        if (shipStrike == true) {
          myShip.shipTint -= 55;
        }
      }
    }
  }

  void bullet(int shotX) {  
    boolean strike = false;
    if (level <=3) {
      for (int i = 0; i < objectCount; i++)
      {
        float bulletX = shipX + 55;
        float bulletY = shipY-10;
        if ((shotX >= (meteorY[i]-ballSize)) && (shotX <= (meteorY[i]+ballSize))) {
          strike = true;
          explosion.trigger();
          stroke(laserColor);
          strokeWeight(6);
          line(bulletX, bulletY, width, bulletY);
          ellipse(meteorX[i], meteorY[i], 
          ballSize+25, ballSize+25);
          meteorX[i] = width;
          meteorY[i] = getRandomY();

          // update score
          score++;
        }
      }
      float bulletX = shipX+55;
      float bulletY = shipY -10;
      if (strike == false)
      {
        stroke(laserColor);
        strokeWeight(6);
        line(bulletX, bulletY, width, bulletY);
      }
    }
    if (level >=4 && level < 6) {
      for (int i = 0; i < objectCount; i++)
      {
        float bulletX = shipX+55;
        float bulletY = shipY-10;
        if ((shotX >= (meteorY[i]-ballSize)) && (shotX <= (meteorY[i]+ballSize))) {
          strike = true;
          explosion2.trigger();
          stroke(laserColor);
          strokeWeight(3);
          line(bulletX, bulletY, width, bulletY);
          ellipse(meteorX[i], meteorY[i], 
          ballSize+25, ballSize+25);
          meteorX[i] = width;
          meteorY[i] = getRandomY();


          // update score
          score++;
        }
      }
      float bulletX = shipX+55;
      float bulletY = shipY-10;
      if (strike == false)
      {
        stroke(laserColor);
        strokeWeight(3);
        line(bulletX, bulletY, width, bulletY);
      }
    }
    if (level >=6) {
      for (int i = 0; i < objectCount; i++)
      {
        float bulletX = shipX+55;
        float bulletY = shipY-10;
        if ((shotX >= (meteorY[i]-ballSize)) && (shotX <= (meteorY[i]+ballSize))) {
          strike = true;
          explosion3.trigger();
          stroke(laserColor);
          strokeWeight(4);
          line(bulletX, bulletY, width, bulletY);
          ellipse(meteorX[i], meteorY[i], 
          ballSize+25, ballSize+25);
          meteorX[i] = width;
          meteorY[i] = getRandomY();


          // update score
          score++;
        }
      }
      float bulletX = shipX+55;
      float bulletY = shipY-10;
      if (strike == false)
      {
        stroke(laserColor);
        strokeWeight(4);
        line(bulletX, bulletY, width, bulletY);
      }
    }
  }
}



