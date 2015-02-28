
//Declaring variable for game parameter
int desiredFPS = 30;
float distance;
float time;
float boardOccurence = 0.5;
float gravity;
float jumpSpeed;

//Declaring variable for doodle
boolean doodleOnBoard;
float doodleXPos;
float doodleYPos;
float doodleYPos_e;
float doodleYVel;
float doodleRad;

//Declaring variable for stepping board
int boardXCount = 5;
int boardYCount = 10;
float boardWidth;
float boardThickness;
boolean boardStat[][];
float boardYPos[];
float BoardRPos[][];
float BoardGPos[][];
float BoardBPos[][];

//Declaring variable for background color
int backgroundRPos;
int backgroundGPos;
int backgroundBPos;
int backgroundRVel;
int backgroundGVel;
int backgroundBVel;

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

//Declaring variable for temporary random number
float tempRandom;

//Declaring setup method
void setup()
{
  //Declaring window size
  size(600,600);
  //Setting up frame rate
  frameRate(desiredFPS);
  //Resetting distance
  distance = 0;
  //Calculating board dimension
  boardWidth = width/boardXCount;
  boardThickness = height/boardYCount/10;
  //Initiating stepping boards
  boardStat = new boolean[boardYCount][boardXCount];
  for (int j = 0; j < boardXCount; j++)
  {
    boardStat[0][j] = true;
  }
  for (int i = 1; i < boardYCount; i++)
  {
    for (int j = 0; j < boardXCount; j++)
    {
      //Declaring random number for board generation
      tempRandom = random(1);
      if (tempRandom < boardOccurence)
      {
        boardStat[i][j] = true;
      }
      else
      {
        boardStat[i][j] = false;
      }
    }
  }
  boardYPos = new float[boardYCount];
  for (int i = 0; i < boardYCount; i++)
  {
    boardYPos[i] = (0.1*i*height);
  }
  //Initiating doodle
  doodleOnBoard = true;
  doodleXPos = 0;
  doodleYPos = 0;
  doodleYVel = 0;
  doodleRad = 0.025*height;
  //Initiating environment variable
  gravity = 0.125*height/desiredFPS/desiredFPS;
  jumpSpeed = 0.25*height/desiredFPS;
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
}

//Declaring main loop
void draw()
{
  //Drawing background
  background(0);
  //Translating everything
  distance = max(distance,doodleYPos);
  translate(0,max(distance-(0.5*height),0));
  //Displaying current distance
  textAlign(CENTER);
  text(str(int(distance)),width/2,height-max(distance-(0.5*height),0),width,40);
  //Drawing stepping board
  for (int i = 0; i < boardYCount; i++)
  {
    for (int j = 0; j < boardXCount; j++)
    {
      if (boardStat[i][j])
      {
        rectMode(CENTER);
        rect((0.5+j)*boardWidth,height-boardYPos[i],boardWidth,boardThickness);
      }
    }
  }
  //Clearing unseen board and adding new one
  if (boardYPos[0] < distance - (0.5*height))
  {
    //Shifting board's array
    for (int i = 0; i < boardYCount-1; i++)
    {
      for (int j = 0; j < boardXCount; j++)
      {
        boardStat[i][j] = boardStat[i+1][j];
      }
      boardYPos[i] = boardYPos[i+1];
    }
    //Creating new boards
    for (int j = 0; j < boardXCount; j++)
    {
      //Declaring random number for board generation
      tempRandom = random(1);
      if (tempRandom < boardOccurence)
      {
        boardStat[boardYCount-1][j] = true;
      }
      else
      {
        boardStat[boardYCount-1][j] = false;
      }
      //Placing new boards on higher location
      boardYPos[boardYCount-1] = boardYPos[boardYCount-2]+(0.1*height);  
    }
  }
  //Drawing doodle
  doodleXPos = mouseX;
  ellipseMode(CENTER);
  ellipse(doodleXPos,height-(doodleYPos+(0.5*doodleRad)),doodleRad,doodleRad);
  //Updating doodle position and applying some physics
  if (doodleOnBoard)
  {
    if (!boardStat[getYIndOfClosestLowerBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)])
    {
      doodleOnBoard = false;
      doodleYVel = -gravity;
      doodleYPos = doodleYPos-doodleYVel;
    }
  }
  if (!doodleOnBoard)
  {
    //Moving doodle
    doodleYPos_e = doodleYPos + doodleYVel;
    doodleYVel = doodleYVel - gravity;
    //Anticipating doodle stepping on board
    if ((doodleYVel < 0) && (doodleYPos_e < getYPosOfClosestLowerBoard(doodleYPos)) && (boardStat[getYIndOfClosestLowerBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)]))
    {
      doodleOnBoard = true;
      doodleYPos = getYPosOfClosestLowerBoard(doodleYPos);
      doodleYVel = 0;
    }
    //Anticipating doodle heading the board
    else if ((doodleYVel > 0) && (doodleYPos_e > getYPosOfClosestUpperBoard(doodleYPos)) && (boardStat[getYIndOfClosestUpperBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)]))
    {
      boardStat[getYIndOfClosestUpperBoard(doodleYPos)][getXIndOfClosestBoard(doodleXPos)] = false;
      doodleYPos = getYPosOfClosestUpperBoard(doodleYPos);
      doodleYVel = 0;
    }
    //Executing normal aerial
    else
    {
      doodleYPos = doodleYPos_e;
    }
  }
  //Drawing line
  for (int i = 0; i < n_line; i++)
  {
    stroke(lineRPos[i],lineGPos[i],lineBPos[i]);
    for (int k = 0; k < n_tail; k++)
    {
      for (int j = 0; j < n_side-1; j++)
      {
        line(lineXPos[i][j][k],lineYPos[i][j][k]-max(distance-(0.5*height),0),lineXPos[i][j+1][k],lineYPos[i][j+1][k]-max(distance-(0.5*height),0));
      }
      line(lineXPos[i][n_side-1][k],lineYPos[i][n_side-1][k]-max(distance-(0.5*height),0),lineXPos[i][0][k],lineYPos[i][0][k]-max(distance-(0.5*height),0));
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
  //Checking for game over
  if (doodleYPos < max(distance-(0.5*height),0))
  {
    exit();
  }
}

//Declaring  method to anticipate mouse click
void mouseClicked()
{
  if (doodleOnBoard)
  {
    doodleOnBoard = false;
    doodleYVel = jumpSpeed;
  }
}

//Declaring method to find the X index of the closest board
int getXIndOfClosestBoard(float doodleXPos)
{
  return floor(doodleXPos/(width/boardXCount));
}

//Declaring method to find the Y index of the closest upper board
int getYIndOfClosestLowerBoard(float doodleYPos)
{
  //return floor((doodleYPos)/(height/boardYCount));
  return floor((doodleYPos-max(distance-(0.5*height),0))/(height/boardYCount));
}

//Declaring method to find the Y index of the closest lower board
int getYIndOfClosestUpperBoard(float doodleYPos)
{
  //return ceil((doodleYPos+1)/(height/boardYCount));
  return ceil((doodleYPos-max(distance-(0.5*height),0))/(height/boardYCount));
}

//Declaring method to find the Y position of the closest lower board
float getYPosOfClosestLowerBoard(float doodleYPos)
{
  return floor(doodleYPos/(height/boardYCount))*(height/boardYCount);
}

//Declaring method to find the Y position of the closest upper board 
float getYPosOfClosestUpperBoard(float doodleYPos)
{
  return ceil((doodleYPos+1)/(height/boardYCount))*(height/boardYCount)-(doodleRad);
}


