
// ===========================================================================
// Depth of Focus 5.0
// Copyright 2010 by Trevor Alyn
// ===========================================================================

int screenWidth = 400;
int screenHeight = 400;
int backgroundColor = 0;

float dropX = screenWidth / 3;
float dropY = screenHeight / 4;
float speedX = 2;
float speedY = 3;

int revsMax = 100;
float revsThreshold = .005;
int revs = 0;
int revsCounter = 0;

boolean showDrops = true;
float dropOpacity = .4;
boolean showCells = true;

// Kernel for blurring
float v = 1.0/9.0;
float[][] kernel = { { v, v, v },
                     { v, v, v },
                     { v, v, v } };
                     
Cell[] cells;
int cellCountMax = 5;   // Maximum number of cells
int cellCount;          // Current number of cells
boolean showCell = true;
boolean flipped = true;
float lineBrightness = 255;
boolean corners = false;
boolean links = false;
int rayCountMax = 25;
float rayLengthMax = 100;
boolean rays = true;
boolean circles = true;
float magnetismMax = 2;
float speedMax = 4;
float opacityMax = 255;

// Color vars
boolean colorMutate = true;  // If true, color mutates gradually
float redDef;   // Red RGB component
float greenDef; // Green RGB component
float blueDef;  // Blue RGB component
float redMutate;   // Red component mutation speed
float greenMutate; // Green component mutation speed
float blueMutate;  // Blue component mutation speed
boolean redUp = true;   // Tracks direction of red component mutation
boolean greenUp = true; // Tracks direction of green component mutation
boolean blueUp = true;  // Tracks direction of red component mutation


// ===========================================================================
// SETUP
// ===========================================================================
void setup()
{
  size(screenWidth, screenHeight);
  smooth();
  randomizeColor();
  background(backgroundColor);
  
  cellCount = int(random(2, 5));
  randomizeCells (cellCount);
}


// ===========================================================================
// RANDOMIZE CELLS
// ===========================================================================

void randomizeCells(int number)
{
  cells = new Cell[number];
  for (int i = 0; i < number; i++) {
    cells[i] = new Cell(i,
      random(0, screenWidth),
      random(0, screenHeight),
      int(random(1, rayCountMax)),
      random(0, rayLengthMax),
      0,     // Update speed; lower = faster
      true,  // Bounces
      false, // Responds to gravity
      magnetismMax - random(0, 2 * magnetismMax),
      int(random(0, opacityMax)));
  }
}


// ===========================================================================
// RANDOMIZE COLOR
// ===========================================================================

void randomizeColor()
{
  redDef = random(50, 255);
  greenDef = random(50, 255);
  blueDef = random(50, 255);
  redMutate = random(.5);
  greenMutate = random(.5);
  blueMutate = random(.5);
}


