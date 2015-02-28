
//Line Sketch by Henry Zhu
//August 29th, 2013
//Contact me at henry.david.zhu@gmail.com !

//Code
//Sets up beginning properties
void setup() {
  size(700, 500);
  background(255);
  fill(0);
  text("Press C to clear the screen.", 15, 20);
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

//Boolean Clear Screen 
boolean displayDrawings = false; 
//Draws Lines
void draw() {
    if(mousePressed == true)
    {
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
      line(mouseX, mouseY, x, y);
    
      //Sets the frame rate
      frameRate(90);
    }
  //Control System
  //Executes after keyReleased() checks, and resets the background
  if (displayDrawings == true) {
    background(255);
  }
}
//Checks for c button to be released
void keyReleased()
{
  if (key == 'c')
  {
    displayDrawings = !displayDrawings;
    fill(0);
    fill(30, 144, 255);
    text("Press C to clear the screen.", 15, 20);
    draw();
  }
}



