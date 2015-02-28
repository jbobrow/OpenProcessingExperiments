
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49760*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

/* @pjs preload=""yellow.png, orange.png, red.png, pink.png, purple.png, blue.png, green.png, snow.png, white.png"; */


PImage thisImage;

PFont thisBigFont;
PFont thisSmallFont;

int minSize;
int closeEnough;
ArrayList squares;
int minSquareSizeFound;

ArrayList joinTheseSquares;
int joiningThisSize;
String nextIdent;

float easing = 0.05;


void setup()
{
  size(512, 512);
  background(255);
//    noLoop();
//  frameRate(12);

  noStroke();
  smooth();
  
  thisBigFont = loadFont("CourierNewPSMT-24.vlw");
  thisSmallFont = loadFont("CourierNewPSMT-12.vlw");


  doStartStuff();
  
  //something's gone wrong with recursive splitting so start again
  if(minSquareSizeFound > width)
  {
    background(255);
    doStartStuff();
  }
}

void draw()
{
  background(255);
  
  if(squares.size() > 1)
  {  
    for (int s = 0; s < squares.size(); s++)
    {
      Square thisSquare = (Square) squares.get(s);
      thisSquare.displayBlob();
      thisSquare.boundMovement();
      for (int b = 0; b < 4; b++)
      {
        thisSquare.balls[b].update();
      }
    }
    int countThisSize = 0;
    for(int c = 0; c < squares.size(); c++)
    {
      Square thisSquare = (Square) squares.get(c);
      if(thisSquare.squareSize == joiningThisSize) countThisSize++;
    }
    if(countThisSize > 0) joinSquares(joiningThisSize);
    else joiningThisSize *= 2;
  }
  else doEndStuff();
}

void mouseClicked()
{
  doStartStuff();
}

      
      

  






class Ball
{
  PVector position;
  PVector velocity;
  
  Ball(PVector position)
  {
    this.position = position;
    this.velocity = velocity;
  }
  
  void display()
  {
    fill(0);
    noStroke();
    ellipse(position.x, position.y, velocity.x, velocity.y);
  }
  
  void update()
  {
    position.add(velocity);
  }
  
  void easeTo(float xtarget, float ytarget)
  {
    position.x += (xtarget - position.x) * easing;
    position.y += (ytarget - position.y) * easing;
  }
  
  void checkEdges(float leftEdge, float rightEdge, float topEdge, float bottomEdge)
  {
    if(position.x > rightEdge)
    {
      position.x = rightEdge;
      velocity.x *= -1;
    }
    if(position.x < leftEdge)
    {
      position.x = leftEdge;
      velocity.x *= -1;
    }
    if(position.y > bottomEdge)
    {
      position.y = bottomEdge;
      velocity.y *= -1;
    }
    if(position.y < topEdge)
    {
      position.y = topEdge;
      velocity.y *= -1;
    }
  }
}


class Square
{
  int xpos, ypos;
  int squareSize;
  String ident;
  color fillColour;
  float fillAlpha = 128;
  Ball[] balls = new Ball[4];
  float minVel = -0.5;
  float maxVel = 0.5;
  
  Square(int xpos, int ypos, int squareSize, String ident)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.squareSize = squareSize;
    this.ident = ident;

    this.fillColour = fillColour;
    this.balls = balls;
    makeCornerBalls();
  }
  
  void makeCornerBalls()
  {
    balls[0] = new Ball(new PVector(xpos, ypos));
    balls[1] = new Ball(new PVector(xpos + squareSize, ypos));
    balls[2] = new Ball(new PVector(xpos + squareSize, ypos + squareSize));
    balls[3] = new Ball(new PVector(xpos, ypos + squareSize));
    for(int b = 0; b < 4; b++)
    {
      balls[b].velocity = new PVector(random(minVel, maxVel), random(minVel, maxVel));
    }
  }
  
  void easeToAlpha(float targetAlpha)
  {
    fillAlpha += (targetAlpha - fillAlpha) * easing;
  }
    
  
  void boundMovement()
  {
    float squidgex = squareSize / 10;
    float squidgey = squareSize / 10;
    float leftEdge = xpos;
    float rightEdge = xpos + squareSize;
    float topEdge = ypos;
    float bottomEdge = ypos + squareSize;
    
    balls[0].checkEdges(leftEdge - squidgex, leftEdge + squidgex, topEdge - squidgey, topEdge + squidgey);
    balls[1].checkEdges(rightEdge - squidgex, rightEdge + squidgex, topEdge - squidgey, topEdge + squidgey);
    balls[2].checkEdges(rightEdge - squidgex, rightEdge + squidgex, bottomEdge - squidgey, bottomEdge + squidgey);
    balls[3].checkEdges(leftEdge - squidgex, leftEdge + squidgex, bottomEdge - squidgey, bottomEdge + squidgey);
  }
  
  void displayBlob()
  {
    fill(fillColour, fillAlpha);
    noStroke();
    beginShape();
    curveVertex(balls[0].position.x, balls[0].position.y);
    curveVertex(balls[1].position.x, balls[1].position.y);
    curveVertex(balls[2].position.x, balls[2].position.y);
    curveVertex(balls[3].position.x, balls[3].position.y);
    curveVertex(balls[0].position.x, balls[0].position.y);
    curveVertex(balls[1].position.x, balls[1].position.y);
    curveVertex(balls[2].position.x, balls[2].position.y);
    curveVertex(balls[3].position.x, balls[3].position.y);
    endShape();
  }  
}
Boolean checkColoursCloseEnough(int xpos, int ypos, int squareSize)
{
  Boolean coloursCloseEnough = false;
  if(checkRedCloseEnough(xpos, ypos, squareSize))
  {
    if(checkGreenCloseEnough(xpos, ypos, squareSize))
    {
      if(checkBlueCloseEnough(xpos, ypos, squareSize))
      {
        coloursCloseEnough = true;
      }
    }
  }
  return coloursCloseEnough;
}