// ===========================================================================
// DRAW
// ===========================================================================
void draw()
{
  if (mousePressed) {
    cellCount = int(random(2, cellCountMax + 1));
    randomizeCells(cellCount);
  }

  // If we're not currently revving
  if (revsCounter < 1) {
    if (random(1) > revsThreshold) {
      // Do nothing
    } else {
      // Choose a random number
      revs = int(random(revsMax));
      // Start the counter
      revsCounter = 1;
    }
  } else {  // If we ARE currently revving
    cellCount = int(random(2, cellCountMax + 1));
    randomizeCells(cellCount);
    revsCounter++;
    if (revsCounter >= revs) {
      revs = 0;
      revsCounter = 0;
    }
  }
  
  for (int i = 0; i < cellCount; i++) {
    cells[i].update();
    cells[i].display();
  }

  
  if (random(1) < .03) {
    for (int j = 0; j < int(random(1000)); j++) {
    }
  }
  
  // Draw drops
  if (showDrops) {
    if (random(1) < .5) {
      stroke(redDef, greenDef, blueDef, 255 * dropOpacity);
      fill(redDef, greenDef, blueDef, 40 * dropOpacity);
      float diameter = random(200);
      ellipse(dropX, dropY, diameter, diameter);
      if (flipped) {
        ellipse(screenWidth - dropX, dropY, diameter, diameter);
      }
      dropX += 50 - random(100);
      dropY += 50 - random(100);
      if (dropX > screenWidth) { dropX = dropX - screenWidth; }
      if (dropX < 0) { dropX = dropX + screenWidth; }
      if (dropY > screenHeight) { dropY = dropY - screenHeight; }
      if (dropY < 0) { dropY = dropY + screenHeight; }
    }
  }

  // Draw cells
  if (showCells) {
    for (int i = 1; i < cellCount; i++) {
      cells[i].update();
      cells[i].display();
    }
  }

  // Blur the current image
  PImage edgeImg = createImage(screenWidth, screenHeight, RGB);
  loadPixels();
  for (int y = 1; y < screenHeight - 1; y++) { // Skip top and bottom edges
    for (int x = 1; x < screenWidth - 1; x++) { // Skip left and right edges
      float sumRed = 0;
      float sumGreen = 0;
      float sumBlue = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky) * screenWidth + (x + kx);
          float valRed = red(pixels[pos]);
          sumRed += kernel[ky+1][kx+1] * valRed;
          float valGreen = green(pixels[pos]);
          sumGreen += kernel[ky+1][kx+1] * valGreen;
          float valBlue = blue(pixels[pos]);
          sumBlue += kernel[ky+1][kx+1] * valBlue;
        }
      }
      edgeImg.pixels[y*screenWidth + x] = color(sumRed, sumGreen, sumBlue);
    }
  }
  edgeImg.updatePixels();
  image(edgeImg, 1, 1, screenWidth - 2, screenHeight - 2);

  // Mutate the color
  if (colorMutate) {
    if (redUp) {
      redDef += redMutate;
      if (redDef > 255) { redDef = 255; redUp = !redUp; }
    } else {
      redDef -= redMutate;
      if (redDef < 0) { redDef = 0; redUp = !redUp; }
    }
    if (greenUp) {
      greenDef += greenMutate;
      if (greenDef > 255) { greenDef = 255; greenUp = !greenUp; }
    } else {
      greenDef -= greenMutate;
      if (greenDef < 0) { greenDef = 0; greenUp = !greenUp; }
    }
    if (blueUp) {
      blueDef += blueMutate;
      if (blueDef > 255) { blueDef = 255; blueUp = !blueUp; }
    } else {
      blueDef -= blueMutate;
      if (blueDef < 0) { blueDef = 0; blueUp = !blueUp; }
    }
  }
}




// ===========================================================================
// Cell class definition
// ===========================================================================
class Cell
{
  // Attributes
  int identity;  // Used to uniquely identify each cell
  float x;
  float y;
  int rayCount;  // Rays are spikes emanating from cell
  float rayX[];  // X location of each ray's end
  float rayY[];  // Y location of each ray's end
  float rayMax;  // Maximum length of a ray
  float speedX;  // X speed of cell
  float speedY;  // Y speed of cell
  int updateCounter;  // Not used
  int updateSpeed;    // Not used
  boolean bounces;    // If true, bounces at boundaries; otherwise comes out other side
  boolean respondsToGravity;  // Not used
  int opacity;  // Cell's opacity
  float magnetism;  // Cell's magnetism w/ other cells (positive or negative)

  // Constructor
  Cell(int identityIn,
    float xIn,
    float yIn,
    int rayCountIn,
    float rayMaxIn,
    int updateSpeedIn,
    boolean bouncesIn,
    boolean respondsToGravityIn,
    float magnetismIn,
    int opacityIn)
  {
    identity = identityIn;
    x = xIn;
    y = yIn;
    rayCount = rayCountIn;
    rayMax = rayMaxIn;
    updateSpeed = updateSpeedIn;
    bounces = bouncesIn;
    respondsToGravity = respondsToGravityIn;
    magnetism = magnetismIn;
    opacity = opacityIn;
    rayX = new float[rayCount];
    rayY = new float[rayCount];
    for (int i = 0; i < rayCount; i++) {
      rayX[i] = random(-rayMax, rayMax);
      rayY[i] = random(-rayMax, rayMax);
    }
    speedX = 0;
    speedY = 0;
    updateCounter = 0;
  }

