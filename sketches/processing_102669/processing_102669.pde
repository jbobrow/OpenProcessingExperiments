
//Declaring variables for sketch setting
int desiredFPS = 30;
//Declaring variables for line drawing
int n_line;
int n_side;
int n_tail;
float[][][] lineXPos;
float[][][] lineYPos;
float[][][] lineXVel;
float[][][] lineYVel;
float[] lineRPos;
float[] lineGPos;
float[] lineBPos;
float[] lineRVel;
float[] lineGVel;
float[] lineBVel;
int BGRPos;
int BGRVel;
int BGGPos;
int BGGVel;
int BGBPos;
int BGBVel;

//Declaring setup method
void setup()
{
  //Setting up window size
  size(600,600);
  //Setting up frame rate
  frameRate(desiredFPS);
  //Setting up line generation parameter
  n_line = 2;
  n_side = 4;
  n_tail = 6;
  //Initiating line properties
  lineXPos = new float[n_line][n_side][n_tail];
  lineYPos = new float[n_line][n_side][n_tail];
  lineXVel = new float[n_line][n_side][n_tail];
  lineYVel = new float[n_line][n_side][n_tail];
  lineRPos = new float[n_line];
  lineGPos = new float[n_line];
  lineBPos = new float[n_line];
  lineRVel = new float[n_line];
  lineGVel = new float[n_line];
  lineBVel = new float[n_line];
  //Randomly placing vertexes as line head
  for (int i = 0; i < n_line; i++)
  {
    for (int j = 0; j < n_side; j++)
    {
      lineXPos[i][j][0] = width*(random(1));
      lineYPos[i][j][0] = height*(random(1));
      lineXVel[i][j][0] = 0.25*width*(random(1))/desiredFPS;
      lineYVel[i][j][0] = 0.25*height*(random(1))/desiredFPS;
    }
    lineRPos[i] = random(255);
    lineGPos[i] = random(255);
    lineBPos[i] = random(255);
    lineRVel[i] = 0.5*random(255)/desiredFPS;
    lineGVel[i] = 0.5*random(255)/desiredFPS;
    lineBVel[i] = 0.5*random(255)/desiredFPS;
  }
  //Placing tail vertexes
  for (int i = 0; i < n_line; i++)
  {
    for (int j = 0; j < n_side; j++)
    {
      for (int k = 1; k < n_tail; k++)
      {
        lineXPos[i][j][k] = lineXPos[i][j][k-1] - lineXVel[i][j][0];
        lineYPos[i][j][k] = lineYPos[i][j][k-1] - lineYVel[i][j][0];
        lineXVel[i][j][k] = lineXVel[i][j][k-1];
        lineYVel[i][j][k] = lineYVel[i][j][k-1];
      }
    }
  }
  //Correcting tail vertexes
  for (int i = 0; i < n_line; i++)
  {
    for (int j = 0; j < n_side; j++)
    {
      for (int k = 1; k < n_tail; k++)
      {
        if (lineXPos[i][j][k] < 0)
        {
          lineXPos[i][j][k] = -lineXPos[i][j][k];
          lineXVel[i][j][k] = -lineXVel[i][j][k];
        }
        if (lineXPos[i][j][k] > width)
        {
          lineXPos[i][j][k] = width-lineXPos[i][j][k];
          lineXVel[i][j][k] = -lineXVel[i][j][k];
        }
        if (lineYPos[i][j][k] < 0)
        {
          lineYPos[i][j][k] = -lineYPos[i][j][k];
          lineYVel[i][j][k] = -lineYVel[i][j][k];
        }
        if (lineYPos[i][j][k] > height)
        {
          lineYPos[i][j][k] = height-lineYPos[i][j][k];
          lineYVel[i][j][k] = -lineYVel[i][j][k];
        }
      }
    }
  }
  //Initiating background properties
  BGRPos = 0;
  BGGPos = 0;
  BGBPos = 0;
  BGRVel = (int) (0.5*random(255)/desiredFPS);
  BGGVel = (int) (0.5*random(255)/desiredFPS);
  BGBVel = (int) (0.5*random(255)/desiredFPS);
}

//Declaring main loop
void draw()
{
  //Cleaning screen and recreating background
  background(BGRPos,BGGPos,BGBPos);
//  BGRPos = BGRPos + BGRVel;
//  if ((BGRPos < 0) || (BGRPos > 255))
//  {
//    BGRVel = -BGRVel;
//    BGRPos = BGRPos + BGRVel;
//  }
//  BGGPos = BGGPos + BGGVel;
//  if ((BGGPos < 0) || (BGGPos > 255))
//  {
//    BGGVel = -BGGVel;
//    BGGPos = BGGPos + BGGVel;
//  }
//  BGBPos = BGBPos + BGBVel;
//  if ((BGBPos < 0) || (BGBPos > 255))
//  {
//    BGBVel = -BGBVel;
//    BGBPos = BGBPos + BGBVel;
//  }
  //Drawing line
  for (int i = 0; i < n_line; i++)
  {
    stroke(lineRPos[i],lineGPos[i],lineBPos[i]);
    for (int k = 0; k < n_tail; k++)
    {
      for (int j = 0; j < n_side-1; j++)
      {
        line(lineXPos[i][j][k],lineYPos[i][j][k],lineXPos[i][j+1][k],lineYPos[i][j+1][k]);
      }
      line(lineXPos[i][n_side-1][k],lineYPos[i][n_side-1][k],lineXPos[i][0][k],lineYPos[i][0][k]);
    }
  }
  //Updating line position and velocity
  for (int i = 0; i < n_line; i++)
  {
    for (int j = 0; j < n_side; j++)
    {
      for (int k = 0; k < n_tail; k++)
      {
        //Correcting x position
        lineXPos[i][j][k] = lineXPos[i][j][k] + lineXVel[i][j][k];
        if ((lineXPos[i][j][k] < 0) || (lineXPos[i][j][k] > width))
        {
          lineXVel[i][j][k] = -lineXVel[i][j][k];
        }
        //Correcting y position
        lineYPos[i][j][k] = lineYPos[i][j][k] + lineYVel[i][j][k];
        if ((lineYPos[i][j][k] < 0) || (lineYPos[i][j][k] > height))
        {
          lineYVel[i][j][k] = -lineYVel[i][j][k];
        }
      }
    }
  } 
  //Updating line color
  for (int i = 0; i < n_line; i++)
  {
    lineRPos[i] = lineRPos[i] + lineRVel[i];
    if ((lineRPos[i] < 0) || (lineRPos[i] > 255))
    {
      lineRVel[i] = -lineRVel[i];
    }
    lineGPos[i] = lineGPos[i] + lineGVel[i];
    if ((lineGPos[i] < 0) || (lineGPos[i] > 255))
    {
      lineGVel[i] = -lineGVel[i];
    }
    lineBPos[i] = lineBPos[i] + lineBVel[i];
    if ((lineBPos[i] < 0) || (lineBPos[i] > 255))
    {
      lineBVel[i] = -lineBVel[i];
    }
  }
}


