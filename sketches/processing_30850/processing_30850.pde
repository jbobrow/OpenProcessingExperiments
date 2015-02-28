
// blobs in an hexagonal grid with sine wave motion
// allonestring
// july 2011

//pjs - july 2014

int numColumns = 15; 
int numRows = 10; 
float gridWidth, gridHeight;
//blobs movement determined by balls at vertices
Ball[][]balls = new Ball[numColumns][numRows];
float radius = 5;
float[][]angles = new float[numColumns][numRows];
float[][]ypos = new float[numColumns][numRows];
float angleInc;


Blob[]blobs = new Blob[2*numColumns*numRows];
color[][]colours = new color[numColumns][numRows];

int count = 0;


void setup()
{
  size(500, 300);
  background(255);
  smooth();
  frameRate(6);

  
  gridWidth = width / (numColumns - 4); //to allow for hexagons overlapping edge of stage
  gridHeight = height / (numRows - 4); //by trial and error - 3 isn't enough
  angleInc = PI / 5;
  
  //populate balls array with triangles' vertices
  for(int i = 0; i < numColumns; i++)
  {
    for(int j = 0; j < numRows; j++)
    {
      float xpos;
      if(j % 2 == 0) xpos = gridWidth * (i - 1);
      else xpos = gridWidth * (i - 1.5); //otherwise shunt row half a space to the left
      ypos[i][j] = gridHeight * (j - 1);
      angles[i][j] = i * angleInc + j; //set and offset initial sine wave
      colours[i][j] = color(random(64, 128), random(64, 128), random(64, 128));
      balls[i][j] = new Ball(xpos, ypos[i][j], 0, 0, radius, 0);
      count++;
    }
  }
}

void draw()
{
  background(255);
  noStroke();
  count = 0;
  
  for(int j = 1; j < numRows - 1; j++)
  {
    if(j % 2 == 0)
    {
      for(int i = 1; i < numColumns - 1; i++)
      {
        //hexagon vertices are the vertices of the six triangle surrounding each midpoint
        float midX = balls[i][j].x;
        float midY = balls[i][j].y;
        float upRightX = balls[i+1][j-1].x;
        float upRightY = balls[i+1][j-1].y;
        float rightX = balls[i+1][j].x;
        float rightY = balls[i+1][j].y;
        float downRightX = balls[i+1][j+1].x;
        float downRightY = balls[i+1][j+1].y;
        float downLeftX = balls[i][j+1].x;
        float downLeftY = balls[i][j+1].y;
        float leftX = balls[i-1][j].x;
        float leftY = balls[i-1][j].y;
        float upLeftX = balls[i][j-1].x;
        float upLeftY = balls[i][j-1].y;

        float[]tempXpos = {upRightX, rightX, downRightX, downLeftX, leftX, upLeftX};
        float[]tempYpos = {upRightY, rightY, downRightY, downLeftY, leftY, upLeftY};
        blobs[count] = new Blob(midX, midY, tempXpos, tempYpos, color(colours[i][j]));
        count++;
      }
    }
    else // j is odd
    {
      for(int i = 1; i < numColumns-1; i++)
      {
        //hexagon vertices
        float midX = balls[i][j].x;
        float midY = balls[i][j].y;
        float upRightX = balls[i][j-1].x;
        float upRightY = balls[i][j-1].y;
        float rightX = balls[i+1][j].x;
        float rightY = balls[i+1][j].y;
        float downRightX = balls[i][j+1].x;
        float downRightY = balls[i][j+1].y;
        float downLeftX = balls[i-1][j+1].x;
        float downLeftY = balls[i-1][j+1].y;
        float leftX = balls[i-1][j].x;
        float leftY = balls[i-1][j].y;
        float upLeftX = balls[i-1][j-1].x;
        float upLeftY = balls[i-1][j-1].y;
        
        float[]tempXpos = {upRightX, rightX, downRightX, downLeftX, leftX, upLeftX};
        float[]tempYpos = {upRightY, rightY, downRightY, downLeftY, leftY, upLeftY};
        blobs[count] = new Blob(midX, midY, tempXpos, tempYpos, color(colours[i][j]));
        count++;
      }
    }
  }
  for(int j = 0; j < numRows; j++)
  {
    for(int i = 0; i < numColumns; i++)
    {
      angles[i][j] += angleInc; //for sea-sick sine wave motion
      balls[i][j].y = ypos[i][j] + sin(angles[i][j]) * gridHeight/2;
//      balls[i][j].display();
    }
  }
  for(int k = 0; k < count; k++)
  {
    blobs[k].display();
  }
}
  

// Ball class
class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  color colour = color(0, 0, 255);
  
  float mass = 1.0;
  float gravity = 0.0;
  float bounce = -0.6; // default = -0.6
  
  Ball(float x, float y, float vx, float vy, float radius, color colour) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.radius = radius;
    this.mass = radius;
    this.colour = colour;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
}

class Blob //a shape with rounded corners or rounded sides
{
  float startX, startY; //hexagon centres
  float[] xpos, ypos; //vertices
  float[] xCentre, yCentre; //triangle centres = hex vertices
  color colour;
  float[] xoff, yoff; //offsets from vertices
  int numPoints;
  float offset = 0.2; //2 or 0.3: fraction of each end of line converted to rounded corners
  Boolean niceShape = true; //set offset to < 1 and this to false ...
  
  Blob(float startX, float startY, float[] xpos, float[] ypos, color colour)
  {
    this.startX = startX;
    this.startY = startY;
    this.xpos = xpos;
    this.ypos = ypos;
    this.colour = colour;
    init();
  }
  
  void init()
  {
    noStroke();

    numPoints = xpos.length;
    xoff = new float[numPoints];
    yoff = new float[numPoints];
    xCentre = new float[numPoints];
    yCentre = new float[numPoints];
  }
  
  void display()
  {
    fill(colour);

    //find hexagon vertices at centres of respective triangles
    for(int i = 0; i < numPoints; i++)
    {
      xCentre[i] = (startX + xpos[i] + xpos[(i+1)%numPoints]) / 3;
      yCentre[i] = (startY + ypos[i] + ypos[(i+1)%numPoints]) / 3;
    }    
    
    if((offset < 1) && (niceShape == true))
    {
      float totalx = 0;
      float totaly = 0;
      for(int i = 0; i < numPoints; i++)
      {
        totalx += xCentre[i];
        totaly += yCentre[i];
      }  
      float centreX = totalx / numPoints;
      float centreY = totaly / numPoints;
      
      beginShape();
      vertex(xCentre[0], yCentre[0]);
      for(int i = 0; i < numPoints; i++)
      {
        bezierVertex(xCentre[i], yCentre[i], centreX, centreY, xCentre[(i + 1) % numPoints], yCentre[(i + 1) % numPoints]);
      }
      endShape();
    }
        
    else
    {   
      for(int i = 0; i < numPoints; i++)
      {          
        float dx = xCentre[i] - xCentre[(i + 1) % numPoints];
        float dy = yCentre[i] - yCentre[(i + 1) % numPoints];
        xoff[i] = xCentre[i] - dx / offset;
        yoff[i] = yCentre[i] - dy / offset;
      }
        
      beginShape();
      vertex(xoff[numPoints - 1], yoff[numPoints - 1]);
      for(int i = 0; i < numPoints; i++)
      {
        bezierVertex(xCentre[i], yCentre[i], xCentre[i], yCentre[i], xoff[i], yoff[i]);
      }
      endShape();
    }
  }
}
    