  // Updates all cell values
  void update()
  {
    // Apply intercell magnetism
    for(int i = 0; i < cellCount; i++) {
      if (i != identity) {
        float distance = dist(x, y, cells[i].x, cells[i].y);
        float distanceX = abs(x - cells[i].x);
        float distanceY = abs(y - cells[i].y);
        float totalMagnetism = magnetism + cells[i].magnetism;
        float magnetismGivenDistance = totalMagnetism / distance;
        float magnetismToApplyX = magnetismGivenDistance * (distanceX / (distanceX + distanceY));
        float magnetismToApplyY = magnetismGivenDistance * (distanceY / (distanceX + distanceY));
        if (x < cells[i].x) {
          speedX += magnetismToApplyX;
        } 
        else {
          speedX -= magnetismToApplyX;
        }
        if (y < cells[i].y) {
          speedY += magnetismToApplyY;
        } 
        else {
          speedY -= magnetismToApplyY;
        }
      }
    }
    
    // Update speed
    x = x + speedX;
    y = y + speedY;

    // Check boundaries
    if (y > screenWidth) {
      if (bounces) {
        speedY = -speedY;
      } 
      else {
        y = y - screenHeight;
      }
    }
    if (y < 0) {
      if (bounces) {
        speedY = -speedY;
      } 
      else {
        y = y + screenHeight;
      }
    }
    if (x > screenHeight) {
      if (bounces) {
        speedX = -speedX;
      } 
      else {
        x = x - screenWidth;
      }
    }
    if (x < 0) {
      if (bounces) {
        speedX = -speedX;
      } 
      else {
        x = x + screenWidth;
      }
    }

    // Update rays
    updateCounter++;
    if (updateCounter >= updateSpeed) {
      updateCounter = 0;
      for (int i = 1; i < rayCount; i++) {
        rayX[i-1] = rayX[i];
        rayY[i-1] = rayY[i];
      }
      rayX[rayCount - 1] = random(-rayMax, rayMax);
      rayY[rayCount - 1] = random(-rayMax, rayMax);
    }
  }

  // Display cell on screen
  void display()
  {
    // Draw cell
    if (showCell) {
      stroke(0, 50);
      ellipse(x, y, identity * 6, identity * 6);
      if (flipped) {
        ellipse(screenWidth - x, y, identity * 6, identity * 6);
      }
    }

    // Draw lines
    stroke(redDef * lineBrightness, greenDef * lineBrightness, blueDef * lineBrightness, 10);
    
    // Draw lines from corners
    if (corners) {
      line(x, y, 0, 0);
      line(x, y, 0, screenWidth);
      line(x, y, screenHeight, 0);
      line(x, y, screenHeight, screenWidth);
      if (flipped) {
        line(screenWidth - x, y, 0, 0);
        line(screenWidth - x, y, 0, screenWidth);
        line(screenWidth - x, y, screenHeight, 0);
        line(screenWidth - x, y, screenHeight, screenWidth);
      }
    }
    
    // Draw lines between cells
    if(links) {
      for (int i = 0; i < cellCount; i++) {
        if (i != identity) {
          line(x, y, cells[i].x, cells[i].y);
          if (flipped) {
            line(screenWidth - x, y, screenWidth - cells[i].x, cells[i].y);
          }
        }
      }
    }
    
    // Draw rays
    for (int i = 0; i < rayCount; i++) {
      stroke(redDef / rayCount * i, greenDef / rayCount * i, blueDef / rayCount * i, 125);
      if (rays) {
        line(x, y, x + rayX[i], y + rayY[i]);
        if (flipped) {
          line(screenWidth - x, y, screenWidth - x - rayX[i], y + rayY[i]);
        }
      }
      // Draw circles at ends of rays
      if (circles) {
        float diameter = random(i*2);
        fill(redDef / rayCount * i, greenDef / rayCount * i, blueDef / rayCount * i, 10);
        ellipse(x + rayX[i], y + rayY[i], diameter, diameter);
        if (flipped) {
          ellipse(screenWidth - x - rayX[i], y + rayY[i], diameter, diameter);
        }
      }
    }
  }
}


