
/*
Homework #11B, 48-757, 11:30AM
Copyright M. Yvonne Hidle
yvonnehidle@gmail.com

Credits:
- Easing from class code
*/

// Change this value to increase/decrease the number of Shapes
final int max = 100;

// List of arrays
float[]objectX;
float[]objectY;
int[]objectSize;
int[]objectSpeedX;
int[]objectSpeedY;
color[]objectColor;

// Global variables
float easingC;
float distX;
float distY;


//========================================//
void setup ()
{

// General setup  
size(800,700);
smooth();

// Giving the arrays values
objectX = new float [max];
objectY = new float [max];
objectSize = new int [max];
objectSpeedX = new int [max];
objectSpeedY = new int [max];
  
objectX = startArray2(0,width);
objectY = startArray2(0,height);
objectSize = startArray(5,30);
objectSpeedX = startArray(1,3);
objectSpeedY = startArray(1,3);
objectColor = startColArray();

// Giving global variables values
easingC = 0.02;
}
//========================================//


//========================================//
void draw()
{
// Prep window
drawWindow();
  
// Call Shapes
drawShapes();
moveShapes();

// Attract Shapes to mouse when you press
if (mousePressed == true)
{
  
  for (int i=0; i<objectX.length; i++)
{
  distX = mouseX - objectX[i];
  distY = mouseY - objectY[i];
  objectX[i] = objectX[i] + (distX * easingC);
  objectY[i] = objectY[i] + (distY * easingC);
  
  if (objectX[i]+objectSize[i]/2 > width || objectX[i]-objectSize[i]/2 < 0)
  {
    objectSpeedX[i] = -objectSpeedX[i];
  }
  
  if (objectY[i]+objectSize[i]/2 > height || objectY[i]-objectSize[i]/2 < 0)
  {
    objectSpeedY[i] = -objectSpeedY[i];
  }
}
}

}
//========================================//


//========================================//
// Draw the Shapes using the values generated
void drawShapes()
{

for (int i=0; i<objectX.length; i++)
{
pushMatrix();
translate(objectX[i],objectY[i]);
rotate( radians(frameCount*10) );
 
noStroke();
fill(objectColor[i]);
rectMode(CENTER);
rect(0,0,objectSize[i],objectSize[i]);
 
popMatrix();
}

}
//========================================//


//========================================//
// Move the Shapes
void moveShapes()
{
  
for (int i=0; i<objectX.length; i++)
{
  objectX[i] += objectSpeedX[i];
  objectY[i] += objectSpeedY[i];
  
  if (objectX[i]+objectSize[i]/2 > width || objectX[i]-objectSize[i]/2 < 0)
  {
    objectSpeedX[i] = -objectSpeedX[i];
  }
  
  if (objectY[i]+objectSize[i]/2 > height || objectY[i]-objectSize[i]/2 < 0)
  {
    objectSpeedY[i] = -objectSpeedY[i];
  }
}

}
//========================================//


//========================================//
void drawWindow()
{
noStroke();
fill(0,100);
rectMode(CORNER);
rect(0,0,width,height);
}
//========================================//


//========================================//
// Generate all the different values
int[] startArray(int small, int big)
{
  
int[]tempValue = new int[max];

for (int i=0; i<tempValue.length; i++)
{
  tempValue[i] = int( random(small,big) );
}

return tempValue;

}
//========================================//


//========================================//
// Generate all the different color values
color[] startColArray()
{
 
color[]tempColor = new color[max];
 
  for (int i=0; i<tempColor.length; i++)
  {
    tempColor[i] = color ( 
                   int(random(255))
                   );
  }
   
return tempColor;
   
}
//========================================//


//========================================//
// Generate all the different values
float[] startArray2(float small, float big)
{
  
float[]tempValue = new float[max];

for (int i=0; i<tempValue.length; i++)
{
  tempValue[i] = random(small,big);
}

return tempValue;

}
//========================================//


