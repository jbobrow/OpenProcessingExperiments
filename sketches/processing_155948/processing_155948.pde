
int pacDiameter;
int dotDiameter;
int screenWidth;
int screenThird;

float[] dots;
int dotNumber;
float dotSpeed;
float dotReturnX;
float dotPlacementX;

boolean open;
float mouthMax;
float mouthMin;
float mouthAngle;
float mouthIncrement;


void setup() {
    pacDiameter = 250;
    dotDiameter = 50;
    screenWidth = 1000;
    screenThird = ((screenWidth / 2) / 3);
    
    dotNumber = 5;
    dots = new float[dotNumber];
    for (int i = 0; i < dotNumber; i++) {
       dots[i] = (screenWidth / 3) + (screenThird * (i + 1));
    }
    
    dotSpeed = 20;
    dotReturnX = screenWidth / 5;
    dotPlacementX = screenWidth + dotDiameter;
    
    open = false;
    mouthMax = 20;
    mouthMin = 0;
    mouthAngle = 15;
    mouthIncrement = 2;
    
    size(1000,500);
    background (0);
    frameRate(40);
    noStroke();
}

void draw() {
    //check if right key is pressed to animate    
    if (keyPressed) {
      if (keyCode == RIGHT) {
        mouthIncrement = 3;
        dotSpeed = 9.5;
      }
    }
    else {
      mouthIncrement = 0;
      dotSpeed = 0;
    }
  
    background (0);
    //Dots
    fill (255);
    
    
    for (int i = 0; i < dots.length; i++) {
      ellipse (dots[i], height / 2, dotDiameter, dotDiameter);
       if (dots[i] <= dotReturnX)
          dots[i] = dotPlacementX;
        else
          dots[i] -= dotSpeed;
    }

    //Pacman
    fill (#ffee00);
    if (open) {
          if (mouthAngle <= mouthMax) {
              mouthAngle += mouthIncrement;
          } 
          else {
              open = false;
          }
      }
      else {
          if (mouthAngle >= mouthMin) {
              mouthAngle -= mouthIncrement;
          }
          else {
              open = true;
          }
      }
      arc (width / 4, height / 2, pacDiameter, pacDiameter, radians(0 + mouthAngle), radians (360 - mouthAngle));
    
    
}


