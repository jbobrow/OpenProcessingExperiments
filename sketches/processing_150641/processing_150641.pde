
/* Rotating Lines with Alpha changes 
   by R Knight (01-06-2014)
   'q' saves the screen image and then quits
   's' saves the screen image
   'c' clears the screen image
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// declare global variables
boolean quitFlag, saveFlag;

int NumberOfLines = 2; // set how many lines you want drawn
int maximumAlpha = 32; // set this to declare how opaque the lines will be
int lineSaturation = 128; // set the saturation level for the lines (mode HSB)
int lineBrightness = 128; // set the brightness level for the lines (mode HSB)

//  create a rotating line object array
RotatingLine[] rLine = new RotatingLine[ NumberOfLines ];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  // general setup
  size ( 800, 600 );
  background ( 255 );
  colorMode ( HSB );
  strokeWeight ( 2 );
  noFill();
  rectMode(CORNERS);
  frameRate ( 240 );  // I max out on this at around 1600
  createLines();  // set up the start data for all of the lines
} // end setup() function

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw() {
  // draw and update all of the lines
  for ( int i = 0; i < NumberOfLines; i++ ) {
    rLine[i].Draw();
    rLine[i].ChangeAngle();
    rLine[i].ChangeAlpha();
    rLine[i].Move();
  } // end of for statement
  // carry out checks
  checkKeyboard();
  checkQuit();
  checkSave();
  // display frames per second in the window title bar
  // NOTE: This causes the sketch to fail in javascript mode
  // frame.setTitle(int(frameRate)+" fps    "+frameCount+" iterations");
} // end of draw() function

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void createLines() {
  int xPosition, yPosition, horizontalSpeed, verticalSpeed, lineLength, lineColour, lineAlpha, alphaSpeed, startAngle, angleIncrement;

  // populate object with data
  for (int i = 0; i < NumberOfLines; i++) {
    lineLength      = 150;
    xPosition       = int ( random ( width - (lineLength*2) ) + lineLength );
    yPosition       = int ( random ( height - (lineLength*2) ) + lineLength );
    horizontalSpeed = 1;
    verticalSpeed   = 1;
    lineColour      = int( map ( xPosition, lineLength, width - lineLength, 0, 255) );
    lineAlpha       = int ( random ( maximumAlpha ) );
    alphaSpeed      = 1;
    startAngle      = int ( random ( 360 ) );
    angleIncrement  = 1;
    rLine[i]= new RotatingLine ( xPosition, yPosition, horizontalSpeed, verticalSpeed, lineLength, lineColour, lineAlpha, alphaSpeed, startAngle, angleIncrement );
  }  // end of for statement
}  // end createLines() function

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void checkKeyboard() {
  // pressing 'q' prepares to exit
  if ( keyPressed == true && key == 'q' ) {
    quitFlag = true;
  } // end of if statement
  // pressing 's' saves the frame
  if ( keyPressed == true && key == 's' ) {
    saveFlag = true;
  } // end of if statement
  // pressing 'c' clears the screen
  if ( keyPressed == true && key == 'c' ) {
    background ( 255 );
  } // end of if statement
} // end of CheckKeyboard() funtion

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void checkQuit() {   
  // if 'q' has been pressed then next time the line is transparent save screen image and quit
  if (quitFlag == true) {
    saveFrame("rotatingLine"+frameCount+".jpg");
    exit();
  } // end of if statement
} // end of checkQuit() function

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void checkSave() {
  // if 's' has been pressed then next time the line is transparent save screen image
  if (saveFlag == true) {
    saveFrame("rotatingLine"+frameCount+".jpg");
    saveFlag = false;
  } // end of if statement
} // end of checkSave() function

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

class RotatingLine {
  // declare variables used in the class
  int posX, posY, speedX, speedY;
  float lineLength;
  int lineColour, lineAlpha, alphaSpeed, angleSpeed;
  float angle;
  
  // define how variables are initially set
  RotatingLine( int x, int y, int sx, int sy, int ll, int lc, int la, int als, float a, int ans )
  {
    posX = x;
    posY = y;
    speedX = sx;
    speedY = sy;
    lineLength = ll;
    lineColour = lc;
    lineAlpha = la;
    alphaSpeed = als;
    angle = a;
    angleSpeed = ans;
  } // end of definition

  // declare RotatingLine Draw method
  void Draw() {
    // colour and draw line
    stroke( this.lineColour, lineSaturation, lineBrightness, this.lineAlpha );
    line
      (
      this.posX - cos( radians( this.angle )) * this.lineLength,
      this.posY - sin( radians( this.angle )) * this.lineLength,
      this.posX + cos( radians( this.angle )) * this.lineLength,
      this.posY + sin( radians( this.angle )) * this.lineLength
      ); //end of line statement
  } // end of Draw() method

  // declare RotatingLine ChangeAngle mthod
  void ChangeAngle() {
    // alter line rotation angle
    this.angle += this.angleSpeed;
    // if the angle of the line exceeds 360 degrees then reset to zero
    if ( this.angle > 360 || this.angle < 0 ) {
      this.angle = 0;
      //this.angleSpeed = -this.angleSpeed;
    } // end of if statement
  } // end of ChangeAngle() method

  // declare RotatingLine ChangeAlpha method
  void ChangeAlpha() {
    // alter line alpha
    this.lineAlpha += this.alphaSpeed;
    // if line alpha exceeds limit then reverse direction
    if ( this.lineAlpha <1  || this.lineAlpha > maximumAlpha) {
      this.alphaSpeed = -this.alphaSpeed;
    } // end of if statement
  } // end of ChangeAlpha() method
  
  // declare RotatingLine Move method
  void Move() {
 
    // move line
    this.posX += this.speedX;
    this.posY += this.speedY;
    
    // if line meets the left or right sides of the viewing area then bounce and reverse direction
    if ( this.posX < this.lineLength || this.posX > width - this.lineLength ) {
      this.speedX = -this.speedX;
    } // end of if statement
    
    // if the line meets top or bottom sides of the viewing area then bounce and reverse direction
    if ( this.posY < this.lineLength || this.posY > height - this.lineLength ) {
      this.speedY = -this.speedY;
    } // end of if statement

  } // end of Move() method
} // end of RotatingLine class