Boolean checkRedCloseEnough(int xpos, int ypos, int squareSize)
{
  Boolean redCloseEnough = true;
  float averageRed = makeAverageRed(xpos, ypos, squareSize);
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      float thisRed = red(thisImage.get(iScaled, jScaled));
      if(abs(thisRed - averageRed) > closeEnough)
      {
        redCloseEnough = false;
        break;
      }
    }
  }
  return redCloseEnough;
}
Boolean checkGreenCloseEnough(int xpos, int ypos, int squareSize)
{
  Boolean greenCloseEnough = true;
  float averageGreen = makeAverageGreen(xpos, ypos, squareSize);
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      float thisGreen = green(thisImage.get(iScaled, jScaled));
      if(abs(thisGreen - averageGreen) > closeEnough)
      {
        greenCloseEnough = false;
        break;
      }
    }
  }
  return greenCloseEnough;
}
Boolean checkBlueCloseEnough(int xpos, int ypos, int squareSize)
{
  Boolean blueCloseEnough = true;
  float averageBlue = makeAverageBlue(xpos, ypos, squareSize);
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      float thisBlue = blue(thisImage.get(iScaled, jScaled));
      if(abs(thisBlue - averageBlue) > closeEnough)
      {
        blueCloseEnough = false;
        break;
      }
    }
  }
  return blueCloseEnough;
}
      
color getAverageColour(int xpos, int ypos, int squareSize)
{
  float averageRed = makeAverageRed(xpos, ypos, squareSize);
  float averageGreen = makeAverageGreen(xpos, ypos, squareSize);
  float averageBlue = makeAverageBlue(xpos, ypos, squareSize);

  return color(averageRed, averageGreen, averageBlue);
}


float makeAverageRed(int xpos, int ypos, int squareSize)
{
  int reds = 0;
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      reds += red(thisImage.get(iScaled, jScaled));
    }
  }
  float squareArea = squareSize * squareSize;
  float averageRed = reds / squareArea;
  return averageRed;
}

float makeAverageGreen(int xpos, int ypos, int squareSize)
{
  int greens = 0;
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      greens += green(thisImage.get(iScaled, jScaled));
    }
  }
  float squareArea = squareSize * squareSize;
  float averageGreen = greens / squareArea;
  return averageGreen;
}

float makeAverageBlue(int xpos, int ypos, int squareSize)
{
  float blues = 0;
  for(int i = int(xpos); i < int(xpos + squareSize); i++)
  {
    for(int j = int(ypos); j < int(ypos + squareSize); j++)
    {
      int iScaled = int(i * thisImage.width / width);
      int jScaled = int(j * thisImage.height / height);
      blues += blue(thisImage.get(iScaled, jScaled));
    }
  }
  float squareArea = squareSize * squareSize;
  float averageBlue = blues / squareArea;
  return averageBlue;
}


void makeSquaresRecursively(int xpos, int ypos, int squareSize, String ident)
{
  if (squareSize < minSize) 
  {
    Square thisSquare = new Square(xpos, ypos, squareSize, ident);
    thisSquare.fillColour = getAverageColour(xpos, ypos, squareSize);
    squares.add(thisSquare);
    minSquareSizeFound = min(minSquareSizeFound, squareSize);
    return;
  }

  if (checkColoursCloseEnough(xpos, ypos, squareSize))
  {
    Square thisSquare = new Square(xpos, ypos, squareSize, ident);
    thisSquare.fillColour = getAverageColour(xpos, ypos, squareSize);
    squares.add(thisSquare);

  }
  else
  {
    int newSize = squareSize / 2;
    makeSquaresRecursively(xpos, ypos, newSize, "topLeft");
    makeSquaresRecursively(xpos+newSize, ypos, newSize, "topRight");
    makeSquaresRecursively(xpos, ypos+newSize, newSize, "bottomLeft");
    makeSquaresRecursively(xpos+newSize, ypos+newSize, newSize, "bottomRight");
  }
}

