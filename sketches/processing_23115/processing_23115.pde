
//Set up
Squishy squishy;

int[] xpos = new int [25];
int[] ypos = new int [25];
    
void setup() {
  
  size (500, 500);
  noStroke();
  fill(255, 85, 0);
  frameRate(30);
  smooth();
  squishy = new Squishy(); //Initialize squishy object in setup() by call constructor


  
}



//Draw
void draw() {
 
  background(255);
  //operate Julie object
  squishy.moveInCrq();
  //squishy.makeMore();
  //squishy.deteriorate();
  //squishy.bigCrqSee();
  
}

class Squishy { 
  //Variables
  int size;
  float xpos, ypos;
  float xspeed, yspeed;
  int xdirection, ydirection;
  
  
  Squishy() {
  
  size = 60;
  xpos = width/2;
  ypos = height/2;
  
  xspeed = 2.8;
  yspeed = 2.2;
  
  xdirection = 1;
  ydirection = 1;
    
 
  }  
  
  void moveInCrq() {
    
   
    // Update the position of the shape
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    
    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width-size || xpos < 0) {
      xdirection *= -1;
    }
    if (ypos > height-size || ypos < 0) {
      ydirection *= -1;
    }
  
    // Draw the shape
    ellipse(xpos+size/2, ypos+size/2, size, size);
  
  }
  
  
  /*void bigCrqSee() {
    
    stroke(1);
    fill(255);
    ellipse(250, 250, 500, 500);
  
  }*/
  /*
    
  }
  
  //Multiply when hit wall
  void makeMore() {
    
    while
    squishyPt[][] 
    for (i = 0, i < length, i++) {
      for (j = 0, j < length, j++) {
        ellipse
  }
  
  //When reach x time turn color and deteriorate
  void deteriorate() {
  
  }*/
}

