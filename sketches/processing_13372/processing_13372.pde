
// ===================================
// SpaceFuzz 4.0
// Copyright 2010 by Trevor Alyn
// ===================================

int screenWidth = 400;
int screenHeight = 400;

Cell[] cells;
int cellCountMax = 5;   // Maximum number of cells
int cellCount;          // Current number of cells
int rayCountMax = 40;     // Maximum number of rays per cell
float rayLengthMax = 100;  // Maximum ray length
float magnetismMax = 2;    // Maximum intercell magnetism
int opacityMax = 255;

// Cell display variables
boolean corners = true;  // Draws lines from corners to cell
boolean circles = true;  // Draws circles at ends of rays
boolean rays = true;     // Shows rays around cell
boolean links = true;    // Draws lines between cells
float lineBrightness;    // Controls how bright lines are
boolean showCell = true; // Draws a circle where cell is

// Controls drawing speed
int maxReps = 5;
int reps;

// Draws overlaid flipped copy of everything
boolean flipped = true;

// Color vars
float redDef;   // Red RGB component
float greenDef; // Green RGB component
float blueDef;  // Blue RGB component
boolean colorMutate = true;  // If true, color mutates gradually
float redMutate;   // Red component mutation speed
float greenMutate; // Green component mutation speed
float blueMutate;  // Blue component mutation speed
boolean redUp = true;   // Tracks direction of red component mutation
boolean greenUp = true; // Tracks direction of green component mutation
boolean blueUp = true;  // Tracks direction of red component mutation

// Background colors
float backgroundColor;  // Grayscale background color
float fade;  // Controls how quickly the screen fades

// Gravity -- turned off by default, but feel free to mess with it
float gravity = -.02;

void setup()
{
  size(screenWidth, screenHeight);
  smooth();
  cellCount = int(random(2, cellCountMax));
  randomizeCells(cellCount);
}

// Called at launch and when the canvas is clicked
void randomizeCells(int number)
{
  // Create random cells
  cells = new Cell[number];
  for (int i = 0; i < number; i++) {
    boolean bounces = true;
    if (random(1) > .5) { 
      bounces = false;
    }
    cells[i] = new Cell(i,
      random(0, screenWidth),
      random(0, screenHeight),
      int(random(1, rayCountMax)),
      random(0, rayLengthMax),
      0, // Update speed; lower = faster
      bounces, // Bounces
      false, //gravity, // Responds to gravity
      magnetismMax - random(0, 2 * magnetismMax),
      int(random(0, opacityMax)));
  }
  
  // Randomize environment
  redDef = random(50, 255);
  greenDef = random(50, 255);
  blueDef = random(50, 255);
  redMutate = random(.5);
  greenMutate = random(.5);
  blueMutate = random(.5);
  if (random(1) > .5) {
    corners = !corners;
  }
  if (random(1) > .5) {
    rays = !rays;
  }
  if (random(1) > .5) {
    circles = !circles;
  }
  if (random(1) > .5) {
    links = !links;
  }
  if (random(1) > .5) {
    showCell = !showCell;
  }
  if (random(1) > .5) {
    colorMutate = !colorMutate;
  }
  lineBrightness = random(1);
  fade = random(10);
  reps = 1 + int(random(maxReps));
  backgroundColor = random(255);
}

void draw()
{
  // If the mouse is clicked, randomize everything
  if (mousePressed) {
    cellCount = int(random(2, cellCountMax));
    randomizeCells(cellCount);
    background(backgroundColor);
  }
  
  // Fade the background
  fill(backgroundColor, fade);
  rect(0, 0, screenWidth, screenHeight);
  
  // Make the cells update and display
  for (int j = 0; j < reps; j++) {
    for (int i = 0; i < cellCount; i++) {
      cells[i].update();
      cells[i].display();
    }
  }
  
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



// Cell class definition
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
    // Update position
    if (respondsToGravity) {
      speedY = speedY - gravity;
    }

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
      ellipse(x, y, identity * 3, identity * 3);
      if (flipped) {
        ellipse(screenWidth - x, y, identity * 3, identity * 3);
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
      //stroke(255 / rayCount * i, 10);
      stroke(redDef / rayCount * i, greenDef / rayCount * i, blueDef / rayCount * i, 10);
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


