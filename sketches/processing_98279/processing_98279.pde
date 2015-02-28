
/* by Miriam Dall'Igna 
   
references:
 Alasdair Turner code for Conway's Game of Life
 Daniel Shiffman - Nature of Code - Chapter 07
 Eva Friedrich for 3d Orbit 
 
 */

GameOfLife3d GOL3d;
Orbit3d o3d;

void setup()
{
  size(500, 500, P3D);
  smooth();
  GOL3d = new GameOfLife3d(31, 31, 31, 10, false);

  int xSize = GOL3d.xNum*GOL3d.cellSize; 
  int ySize = GOL3d.yNum*GOL3d.cellSize;
  int zSize = GOL3d.zNum*GOL3d.cellSize;

  //size(xSize, ySize, OPENGL);  
  
  o3d = new Orbit3d(0, 0, 0, 0, 1.0, 0.5);
}

void draw()
{
  background(100);
  lights();

  o3d.display();

  GOL3d.display();
  GOL3d.generate();
}

void keyPressed()
{
  if (key == 'i')
  {
    GOL3d.init();
    GOL3d.inOut = false;
  }
  if (key == 'o')
  {
    GOL3d.init();
    GOL3d.inOut = true;
  }

  if (key == 't')
  {
    // stop translate
    o3d.posX = 0;
    o3d.posY = 0;
    o3d.accelTrX = 0;
    o3d.accelTrY = 0;
    
    // stop rotate
    o3d.rotZ = 0;
    o3d.rotX = 0;
    o3d.accelZ = 0;
    o3d.accelX = 0;
    
    // stop scale
    o3d.sc = 1.0;
    o3d.accelSc = 0;
  }
}

void mousePressed()
{
  if (keyPressed)
  {
    if (keyCode == SHIFT)
    {
      return;
    }
    else if (keyCode == CONTROL)
    {
      return;
    }
    else if (keyCode == ALT)
    {
      return;
    }
  }
}

void mouseDragged()
{
  if (keyPressed)
  {
    if (keyCode == SHIFT)
    {
      o3d.accelX += (pmouseY - mouseY) * o3d.rotationacceleration_mouse;
      o3d.accelZ -= (pmouseX - mouseX) * o3d.rotationacceleration_mouse;
      return;
    }

    else if (keyCode == CONTROL)
    {
      if (pmouseY-mouseY > 0)
      {
        o3d.accelSc =  o3d.scaleacceleration_mouse * o3d.sc;
      }
      else o3d.accelSc =  o3d.scaleacceleration_mouse * o3d.sc * (-1);
      return;
    }

    else if (keyCode == ALT)
    {
      o3d.accelTrX += (mouseX - pmouseX) * o3d.translationAcceleration_mouse;
      o3d.accelTrY += (mouseY - pmouseY) * o3d.translationAcceleration_mouse;
    }
  }
}

void mouseReleased()
{
}

class GameOfLife3d
{
  // step 1 - local variables
  // sets up number of cells in the cube
  int xNum; 
  int yNum;
  int zNum;

  // sets up cell sizes
  int cellSize = 10; 

  boolean [][][] state; // boolean because cells will be on or off
  
  boolean inOut; // grow inwards or outwards

  // step 2 - constructor
  GameOfLife3d(int _xNum, int _yNum, int _zNum, int _cellSize, boolean _inOut)
  {
    xNum = _xNum;
    yNum = _yNum;
    zNum = _zNum;
    cellSize = _cellSize;
    inOut = _inOut;

    // initiate the GOL cube cells
    state = new boolean[xNum][yNum][zNum]; 

    init();
  }

  void init()
  {
    for (int i = 0; i < xNum; i++)
    {
      for (int j = 0; j < yNum; j++)
      {
        for (int k = 0; k < zNum; k++)
        {
          state[i][j][k] = false; // initiate cells to false
        }
      }
    }
  }