void joinSquares(int thisSize)
{
  int p = int(random(squares.size()));
  Square thisSquare = (Square) squares.get(p);
  if(thisSquare.squareSize == thisSize)
  {
    if(thisSquare.ident == "topLeft")
    {
      int newxpos = thisSquare.xpos;
      int newypos = thisSquare.ypos;
      
      //remove joined squares from squares arraylist
      findAndRemoveSquareAt(newxpos, newypos); //topleft
      findAndRemoveSquareAt(newxpos + thisSize, newypos); //topright
      findAndRemoveSquareAt(newxpos + thisSize, newypos + thisSize); //bottomright
      findAndRemoveSquareAt(newxpos, newypos + thisSize); //bottomleft

      //make a new bigger square with position same as smaller square p
      //and size double smaller square
      //and remove smaller child squares
      String ident = "um";
      int tempValueX = int(newxpos / (thisSize*2));
      int tempValueY = int(newypos / (thisSize*2));
      
      if( (tempValueX % 2 == 0) && (tempValueY % 2 == 0) ) ident = "topLeft";
      if( (tempValueX % 2 == 1) && (tempValueY % 2 == 0) )ident = "topRight";
      if( (tempValueX % 2 == 1) && (tempValueY % 2 == 1) ) ident = "bottomRight";
      if( (tempValueX % 2 == 0) && (tempValueY % 2 == 1) )ident = "bottomLeft";

      Square newBiggerSquare = new Square(newxpos, newypos, thisSize*2, ident);
      newBiggerSquare.fillColour = getAverageColour(newBiggerSquare.xpos, newBiggerSquare.ypos, newBiggerSquare.squareSize);
      squares.add(newBiggerSquare);
    }
  }
}

void findAndRemoveSquareAt(int thisxpos, int thisypos)
{
  for(int s = 0; s < squares.size(); s++)
  {
    Square thisSquare = (Square) squares.get(s);
    if((thisSquare.xpos == thisxpos) && (thisSquare.ypos == thisypos))
    {
      squares.remove(thisSquare);
    }
  }
}


ArrayList findSquaresThisSize(int thisSize)
{
  for(int s = 0; s < squares.size(); s++)
  {
    Square thisSquare = (Square) squares.get(s);
    if(thisSquare.squareSize == thisSize)
    {
      if(thisSquare.ident == "topLeft")
      {
        joinTheseSquares.add(s); //index of square in squares arraylist
      }
    }
  }
//  noLoop();
  return joinTheseSquares;
}


void doStartStuff()
{
  minSize = int(pow(2, int(random(5, 8))));
  closeEnough = int(pow(2, int(random(2, 7))));
  minSquareSizeFound = width * 2;

  int randomImage = (int)random(12);
  if(randomImage == 0) thisImage = loadImage("yellow.png");
  if(randomImage == 1) thisImage = loadImage("orange.png");
  if(randomImage == 2) thisImage = loadImage("red.png");
  if(randomImage == 3) thisImage = loadImage("pink.png");
  if(randomImage == 4) thisImage = loadImage("purple.png");
  if(randomImage == 5) thisImage = loadImage("blue.png");
  if(randomImage == 6) thisImage = loadImage("green.png");
  if(randomImage == 7) thisImage = loadImage("snow.png");
  if(randomImage == 8) thisImage = loadImage("white.png");
  if(randomImage == 9) thisImage = loadImage("grey.png");
  if(randomImage == 10) thisImage = loadImage("black.png");
  if(randomImage == 11) thisImage = loadImage("brown.png");

  squares = new ArrayList();  
  makeSquaresRecursively(0, 0, width, "um");

  joinTheseSquares = new ArrayList();
  joiningThisSize = minSquareSizeFound;
}

void doEndStuff()
{
  Square thisSquare = (Square) squares.get(0);
  thisSquare.displayBlob();
  thisSquare.easeToAlpha(0);
  for (int b = 0; b < 4; b++)
  {
    thisSquare.balls[b].easeTo(width/2, height/2);
    thisSquare.balls[b].update();
    if(dist(thisSquare.balls[b].position.x, thisSquare.balls[b].position.y, width/2, height/2) < 16)
    { 
      doStartStuff();
    }
  }
}



