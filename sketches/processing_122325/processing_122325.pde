
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////2D ARRAYS AKA ROW&COLUMN ARRAY//////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////CONTROLS:  ' ' = Cycle Stop --> Attract --> Stop --> Repel/////////////////////////
//////////////////////             + = Increase Speed                           /////////////////////////
//////////////////////             - = Decrease Speed                           /////////////////////////
//////////////////////          CTRL = Toggle Clear                             /////////////////////////
//////////////////////             C = Single Clear                             /////////////////////////
//////////////////////    MousePress = Origin of Repulsion/Attraction           /////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
float[][]hueGrid;  //INITIALIZE A 2D ARRAY     MORE BRACKETS MEANS MORE DIMENSIONS      Array of arrays//
Bot[][]bot;
float cellSize = 10;
int size = 500;
int loopCells = int(size/cellSize);

float xPos = 0;
float yPos = 0;

boolean moveToMouse = false;

boolean toggleAutoBackground = false;         //PRESS CONTROL KEY TO TURN ON AUTO BACKGROUND FILL RATHER THAN CLICKING C FOR CLEAR


void setup()
{
 size(size,size);
 background(0);
 colorMode(HSB,360,100,100);
 stroke(0,0,0,50);
 frameRate(30);
 
 
 ////////////////////////////INITIALIZE THE 2D ARRAYS/////////////////////////////////////////
 hueGrid = new float[loopCells][loopCells];      //THIS IS A 20x20 ARRAY GRID    Storing hue values at specific locations
 bot = new Bot[loopCells][loopCells];
 /////////////////////////////////////////////////////////////////////////////////////////////
 
 
 ////////////////////////////////Assign value to hueGrid//////////////////////////////
 for(int y = 0; y < loopCells; y++)
   {
     for(int x = 0; x < loopCells; x++)
     {
       hueGrid[x][y] = random(0,360);
     } 
   }
 //////////////////////////////INITIALIZE new bot objects////////////////////////////  
 for(int y = 0; y < loopCells; y++)
   {
     for(int x = 0; x < loopCells; x++)
     {
       bot[x][y] = new Bot(random(0,360), x*cellSize, y*cellSize);
     } 
   }
 
}
void draw()
{
  
  if(toggleAutoBackground)
  {
    background(0);
  }
  
  ////////////////Create a random hue and set it as the bot's color/////////////
   for(int y = 0; y < loopCells; y++)
   {
     for(int x = 0; x < loopCells; x++)
     {
       hueGrid[x][y] = bot[x][y].changeHue(hueGrid[x][y]);
       bot[x][y].setHue(hueGrid[x][y]);
     }
   }
   
   ////////////////////////////////////////////////////////
   if(moveToMouse)
   {
   for(int y = 0; y < loopCells; y++)
   {
     for(int x = 0; x < loopCells; x++)
     {
       bot[x][y].moveTo(xPos, yPos);
     }
   }
   }
   ////////////////////////JITTER//////////////////////
   for(int y = 0; y < loopCells; y++)
   {
    for(int x = 0; x < loopCells; x++)
     {
       bot[x][y].jitter();
     }
   }
   ////////////////////////////////////////////////////
   /////////////////STAY ON SCREEN/////////////////////
   for(int y = 0; y < loopCells; y++)
   {
    for(int x = 0; x < loopCells; x++)
     {
       bot[x][y].keepInBounds();
     }
   }
  
  ///////////////////DISPLAY the bots//////////////////////
  for(int y = 0; y < loopCells; y++)
   {
    for(int x = 0; x < loopCells; x++)
     {
      bot[x][y].display(x,y);
     }
   }
  ///////////////////////////////////////////////////////// 
   
   
}

void mousePressed()
{
   moveToMouse = true;    ///Initializes user enabled movement
   xPos = mouseX;
   yPos = mouseY;
}

