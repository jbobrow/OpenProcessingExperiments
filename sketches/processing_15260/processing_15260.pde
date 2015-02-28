
// ===================================
// ScribbleBee 4.0
// Copyright 2010 by Trevor Alyn
// ===================================

int screenWidth = 600;
int screenHeight = 600;
boolean bounces = false;  // Do the cells bounce off the walls?
float backgroundColor = 255;  // Grayscale background color
float fade = 0;  // Controls how quickly the screen fades

Cell[] cells;
int cellCountMax = 20;   // Maximum number of cells
int cellCount;          // Current number of cells
float maxCellSpeed = 1;
float cellSize = 2;

// Distance at which cells repel each other (good = 30)
float minDistance = 30;

// Speed at which the cells move toward the center of the flock (good = .25)
float speedAdjustment = .25;

// Overall speed, from 1 to roughly 1000 (good = 3)
int speed = 3;

// 1 = solid line, higher numbers = spaced dots (good = 3)
int dots = 3;
int dotsMax = 8;

// Amount by which the colored cell moves up each update (good = .5)
float up = .5;


//===========================================================================
// setup()
//===========================================================================
void setup()
{
  size(screenWidth, screenHeight);
  smooth();
  cellCount = int(random(2, cellCountMax));
  randomizeCells(cellCount);
  background(backgroundColor);
}


//===========================================================================
// randomizeCells()
//===========================================================================
void randomizeCells(int number)
{
  // Create random cells
  createCells(number);
  minDistance = random(100);
  speedAdjustment = random(1);
  speed = int(random(40));
  dots = 1 + int(random(dotsMax));
  up = random(2);
  if (random(1) > .5) { bounces = !bounces; }
}


//===========================================================================
// createCells()
//===========================================================================
void createCells(int number)
{
  cells = new Cell[number];
  for (int i = 0; i < number; i++) {
    cells[i] = new Cell(i,
      random(screenWidth),
      random(screenHeight),
      0,  //random(2) - 1,
      0 ); //random(2) - 1);
  }
}


//===========================================================================
// keyPressed()
//===========================================================================
void keyPressed() {
  if(keyPressed) {
    
    // Add or remove cells
    if (key == '+' || key == '=') {
      cellCount++;
      if (cellCount > cellCountMax) { cellCount = cellCountMax; }
      createCells(cellCount);
      background(backgroundColor);
    }
    if (key == '-' || key == '_') {
      cellCount--;
      if (cellCount < 2) { cellCount = 2; }
      createCells(cellCount);
      background(backgroundColor);
    }
    
    // Clear screen
    if (key == 'c') {
      background(backgroundColor);
    }
    
    // Change background color
    if (key == 'C') {
      if (backgroundColor == 0) { backgroundColor = 127; } else {
      if (backgroundColor == 127) { backgroundColor = 255; } else {
      if (backgroundColor == 255) { backgroundColor = 0; } } }
      background(backgroundColor);
    }
    
    // Change cell size
    if (key == 's') {
      cellSize--;
      if (cellSize < 1) { cellSize = 1; }
      println("cellSize: " + cellSize);
    }
    if (key == 'S') {
      cellSize++;
      println("cellSize: " + cellSize);
    }

    // Change speed (velocity)
    if (key == 'v') {
      speed--;
      if (speed < 1) { speed = 1; }
      println("Speed: " + speed);
    }
    if (key == 'V') {
      speed++;
      println("Speed: " + speed);
    }

    // Change dot frequency
    if (key == 'd') {
      dots--;
      if (dots < 1) { dots = 1; }
      println("Dot spacing: " + dots);
    }
    if (key == 'D') {
      dots++;
      if (dots > dotsMax) { dots = dotsMax; }
      println("Dot spacing: " + dots);
    }

    // Increase or decrease Up amount for red cell
    if (key == 'r') {
      up -= .1;
      println("Red dot drift: " + up);
    }
    if (key == 'R') {
      up += .1;
      println("Red dot drift: " + up);
    }

  }
}


//===========================================================================
// draw()
//===========================================================================

