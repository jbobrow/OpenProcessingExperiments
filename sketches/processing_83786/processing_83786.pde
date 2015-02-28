
Ball [] balls = new Ball[50];

void setup() {
  size(500, 500);
  
  smooth();

  for (int i = 0; i < balls.length; i++) {

    int x = int(random(0, 500));
    int y = int(random(0, 500));

    balls [i] = new Ball(x, y, 50);
  }
}

void draw() {

  background(0);

  for(int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].grow();
  }
}

class Ball {

  int posX;
  int posY;
  int ballDiam;
  int transp;
  float myDist;

  Ball(int tempPosX, int tempPosY, int tempBallDiam) {

    posX = tempPosX;
    posY = tempPosY;
    ballDiam = tempBallDiam;
  }

  void display() {

    noStroke();
    fill(226, 114, 91, 70);
    ellipse(posX, posY, ballDiam, ballDiam);
  }

  void grow() {

    myDist = dist(mouseX, mouseY, posX, posY);
    ballDiam = int(map(myDist, 0, width, 30, 80));
//    posX = int(map(myDist, 0, width, 0, width));

  }
}



