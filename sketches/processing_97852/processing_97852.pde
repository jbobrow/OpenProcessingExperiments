
float cameraXPos = 0;
float cameraYPos = 0;
float cameraZPos = 0;
float cameraYAngle = 0;

float moveIncrement = 5;
float angleIncrement = 5;

// Keys:
//     W
//     ^
//     |
// A <- -> D 
//     |
//     V
//     S 
//
// F and R for Z+/Z-
// O and P for rotation around Y axis

void setup()
{
  size(640, 480, OPENGL);

  resetCameraPos();
}

// Reset camera
void resetCameraPos()
{
  cameraXPos = width / 2;
  cameraYPos = height / 2;
  cameraZPos = (height /2 ) / tan(PI/6);
  cameraYAngle = 0;
}


void draw() 
{
  // Clear screen
  background(0);
  // View transform
  translate(cameraXPos, cameraYPos, cameraZPos);
  rotateY(radians(cameraYAngle));
  // World transform
  translate(0, 0, -400);
  // Draw a red box and a grid in the center
  stroke(255, 0, 0);
  noFill();
  box(100);
  drawGrid();

  // Check if user is pressing some key and update the camera position
  updateCameraPos();
}

/////////////////////////////////////////////////////////////////////
// The following part is not so relevant to the problem (I hope! ;-)) 
/////////////////////////////////////////////////////////////////////
void drawGrid()
{
  // Draw a white grid (not so important thing here!)
  stroke(255, 255, 255);
  float cellSize = 40;
  int gridSize = 10;
  float cY = 100;

  for(int z = 0; z < gridSize; z++)
  {
    float cZ = (gridSize / 2 - z) * cellSize;
    for(int x = 0; x < gridSize; x++)
    {
      float cX = (x - gridSize / 2) * cellSize;
      beginShape();
      vertex(cX, cY, cZ);
      vertex(cX + cellSize, cY, cZ);
      vertex(cX + cellSize, cY, cZ - cellSize);
      vertex(cX, cY, cZ - cellSize);
      vertex(cX, cY, cZ);
      endShape();
    }
  }
}

// Just update camera position and angle rotation
// according to the pressed key on the keyboard
void updateCameraPos()
{
  if (keyPressed)
  {
    switch(this.key)
    {
    case 'w':  // Y++
      cameraYPos += moveIncrement;
      break;
    case 's':  // Y--
      cameraYPos -= moveIncrement;
      break;
    case 'a':  // X--
      cameraXPos += moveIncrement;
      break;
    case 'd':  // X++
      cameraXPos -= moveIncrement;
      break;
    case 'r':  // Z++
      cameraZPos += moveIncrement;
      break;
    case 'f':  // Z--
      cameraZPos -= moveIncrement;
      break;
    case ' ':  // RESET
      resetCameraPos();
      break;
    case 'o':  // Angle++
      cameraYAngle += angleIncrement;
      break;
    case 'p':  // Angle--
      cameraYAngle -= angleIncrement;
      break;
    }
  }
}