void keyPressed()
{
  ///////////////////SPEED CHANGE////////////////////
   if(key == '+' || key == '-')
  {
   for(int y = 0; y < loopCells; y++)
   {
    for(int x = 0; x < loopCells; x++)
     {
      bot[x][y].changeSpeed(key);
     }
   }
  }
 ////////////////////////////////////////////////////
 //////////////CYCLE TO NEXT STEP////////////////////
 else if(key == ' ')
  {
   for(int y = 0; y < loopCells; y++)
   {
    for(int x = 0; x < loopCells; x++)
     {
       bot[x][y].changeMode();
     }
   }
  } 
  //////////////////////////////////////////////////
  ///////////////CLEAR SCREEN//////////////////////
  else if(key == 'c' || key == 'C')
  {
   background(0,0,0); 
  }
  //////////////////////////////////////////////////
  ///////////////TOGGLE SCREEN CLEAR////////////////
  else if(keyCode == CONTROL)
  {
    toggleAutoBackground = !toggleAutoBackground;
  }
  
}

class Bot
{
  float hue;       //hue
  float xLoc;      //Location X
  float yLoc;      //Location Y
  int xDir;        //Direction X
  int yDir;        //Direction Y
  float speed;     //Speed Value
  int currentMode; //1 = stopped   2 = attract   3 = stop   4 = repel//
  
  Bot(float h, float x, float y)
  {
     hue = h;
     xLoc = x;
     yLoc = y;
     xDir = 0;
     yDir = 0;
     speed = 0.05;
     currentMode = 1;
  } 
  
  //////////////////CYCLER///////////////
  void changeMode()
  {
     currentMode++;
     if(currentMode > 4)
     {
        currentMode = 1;
     } 
  //////////////////////////////////////   
     
     print(currentMode);
  }
  ///////////////////SHIMMER//////////////
  float changeHue(float hueVal)
  {
  //return constrain(random(hueVal-10, hueVal+10), 0, 360);
    float newHueVal = random(hueVal-4, hueVal+4);
    if(newHueVal > 360)
    {
       newHueVal -= 360;
    }
    else if(newHueVal < 0)
    {
       newHueVal += 360; 
    } 
    return newHueVal;
  }
  ////////////////////////////////////
  
  void setHue(float hueVal)
  {
     hue = hueVal; 
  }
  
  void changeSpeed(char s)
  {
    if(s == '+')
    {
      speed+=.05;
    }
    else if(s == '-' && speed > 0)
    {
      speed-=.05;
      
    }
  }
  
  
  
  
  void attract()
  {
    
  }
  
  ///////////REVERSE DIRECTION/////////////
  void repel()
  {
    xDir = -xDir;
    yDir = -yDir;
  }
 ////////////NO DIRECTION//////////////// 
  void stopMove()
  {
     xDir = 0;
    yDir = 0; 
  }
  
  
  
  
  ///////////////MOVE BASED ON MOUSECLICKED////////////
  void moveTo(float xTarg, float yTarg)
  {
    if(xTarg < xLoc)
    {
        xDir = -1;
    }
    else if(xTarg > xLoc)
    {
        xDir = 1;
    }
    else
    {
        xDir = 0; 
    }
    
    if(yTarg < yLoc)
    {
        yDir = -1;
        
    }
    else if(yTarg > yLoc)
    {
        yDir = 1;
    }
    else
    {
        yDir = 0; 
    }
    
    if(currentMode == 1 || currentMode == 3)
     {
       stopMove();
     }
     else if(currentMode == 2)
     {
       
     }
     else if(currentMode == 4)
     {
       repel();
     }
     
    xLoc += xDir * speed;
    yLoc += yDir * speed;
  }
  
  ///////////////KEEP EACH BOT IN BOUNDS////////////
  void keepInBounds()
  {
      if(xLoc > width - cellSize)
      {
         xLoc = width- cellSize; 
      }
      else if(xLoc < 0)
      {
         xLoc = cellSize; 
      }
      if(yLoc > height - cellSize)
      {
         yLoc = height-cellSize; 
      }
      else if(yLoc < 0)
      {
         yLoc = cellSize; 
      }
  }
  
  ////////////jitter////////////////
  void jitter()
  {
    xLoc = random(xLoc - 3, xLoc + 3); 
    yLoc = random(yLoc - 3, yLoc + 3); 
  }
  
  ////////////DISPLAY////////////////
  void display(int xVal, int yVal)
  {
    fill(hue,100,100,150);
    rect(xLoc,yLoc,cellSize,cellSize); 
  }
}
