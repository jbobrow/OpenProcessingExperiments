
Button[] buttonArray = new Button[5];

void setup() {

  size(500, 500);
  smooth();
  noStroke();
  
  for(int i=0; i<buttonArray.length; i++) {
    
    float tone = map(i, 0, buttonArray.length, 100, 255);
    buttonArray[i] = new Button((i+1*100)/(i+1), color(tone));
  }
  
  
}

void draw() {
  
  background(15, 10, 22);

  for(int i=0; i<buttonArray.length; i++) {
    
    buttonArray[i].drawbutton();
    buttonArray[i].collision();
    buttonArray[i].update();
  }
  
}

void mousePressed() {
  for(int i=0; i<buttonArray.length; i++) {
    buttonArray[i].mouseCheck();
  }
}


class Button {

  int buttonSize;
  color buttonColor;
  float buttonX; 
  float buttonY; 
  float xSpeed;
  float ySpeed;
  float xSpeedRestore;
  float ySpeedRestore;
  float rad;
  boolean buttonClicked;
 
  
  Button (int inputButtonSize, color inputButtonColor) {
  
    buttonSize = inputButtonSize;
    buttonColor = inputButtonColor;
    
    buttonX = random(buttonSize, 500-buttonSize); // why dont width & height work here? 
    buttonY = random(buttonSize, 500-buttonSize);
    
    xSpeed = random(-5,5);
    ySpeed = random(-5,5);
    xSpeedRestore = xSpeed;
    ySpeedRestore = ySpeed;
    
    buttonClicked = false;
    
    rad = buttonSize/2;
  }
  
  
  
  void drawbutton() {
    
    if (buttonClicked) {
      fill(210, 210, 255, 200);
      } else {
      fill(230, 230, 255, 200);
      }
      ellipse(buttonX, buttonY, buttonSize, buttonSize);
  }
  
  void update() {
        
    buttonX += xSpeed;
    buttonY += ySpeed;
 }

  
  void collision() {
      
    if (buttonX > width-rad || buttonX < rad) {    
      xSpeed = -xSpeed;
    }
    if (buttonY > height-rad || buttonY < rad) {    
      ySpeed = -ySpeed;
    }   
  }
  
  void mouseCheck() {
    
   if ((abs(dist(mouseX, mouseY, buttonX, buttonY))) < rad) {
      buttonClicked = !buttonClicked;
    }
   if (buttonClicked) {
      xSpeed = 0;
      ySpeed = 0;
   } 
   if ((xSpeed == 0 && ySpeed == 0) && buttonClicked == false) { //if false because of if statement order within mouseCheck
        xSpeed = random(-xSpeedRestore, xSpeedRestore);
        ySpeed = random(-ySpeedRestore, ySpeedRestore);
   } 
  }
   
}




