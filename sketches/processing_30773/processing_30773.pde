
//gridBlob
//allonestring
//july 2011

//pjs - july 2014

//invisible grid contrains motion
int numColumns = 6; //must be at least 3
int numRows = 4; //must be at least 3
float gridSizeX, gridSizeY;

//invisible balls provide corners of blobs
Ball[][]balls = new Ball[numColumns][numRows];
float radius = 0;
float vel = 0.5;

//blob colour componenents determined by dist from centrestage
//and angle from rotating hueAngle
Blob[][]blobs = new Blob[numColumns-1][numRows-1];
float stageDiagonal;
float hueAngle0, hueAngleInc0;
float hueAngle1, hueAngleInc1;
float colourInc = 0.02;

void setup()
{
  size(400, 300);
  background(255);
  smooth();
  noStroke();
  
  //need stageDiagonal for colour mapping later
  float totalWidth = width + 2 * gridSizeX;
  float totalHeight = height + 2 * gridSizeY;
  stageDiagonal = sqrt(totalWidth*totalWidth + totalHeight*totalHeight) / 2;
  //set up rotation of colour components
  hueAngle0 = random(TWO_PI);
  hueAngle1 = random(TWO_PI);
  hueAngleInc0 = random(-colourInc, colourInc);
  hueAngleInc1 = random(-colourInc, colourInc);  

  //top and bottom row and left and right columns are offstage
  //they're there to allow blobs to overlap stageedge
  gridSizeX = width / (numColumns - 2);
  gridSizeY = height / (numRows - 2);
  
  //populate Balls array with balls, one in each gridcell
  for(int i = 0; i < numColumns; i++)
  {
    for(int j = 0; j < numRows; j++)
    {
      float startX = gridSizeX * (random(i, i + 1) - 1);
      float startY = gridSizeY * (random(j, j + 1) - 1);
      balls[i][j] = new Ball(startX, startY, random(-vel, vel), random(-vel, vel), radius, 0);
      balls[i][j].bounce = -1;
    }
  }
}

void draw()
{
  background(255);
  noStroke();
  
  //move (and display) balls checking for collision with invisible grid
  for(int i = 0; i < numColumns; i++)
  {
    for(int j = 0; j < numRows; j++)
    {
      balls[i][j].move();
//      balls[i][j].display();
      float offsetx = ((i % numColumns) - 1) * gridSizeX;
      float offsety = ((j % numRows) - 1) * gridSizeY;
      checkWalls(balls[i][j], offsetx, offsety, gridSizeX, gridSizeY);
    }
  }
  
  //create and colour blobs
  //provide point in current gridcell, in one to right, in one to below right and one below
  for(int i = 0; i < numColumns-1; i++)
  {
    for(int j = 0; j < numRows-1; j++)
    {
      float[]xpos = {balls[i][j].x, balls[i+1][j].x, balls[i+1][j+1].x, balls[i][j+1].x};
      float[]ypos = {balls[i][j].y, balls[i+1][j].y, balls[i+1][j+1].y, balls[i][j+1].y};
      
      //find dentre of blob and its distance and angle from stagecentre
      float centreX = 0;
      for(int k = 0; k < 4; k++) centreX += xpos[k]; 
      float centreY = 0;
      for(int k = 0; k < 4; k++) centreY += ypos[k]; 
      float dx = width / 2 - centreX / 4;
      float dy = height / 2 - centreY / 4;
      float centreAngle = atan2(dy, dx);
      float centreDist = dist(width / 2, height / 2, centreX / 4, centreY / 4);
      
      //some mapping to vary colour components
      //sin and cos used to provide nice flow
      float someHue0 = map(sin(centreAngle - hueAngle0) * centreDist, -stageDiagonal, stageDiagonal, 0, 255);
      float someHue1 = map(cos(centreAngle - hueAngle1) * centreDist, -stageDiagonal, stageDiagonal, 0, 255);
      float someHue2 = 255 - ((someHue0 + someHue1) / 2); //arbitrary manipulation to determine third colour component
      float blobAlpha = someHue2 - (someHue0 + someHue1); //some arbitrary manipulation to vary alpha

      //arbitrary colour creation from components (I like this best)
      color blobColour = color(someHue2, someHue0, someHue1, map(blobAlpha, -510, 255, 0, 255));

      blobs[i][j] = new Blob(xpos, ypos, blobColour);
      blobs[i][j].display();
    }
  }
  //rotate the colour angle so that the blobs change colour
  hueAngle0 += hueAngleInc0;
  hueAngle1 += hueAngleInc1;
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
    this.colour = colour;
  }
  
  void move()
  {
//    vy = vy + gravity;
    y += vy;
    x += vx;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
}

class Blob //a shape with rounded corners
{
  float[] xpos, ypos; //vertices
  color colour;
  float[] xoffcw, yoffcw; //"clockwise" offsets from vertices
  int numPoints;
  int offset = 2; //2 or 3: fraction of each end of line converted to rounded corners
  
  Blob(float[] xpos, float[] ypos, color colour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.colour = colour;
    init();
  }
  
  void init()
  {
    noStroke();

    numPoints = xpos.length;
    xoffcw = new float[numPoints];
    yoffcw = new float[numPoints];
  }
  
  void display()
  {
    for(int i = 0; i < numPoints; i++)
    {
      float dx = xpos[i] - xpos[(i + 1) % numPoints];
      float dy = ypos[i] - ypos[(i + 1) % numPoints];
      xoffcw[i] = xpos[i] - dx / offset;
      yoffcw[i] = ypos[i] - dy / offset;
    }  
    
    fill(colour);
    beginShape();
    vertex(xoffcw[numPoints - 1], yoffcw[numPoints - 1]);
    for(int i = 0; i < numPoints; i++)
    {
      int j = (i + numPoints - 1) % numPoints;
      bezierVertex(xpos[i], ypos[i], xpos[i], ypos[i], xoffcw[i], yoffcw[i]);
    }
    endShape();
  }
}
    
void checkWalls(Ball ball, float offsetx, float offsety, float gridSizeX, float gridsizeY)
{
  if(ball.x + ball.radius > offsetx + gridSizeX)
  {
    ball.x = offsetx + gridSizeX - ball.radius;
    ball.vx *= ball.bounce;
  }
  else if(ball.x < offsetx + ball.radius)
  {
    ball.x = offsetx + ball.radius;
    ball.vx *= ball.bounce;
  }
  else if(ball.y > offsety + gridSizeY - ball.radius)
  {
    ball.y = offsety + gridSizeY - ball.radius;
    ball.vy *= ball.bounce;
  }
  else if(ball.y < offsety + ball.radius)
  {
    ball.y = offsety + ball.radius;
    ball.vy *= ball.bounce;
}
}  


