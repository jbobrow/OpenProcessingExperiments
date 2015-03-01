
/* @pjs preload="deathstar.jpg, xwing.png"; */ 

PImage death;
PImage spaceship;

int numSpace = 5;
Xwing [] space = new Xwing [numSpace];



void setup () {
  size (800, 450);
  death = loadImage ("deathstar.jpg");
  spaceship = loadImage ("xwing.png");

  for (int i=0; i<numSpace; i++) {
    space[i]= new Xwing (i);
  }
}


void draw () {
  image (death, 0, 0);
  if (mousePressed) {
    for (int i=0; i<numSpace; i++) {    
      space[i].enter();
      space[i].attack();
    }
  }
}

class Xwing {
  //  float xPos, yPos;
  //  float speedX, speedY;

  float sizeX, sizeY;
  float [] xPos= new float [numSpace];
  float [] yPos= new float [numSpace];
  float [] speedX= new float [numSpace];
  float [] speedY= new float [numSpace];


  Xwing (int index) {
    sizeX = spaceship.width;
    sizeY = spaceship.height;

    for (int i=0; i<numSpace; i++) {

      xPos [i] = random (200, 600);
      yPos[i] = random (250, 450);
      speedX[i]= random (0.5, 0.8);
      speedY[i]= random (0.5, 0.8);
    }
  }

  void enter () {
    if (mousePressed) {
      for (int i=0; i<numSpace; i++) {
        image (spaceship, xPos[i], yPos[i], sizeX, sizeY);
        println ("i'm your father");
      }
    }
  }

  void attack () {
    for (int i=0; i<numSpace; i++) {
      if (sizeX>0.05 && sizeY>0.05) {
        xPos[i]= xPos[i] + speedX[i];
        yPos[i]= yPos[i] + speedY[i];
        sizeX-= 0.5;
        sizeY-= 0.5;
      } else {
        sizeX = 0;
        sizeY =0;
      }
    }
  }
}



