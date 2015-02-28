
//All hail Daniel Shiffman!
//Used one of Daniel's code as base and adapted it, still need more explanation on this.  

//Declare variables
int x;
int y;
int xVel;
int yVel;

//Setup Function
void setup() {
  size(500,500);
  x = 0;
  y = 0;
  xVel = 2;
  yVel = 2;
  
}

//Draw Function
void draw() {
  background(255); 
  
  y = x + yVel;
  x = y + xVel;
  
  if ( y > 475  || y < 0 ) { 
   yVel = yVel * -1;
  }
  
  else 
  
  if ( x > 0  || x < 475 ) { 
   xVel = xVel * -1;
  }
  
  fill(255,0,0); 
  ellipse(x, y, 50, 50); 
}

// Code i used as refrence

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 5-6: Bouncing Ball
//int x = 0;
//int speed = 1;

//void setup() {
  //size(200,200);
  //smooth();
//}

//void draw() {
  //background(255);

  // Add the current speed to the x location.
  //x = x + speed;

  // Remember, || means "or."
  //if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    //speed = speed * -1;
  //}

  // Display circle at x location
  //stroke(0);
  //fill(175);
  //ellipse(x,100,32,32);
//}
