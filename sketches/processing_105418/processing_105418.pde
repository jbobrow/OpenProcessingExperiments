
//Star Drawings by Henry Zhu
//August 2nd, 2013 
//Contact me at henry.david.zhu@gmail.com !

//Code
//Sets up beginning properties
void setup() {
  size(700, 500);
  background(255);
}

//Starting Positions
int x = 0;
int y = 0;

//Speeds
int xSpeed = 5;
int ySpeed = 5;

//Colors
int rColor = 0;
int gColor = 0;
int bColor = 0;

//Draws Lines
void draw() {
  //Sets restriction conditions for colors
  rColor += 7;
  if (rColor > 255) {
    rColor = 0;
  }
  gColor += 7;
  if (gColor > 255) {
    gColor = 0;
  }
  bColor += 7;
  if (bColor > 255) {
    bColor = 0;
  }
  
  //Increases the speed
  x += xSpeed;
  y += ySpeed;

  //Reverses speed under conditions
  if ( y > height ) {
    ySpeed = -ySpeed;
  }
  if (y < 0) {
    ySpeed = -ySpeed;
  } 
  if (x < 0 || x > width) {
    xSpeed = -xSpeed;
  }
  
  //Draws the lines
  stroke(rColor, gColor, bColor);
  line(x, y, 30, 30);
  
  //Sets the frame rate
  frameRate(90);
}



