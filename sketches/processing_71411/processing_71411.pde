
//open class
class Apple {
  // Variables

  float xPos;
  float yPos;
  float xVel;
  float  yVel;
  float  gravity;
  float r;

  //Constructor
  void init() {
    xPos = random(200, width/2+100) ;
    yPos = random(80, height/2);
    r =30;
    gravity =.3;
    xVel= 2;
    r=30;
  }

  void update() {
    xPos = xPos+ xVel;
    yPos= yPos + yVel;
    yVel= yVel+ gravity;

    if ((xPos > width-14) || (xPos < 14)) {
      xVel= xVel*(-1);
    }
    if (yPos >= height-14 || yPos < 14) {

      xVel = xVel * (.9);
      yVel= yVel*(-.85);
    }
  }

  void display() {
  fill(255, 0, 0);
  stroke(0);
    ellipse(xPos, yPos, r, r);
  }
  
  // If apples are in the basket
  void inbasket() {
    // Stop it
    xVel = 0; 
    yVel=0;
    // Way off-screen
    yPos = - 1000;
  }
  
}//close class
  




