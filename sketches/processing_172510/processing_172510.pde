
/* 
Resubmission for Homework "class interaction"
By Marco Weibel
Nested for Loop credits to Kim http://www.openprocessing.org/sketch/167138
*/

PImage barryPic;
Beever[] barry = new Beever[200];

void setup() {
  size(800, 800);
  smooth();

  barryPic = loadImage("beever1.gif");

  for (int i = 0; i < barry.length; i++) {
    barry[i] = new Beever();
    barry[i].prime();
  }
}

void draw() {
  background(255);
  for (int i = 0; i <barry.length; i++) {
    barry[i].movementCollision();
    barry[i].create();

    for (int j=i; j<barry.length; j++)
    {
      if (i!=j)
      {
        float distance = dist(barry[i].xPos, barry[i].yPos, barry[j].xPos, barry[j].yPos);
        if (distance<=15 ) {
          barry[i].xPos = barry[i].xPos*10000;
          barry[i].yPos = barry[i].yPos*10000;
        }
      }
    }
  }
}


class Beever {
  float xPos, yPos;
  float xVel, yVel;

  void prime() {
    xPos = random(30, width-30);
    yPos = random(30, height-30);

    xVel = random(-5, 5);
    yVel = random(-5, 5);
  }

  void movementCollision() {
    xPos += xVel;
    yPos += yVel;

    if (xPos < 0 || xPos > width -30) {
      xVel*=-1;
    }

    if (yPos < 0 || yPos > width -30) {
      yVel*=-1;
    }
  }

  void create() {
    image(barryPic, xPos, yPos);
  }
}



