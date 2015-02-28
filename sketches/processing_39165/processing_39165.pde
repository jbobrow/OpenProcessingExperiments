

/***************************************************

MOVEABLE FRIT - Translucent Curtain Effect

Sept 25, 2011


// This sketch creates a grid of moveable shutters
// Using 3D noise to adjust their scale and space b/w 
// to create a DYNAMIC pattern using 2 offset grids

***************************************************/

void setup() {
  size(500, 500);
  smooth();
}

// Variables defined by the user

int shutterColor = 255;
int shutterOpacity = 100;

float xShutterSize = 2.5; //size of x step (width of the column)
float yShutterSize = 2.5; //size of y step (height of the row)

float xGap = 1; //space between columns
float yGap = 1; //space between rows

boolean rowBias = true; //change true to false for columnBias

float rollSpeed = - 0.05; //how fast the shutter rolls up and down
float rollVariation = 0.005; //how steep/frequent the waves are


// Variables not defined by the user

float noiseBase = 0.0; //starting point of random shifting shutter size
float noiseOffset = 0.01; //rate of random change


/*****************************************************************/


// Main drawing machine

void draw() {
  PImage b;
  b = loadImage("new york.jpg");
  background(b);
  noStroke();

  noiseBase = noiseBase + rollSpeed;
  noiseOffset = noiseBase;
  float n;

  if (rowBias) {
    for (float x = 0; x <= width; x += xShutterSize + xGap) {  
      for (float y = 0; y <= height; y += yShutterSize + yGap) { 
        fill(shutterColor, shutterOpacity);
        noiseOffset = noiseOffset + rollVariation;
        n = noise(noiseOffset);
        rect(x, y, xShutterSize, (xShutterSize)*n);
      }
    }
  } 
  else {
    for (float y = 0; y <= height; y += yShutterSize + yGap) {
      for (float x = 0; x <= width; x += xShutterSize + xGap) { 
        fill(shutterColor, shutterOpacity);
        noiseOffset = noiseOffset + rollVariation;
        n = noise(noiseOffset);
        rect(x, y, xShutterSize, (xShutterSize)*n);
      }
    }
  }
}

// Freeze the animation
void mousePressed() {
  noLoop();
}
// Resume the animation
void mouseReleased() {
  loop();
}


