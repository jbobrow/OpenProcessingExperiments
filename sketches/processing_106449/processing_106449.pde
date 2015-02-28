
int[] userXPos = new int[0];
int[] userYPos = new int[0];
int[] potatoX = {
  235, 207, 191, 170, 150, 134, 128, 125, 128, 135, 150, 169, 199, 246, 276, 302, 328, 338, 345, 353, 353, 348, 343, 328, 308, 275, 236
};
int[] potatoY = {
  75, 79, 94, 106, 140, 175, 220, 255, 299, 321, 360, 395, 419, 428, 419, 395, 370, 336, 304, 277, 240, 214, 184, 146, 112, 85, 75
};
boolean[] circleHit = new boolean[25];
boolean wins=false;
PImage circle;
int level;
int correct;
void setup() {
  circle = loadImage("circle.png");
  size(400, 400);

  for (int i=0; i < circleHit.length; i++) {
    circleHit[i] = false;
    //length=number of arrays
  }
}
void draw() {
  image(circle, 0, 0);
  for ( int i=0; i<circleHit.length; i++) {
    for (int j=0; j<userXPos.length; j++) {
      //userxpos and ypos are exactly the sa,e
      if (dist(potatoX[i], potatoY[i], userXPos[j], userYPos[j])<20) {
        circleHit[i]=true;
      }
    }

    if (mousePressed) {
      ellipse(mouseX, mouseY, 10, 10);
      userXPos = (int[])append(userXPos, mouseX);
      userYPos = (int[])append(userYPos, mouseY);
    }
    if (wins==true) {
      text("You Won!", 10, 10);
    }
  }
}
  void keyPressed() {
    for (int i=0; i<circleHit.length; i++) {
      if (circleHit[i]=true) {
        correct++;
      }
    }
    if (correct>18) {
      wins=true;
    }
  }