void draw()
{
  // If the mouse is clicked, randomize everything
  if (mousePressed) {
    cellCount = int(random(2, cellCountMax));
    randomizeCells(cellCount);
    background(backgroundColor);
  }
  
  // Fade the background
  if (fade > 0) {
    fill(backgroundColor, fade);
    rect(0, 0, screenWidth, screenHeight);
  }
  
  // Make the cells update and display
  for (int i = 0; i < cellCount; i++) {
    for (int j = 0; j < speed; j++) {
      cells[i].update();
      if ((j/float(dots)) == int(j/float(dots))) {
        cells[i].display();
      }
    }
  }  
}



//===========================================================================
// Cell class definition
//===========================================================================
class Cell
{
  
  // Attributes
  //===========================================================================
  int identity;  // Used to uniquely identify each cell
  float x;
  float y;
  float speedX;
  float speedY;
  float cRed;
  float cGreen;
  float cBlue;
  float cColor;


  // Constructor
  //===========================================================================
  Cell(int identityIn,
    float xIn,
    float yIn,
    float speedXIn,
    float speedYIn)
  {
    identity = identityIn;
    x = xIn;
    y = yIn;
    speedX = speedXIn;
    speedY = speedYIn;
    cRed = random(255);
    cGreen = random(255);
    cBlue = random(255);
  }


  // Updates all cell values
  //===========================================================================
  void update()
  {
    float averageX = 0;
    float averageY = 0;
    
    for(int i = 0; i < cellCount; i++) {
      if (i != identity) {
        
        // Avoid collisions with other cells
        float distance = dist(x, y, cells[i].x, cells[i].y);
        float distanceX = abs(x - cells[i].x);
        float distanceY = abs(y - cells[i].y);
        float adjustment = (speedAdjustment * ((minDistance - distance) / minDistance)) / 4;
        if (distance < minDistance) {
          if (x < cells[i].x) {
            speedX = speedX - adjustment;
          } else {
            speedX = speedX + adjustment;
          }
          if (y < cells[i].y) {
            speedY = speedY - adjustment;
          } else {
            speedY = speedY + adjustment;
          }
        }
        averageX += cells[i].x;
        averageY += cells[i].y;        
      }
    }
    
    // Move toward average location of all cells    
    averageX = averageX / (cellCount - 1);
    averageY = averageY / (cellCount - 1);
    float distance = dist(x, y, averageX, averageY);
    cColor = 30 + (distance * 2);
    float adjustment = (speedAdjustment * ((minDistance - distance) / minDistance)) / 20;
    if (x < averageX) {
      speedX = speedX - adjustment;
    } else {
      speedX = speedX + adjustment;
    }
    if (y < averageY) {
      speedY = speedY - adjustment;
    } else {
      speedY = speedY + adjustment;
    }
    
    // Update speed
    x = x + speedX;
    y = y + speedY;
    if (speedX > maxCellSpeed) { speedX = maxCellSpeed; }
    if (speedX < -maxCellSpeed) { speedX = -maxCellSpeed; }
    if (speedY > maxCellSpeed) { speedY = maxCellSpeed; }
    if (speedY < -maxCellSpeed) { speedY = -maxCellSpeed; }
    if (identity == 1) {
      y = y - up;
    }

    // Check boundaries
    if (y > screenWidth) { if (bounces && identity != 1) { speedY = -speedY; } else { y = y - screenHeight; } }
    if (y < 0) { if (bounces && identity != 1) { speedY = -speedY; } else { y = y + screenHeight; } }
    if (x > screenHeight) { if (bounces && identity != 1) { speedX = -speedX; } else { x = x - screenWidth; } }
    if (x < 0) { if (bounces && identity != 1) { speedX = -speedX; } else { x = x + screenWidth; } }
  }


  // Display cell on screen
  //===========================================================================
  void display()
  {
    // Draw cell
    noStroke();
    if (identity == 1) {
      fill(cColor, 0, 0, 80);
    } else {
      fill(cColor, 125);
    }
    //stroke(cRed, cGreen, cBlue);
    ellipse(x, y, cellSize, cellSize);
  }
}


