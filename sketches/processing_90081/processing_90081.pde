
int xPos;
int speed;
int yPos;
int ySpeed;
int padY;
int padX;
color leftRectColor;
color rightRectColor;

void setup() {
  smooth();
  size(500, 800);
  xPos = 240;
  speed = 4;
  yPos = 100;
  ySpeed = 3;
  leftRectColor = color(255, 255, 255);
  rightRectColor = color(255, 255, 255);
}

void draw() {
  background(0);
  if (xPos>= width || xPos <= 0) {
    speed = speed * -1   ;                  // speed*= -1; ayni
  }
  xPos+=speed;
  if (yPos <= 0) {
    ySpeed = ySpeed * -1 ;
  }
  if ( yPos >= 750 ) {
    
    
    
    
    if (xPos >= 0 && xPos <= 140 && yPos >= 750 && yPos <= 770 ) {
      if (leftRectColor == color (255, 0, 0) ) {
        ySpeed = ySpeed * -1; //bounce
      } 
      else {
        //don't bounce
      }
    }
  }





  yPos+= ySpeed;
  ellipse(xPos, yPos, 40, 40);

  fill(leftRectColor);
  rect(0, 750, 140, 20);
  fill(rightRectColor);
  rect(360, 750, 140, 20);

  if ( keyPressed == true) {   
    if ( key== 's') {
      leftRectColor = color(255, 0, 0);
    }

    if (keyPressed == true) {
      if ( key == 'k') {
        rightRectColor = color(0, 255, 0);
      }
    }
  }
  else {
    leftRectColor = color(255, 255, 255);
    rightRectColor = color(255, 255, 255);
  }
}



