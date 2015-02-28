
int posY;
int posX;
boolean screenUpDown;
boolean screenLeftRight;

void setup() {
  size(600,600);
  background(0);
  
  posY = 575;
  posX = width/2;
  
  noStroke();
  smooth();
  
  screenUpDown = true;
  screenLeftRight = true;
}

void draw() {
  colorMode(HSB);
  background(50, posX/3, posY);
  
  // Boolean parameters - up and down
  if (screenUpDown == true) {
      posY = posY - 5; // move ball up to top
  } else if (screenUpDown == false) {
      posY = posY + 5; // move ball down to bottom
  } 
  
  // Boolean parameters - right and left  
  if (screenLeftRight == false) {
      posX = posX + 5;
  }
  
  
  fill(255,0,0);
  rect(0,0,50,50);
  
  
  
  // Ball movements  
  if (posY == 25) {
    screenUpDown = false;
  } else if (posY == 575) {
    screenUpDown = true;
  } 
  
  //sideways
  if(posX == 25) {
    screenLeftRight = false;
  } 
  
  // Red button
  if(mouseX > 0 && mouseX < 50 && mouseY > 0 && mouseY < 50) {
     screenLeftRight = false;
  }
  
    
  fill(posX/posY*2, posX, posY+5);  
  ellipse(posX, posY, 50,50);
  
}

