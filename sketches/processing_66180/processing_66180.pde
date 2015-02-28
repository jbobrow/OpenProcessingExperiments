
int myXPos;
int myYPos;
int dir;
boolean goingUp;
PFont btn;

void setup() {
 
 size(500,500);
 smooth();
 
 myXPos = 250;
 myYPos = 200;
 dir = 1;
 btn = createFont("Courier",10,true);
  
}

void draw() {
  
  background(230,(myXPos-80),(myYPos/1.5));
  
  //draw buttons
  fill(30);
  rect(20,20,80,20);
  rect(20,45,80,20);
  textFont(btn,10);
  fill(255);
  text("UP/DOWN",37,33);
  text("R/L",49,58);
  
  //draw ellipse
  noStroke();
  fill(30);
  ellipse(myXPos,myYPos,30,30);
  
  //activate buttons
  if(mouseX >= 20 && mouseX <= 100 && mouseY >= 20 && mouseY <= 40) {
    
    if(mousePressed == true) {
  
    boolean goingUp = true;
  
    if(myYPos == 15) {
      dir = -dir;
    }
  
    if(myYPos == 485) {
      dir = -dir; 
    }
  
    if(goingUp) {
      myYPos -= dir;
    }
  
    }

    }
    
    
  if(mouseX >= 20 && mouseX <= 100 && mouseY >= 45 && mouseY <= 65) {
    
    if(mousePressed == true) {
  
    boolean goingUp = true;
  
    if(myXPos == 15) {
      dir = -dir;
    }
  
    if(myXPos == 485) {
      dir = -dir; 
    }
  
    if(goingUp) {
      myXPos -= dir;
    }
  
    }

    }
  
}

