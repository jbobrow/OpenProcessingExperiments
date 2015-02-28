
//------GLOBAL VARIABLES------
Line[] myLines = new Line[50];
boolean scramble = true;

//------SETUP------
void setup() {
  size(1000, 800);
  for (int i = 0; i < myLines.length; i++) {
    //based on my class constructor, the values for the properties are being defined here
    myLines [i] = new Line(color(random(255), random(255), random(255), random(255)), 2, 20, 0, 0, random(3), random(8));
  }
}


//------DRAW------
void draw() {
  if (scramble == true) {
    float mx = mouseX;
    float my = mouseY;
  
    pushMatrix();
    translate(width/2, height/2); //allows you to reset the starting point of the grid
    rotate(radians(45));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(90));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(135));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(180));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(225));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(270));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(315));
    theLines();
    popMatrix();
  
    pushMatrix();
    translate(width/2, height/2); 
    rotate(radians(360));
    theLines();
    popMatrix();
  }
  fill(0, 20);
  rect(0, 0, width, height);
}                                           

//------THE LineS------
void theLines() {
  for (int i = 0; i< myLines.length; i++) {
    myLines[i].display();
    myLines[i].move();
  }
}

//------CLASS------
class Line {
  color LineColor;
  float LineWidth, LineHeight;
  float posX, posY;
  float speedX, speedY;

  //Constructors (assigning values to the properties)
  Line(color theColor, float theWidth, float theHeight, float thePosX, float thePosY, float theSpeedX, float theSpeedY) {
    LineColor = theColor;
    LineWidth = theWidth;
    LineHeight = theHeight;
    posX = thePosX;
    posY = thePosY;
    speedX = theSpeedX;
    speedY = theSpeedY;
  }

  //Methods (like functions - things the objects can do)
  void display() {
    noStroke();
    fill(LineColor);
    rect(posX, posY, LineWidth, LineHeight);
  }

  void move() {
    posX = posX + speedX;
    if ( posX > width) {
      posX = 0;
    }
    posY = posY + speedX;
    if ( posY > height) {
      posY = 0;
    }
  }
}//------END OF CLASS------

//------KEYPRESS------
//pressing the key stops & continues the loop depending on the current state
void keyPressed() {
  scramble = !scramble; 
}


