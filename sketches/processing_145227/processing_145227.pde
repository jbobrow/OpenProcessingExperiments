
// Esercizio 5.3 Colored Circles
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

// Usage:
// Click and drag to create shapes
// Push "x" or "X" to reset to defaults


// GLOBALS
int[] myDefaultBgColor = {0,0,0};
int[] myDefaultCircleDiameter = {50,50};
int[] myDefaultStrokeColor = {0,100,100,80}; // HUE Degrees + Alpha
int[] myCanvasSize = {750,500};
int[] myBgColor = new int[3];
int[] myCircleDiameter = new int[2];
int[] myStrokeColor = new int[4];

int myHueDirection = 1; // Groowing Up
int myBeginHueDegree = 0; // Red
int myEndHueDegree = 255; // Blue


// SETUP
void setup()
{
  resetAllToDefaults();
  
  colorMode(HSB,360,100,100);
  
  noFill();
  size( myCanvasSize[0], myCanvasSize[1] );
  background( myBgColor[0], myBgColor[1], myBgColor[2] );
  stroke( myStrokeColor[0], myStrokeColor[1], myStrokeColor[2] , myStrokeColor[3]  );
}


// DRAW
void draw()
{
  translate( mouseX,mouseY );
  rotate( frameCount/10.0 );
  if ( mousePressed ) {
    drawMyCircles();
  }
}


// KEY RELEASED
void keyReleased()
{
  if ( key=='x' || key=='X' ) {
    resetAllToDefaults();
    background( myBgColor[0], myBgColor[1], myBgColor[2] );
  }
}


// CREATE COLOR
void drawMyCircles()
{  
  if ( myStrokeColor[0]<=myEndHueDegree && myStrokeColor[0]>=myBeginHueDegree && myHueDirection==1 ) 
  {
    myStrokeColor[0]++;
    myCircleDiameter[0]++;
    myCircleDiameter[1]++;
    if ( myStrokeColor[0] >= myEndHueDegree ) myHueDirection = 0;
  } else {
    myStrokeColor[0]--;
    myCircleDiameter[0]--;
    myCircleDiameter[1]--;
    if ( myStrokeColor[0] <= myBeginHueDegree ) myHueDirection = 1;
  }
    
  stroke( myStrokeColor[0], myStrokeColor[1], myStrokeColor[2], myStrokeColor[3] );
  ellipse( 0,0, myCircleDiameter[0],myCircleDiameter[1] );
}


// RESET ALL
void resetAllToDefaults()
{
  arrayCopy(myDefaultBgColor, myBgColor);
  arrayCopy(myDefaultCircleDiameter, myCircleDiameter);
  arrayCopy(myDefaultStrokeColor, myStrokeColor);

  myHueDirection = 1;
}