  // step 3 - functions
  void generate()
  {
    // create the new state
    boolean [][][] nextState = new boolean[xNum][yNum][zNum];

    // loop throgh all cells in the cube
    for (int i = 0; i < xNum; i++)
    {
      for (int j = 0; j < yNum; j++)
      {
        for (int k = 0; k < zNum; k++)
        {
          // sets cell in the middle of 3d array  to be true
          if (inOut)
          {
            state[xNum/2][yNum/2][zNum/2] = true; 
          }
          else
          {
            state[0][0][0] = true; 
          }
          
          int liveCells = 0;
          
          for (int x = -1; x <= 1; ++x) // looks for cells left and right
          {
            for (int y = -1; y <= 1; ++y) // looks for cells back and front
            {
              for (int z = -1; z <= 1; ++z) // looks for down up and up
              {
                if (!(x == 0 && y == 0 && z == 0)) // gets cell in the middle
                {
                  if (state[(i+x+xNum)%xNum][(j+y+yNum)%yNum][(k+z+zNum)%zNum] == true) // set it to on with wrap
                  {
                    liveCells++;
                  }
                }
              }
            }
          }

          //this is the acctual automata rule
          if (liveCells == 3 || liveCells == 2 )
          {
            nextState[i][j][k] = false; // turn off
          }
          else if (liveCells == 1 || liveCells == 4 )
          {
            nextState[i][j][k] = true; // turn on
          }
          else
          {
            nextState[i][j][k] = state[i][j][k]; // don't change
          }
        }
      }
    }

    for (int i = 0; i < xNum; ++i)
    {
      for (int j = 0; j < yNum; ++j)
      {
        for (int k =0; k < zNum; ++k)
        {
          state[i][j][k] = nextState[i][j][k]; // change to next state
        }
      }
    }
  }

  void display()
  {
    pushMatrix();
    translate(-xNum*cellSize/2, -yNum*cellSize/2);
    for (int i = 0; i < xNum; i++)
    {
      for (int j = 0; j < yNum; j++)
      {
        for (int k = 0; k < zNum; k++)
        {
          if (state[i][j][k] == true) // draw one cell first
          {
            pushMatrix();
            translate(i*cellSize, j*cellSize, k*cellSize);
            fill(0, 255, 255, 200);
            stroke(100);
            box(cellSize);
            popMatrix();
          }
        }
      }
    }
    popMatrix();
  }
}
class Orbit3d
{  
  // step 1 - local variables
  // translate
  float posX;
  float posY;
  float accelTrX;
  float accelTrY;
  float translationAcceleration_mouse;

  // rotate
  float rotZ;
  float rotX;
  float accelZ;
  float accelX;
  float rotationacceleration_mouse;

  // scale
  float sc;
  float initSc;
  float accelSc;
  float maxSc;
  float minSc;
  float scaleacceleration_mouse;

  // step 2 - constructor
  Orbit3d(float _posX, float _posY, float _rotZ, float _rotX, float _sc, float _initSc)
  {
    // translate
    float accelTrX = 0;
    float accelTrY = 0;
    translationAcceleration_mouse = 2.0;

    // rotate
    rotZ = _rotZ;
    rotX = _rotX;
    accelZ = 0;
    accelX = 0;
    rotationacceleration_mouse = 0.1;

    //scale
    sc = _sc;
    initSc = _initSc;
    accelSc = 0;
    maxSc = 400.0;
    minSc = 0.1;
    scaleacceleration_mouse = 0.02;
  }

  // step 3 - functions
  void display()
  {
    translate(width/2, height/2, -GOL3d.zNum*GOL3d.cellSize);

    translate(posX*0.05, posY*0.05, 0);

    rotateX(rotX*0.01);
    rotateZ(-rotZ*0.01);

    scale(sc);

    posX += accelTrX;
    posY += accelTrY;
    accelTrX *= 0.9;
    accelTrY *= 0.9;

    rotZ += accelZ;
    rotX += accelX;
    accelZ *= 0.9;
    accelX *= 0.9;

    if (accelSc < 0)
    {
      sc -= min(abs(accelSc), abs(sc-minSc)/5);
    }
    else
    {
      sc += accelSc;
      accelSc *= 0.8;
    }
  }
}



