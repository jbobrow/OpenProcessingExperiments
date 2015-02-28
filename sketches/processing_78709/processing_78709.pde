
int nb_balls = 20;
Ball[] balls = new Ball[20];

void setup() {
  size(1000, 800);
 // noCursor();
  noStroke();
  colorMode(RGB);

  for (int i=0; i < balls.length; i++) {
    int rMax = int(random(100,500));
    int rMin = int(random(5,100));
    float rX = random(width);
    float rY = random(height);
    float rR = random(rMin,rMax);

    balls[i] = new Ball(rMax, rMin, rX, rY, rR, true);
  }
}

void draw() {
  
  fill(0, 15);
  rect(0, 0, width, height);
  
  if (mousePressed) {
    for (int i=0; i < balls.length; i++) {
      balls[i].gravity = !balls[i].gravity;
      balls[i].gravityCount = 0;
    }
  }
  
  for (int i=0; i < balls.length; i++) {
    balls[i].drawBall();
  }
  



}




class Ball {
  float xPos = 0;
  float yPos = 0;
  float xOffset = 0;
  float yOffset = 0;
  float elOffset = 0;
  int MAX_EL = 0;
  int MIN_EL = 0;
  int rMin=0;
  int el=20;
  int gravityCount = 0;
  boolean gravity = true;
  int mouseCount = 0;
  int lastX = 0;
  int newX = 0; 
 



  Ball(int _MAX_EL, int _MIN_EL, float xoff, float yoff, float eloff, boolean grav) {
    this.xPos = xoff;
    this.yPos = yoff;
    this.gravity = grav;
    this.el = int(eloff);
    this.MAX_EL = _MAX_EL;
    this.MIN_EL = _MIN_EL;
    println("Ball created! " + " X-Off: " + xOffset + " Y: " + yPos + " Radius: " + el);
    
  }

  void drawBall() {
    newX = mouseX - lastX;
    xPos = int(xPos + newX + int(mouseX / 100));
    
    if(xPos > (width+(el/2))){
      xPos = 0;
    }
    
    if(xPos < (0 - (el/2))){
      xPos = width;
    }
    
    
    
    if (gravity == true) {
      if (gravityCount < 250) {
        gravityCount++;
      }

      yPos+= 0.05 * gravityCount;

      if ((yPos - (el/2)) > height) {
        yPos=0 - (el/2);
      }

      if (el < MAX_EL) {
        if ((int(yPos)%1) == 0) {
          el++;
        }
      }
    }
    else if (gravity == false) {

      if (gravityCount < 250) {
        gravityCount++;
      }

      yPos-= 0.03 * gravityCount;
      if ((yPos + (el/2)) < 0) {
        yPos = height + (el/2);
      }

      if (el > MIN_EL) {
        if ((int(yPos)%1)==0) {
          el--;
        }
      }
    }

    fill(255);
    stroke(0);
    ellipse(xPos, yPos, el, el);
    lastX=mouseX;
  }
}



