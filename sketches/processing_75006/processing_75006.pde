
// Homework #11, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// yvonnehidle@gmail.com

/*
Made using Processing 2.0
*/


// Change this value to increase/decrease the number of circles
final int max = 10;

// List of arrays
int[]objectX;
int[]objectY;
int[]objectSize;
int[]objectSpeedX;
int[]objectSpeedY;
color[]objectColor;


//========================================//
void setup ()
{

// General setup  
size(800,800);
smooth();

// Giving the arrays values
objectX = new int [max];
objectY = new int [max];
objectSize = new int [max];
objectSpeedX = new int [max];
objectSpeedY = new int [max];
objectColor = new int[max];
  
objectX = startArray(0,width);
objectY = startArray(0,height);
objectSize = startArray(5,20);
objectSpeedX = startArray(1,3);
objectSpeedY = startArray(1,3);
objectColor = startColArray();
}
//========================================//


//========================================//
void draw()
{  
// Call circles
drawWindow();
drawShapes();
moveShapes();
}
//========================================//


//========================================//
void drawShapes()
{

for (int i=0; i<objectX.length; i++)
{
pushMatrix();
translate(objectX[i],objectY[i]);
rotate( radians(frameCount) );

strokeWeight( random(1,15) );
stroke(255,40);
fill(objectColor[i]);
ellipse(0,0,objectSize[i],objectSize[i]);
ellipse(20,20,objectSize[i]/2,objectSize[i]/2);

popMatrix();
}

}
//========================================//


//========================================//
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
fill(150,50);
rectMode(CORNER);
rect(0,0,width,height);
}
//========================================//


//========================================//
// Generate all the different color values
color[] startColArray()
{

color[]tempColor = new color[max];

  for (int i=0; i<tempColor.length; i++)
  {
    tempColor[i] = color ( int(random(255)) );
  }
  
return tempColor;
  
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


