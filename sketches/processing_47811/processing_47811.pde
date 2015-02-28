
// Ball.pde

class Ball
{
  float xpos, ypos;
  float xvel, yvel;
  float radius = 5;
  
  Ball(float xpos, float ypos, float xvel, float yvel)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xvel = xvel;
    this.yvel = yvel;
  }
  
  void display()
  {
    fill(0);
    ellipse(xpos, ypos, 5, 5);
  }
  
  void update()
  {
    xpos += xvel;
    ypos += yvel;
  }
  
  void checkBoundingSquares(BoundingSquare thisSquare)
  {
    float squareCentreX = thisSquare.getCentreX();
    float squareCentreY = thisSquare.getCentreY();
    checkEdges(squareCentreX - 128, squareCentreX + 128, squareCentreY - 128, squareCentreY + 128);
  }
  
  void checkEdges(float leftEdge, float rightEdge, float topEdge, float bottomEdge)
  {
    if(xpos > rightEdge)
    {
      xpos = rightEdge;
      xvel *= -1;
    }
    if(xpos < leftEdge)
    {
      xpos = leftEdge;
      xvel *= -1;
    }
    if(ypos > bottomEdge)
    {
      ypos = bottomEdge;
      yvel *= -1;
    }
    if(ypos < topEdge)
    {
      ypos = topEdge;
      yvel *= -1;
    }
  }
}

  


// blobs13.pde

//moving blobs
//using co-ordinates from various colour spaces
//allonestring
//Sal Spring
//November 2011

int numBlobs = 7;
colourBlob[] blobs;
BoundingSquare[] squares;

String colourSpace = "RGB";

int untwist = -1;
int showBalls = -1;
int showSquares = -1;
int joinShapes = -1;
int ghostShapes = -1;
float ghostDist = 512;

Ball[][] balls = new Ball[numBlobs][3];
float maxVel = 2;
float minVel = -2;

BoundingSquare[] cornerSquares;
Ball[] cornerBalls;
float v = 0.5;


void setup()
{
  size(700, 700);
  background(255);
  smooth();

  blobs = new colourBlob[numBlobs];
  squares = new BoundingSquare[numBlobs];

  for (int s = 0; s < numBlobs; s++)
  {
    float centreX = random(width - 255);
    float centreY = random(height - 255);
    for (int b = 0; b < 3; b++)
    {
      float xvel = random(minVel, maxVel);
      float yvel = random(minVel, maxVel);
      balls[s][b] = new Ball(centreX + random(255), centreY + random(255), xvel, yvel);
    }
    squares[s] = new BoundingSquare(balls[s]);
  }
  
  cornerBalls = new Ball[4];
  cornerBalls[0] = new Ball(random(50, 100), random(50, 100), random(-v, v), random(-v, v));
  cornerBalls[1] = new Ball(random(width-100, width-50), random(50, 100), random(-v, v), random(-v, v));
  cornerBalls[2] = new Ball(random(width-100, width-50), random(height-100, height-50), random(-v, v), random(-v, v));
  cornerBalls[3] = new Ball(random(50, 100), random(height-100, height-50), random(-v, v), random(-v, v));
}

void draw()
{
 // background(192);
  fill(129,2);
  rect(0,0,width,height);
  //background blob
  for(int b = 0; b < 4; b++)
  {
    cornerBalls[b].update();
//    cornerBalls[b].display();
  }
  cornerBalls[0].checkEdges(50, 100, 50, 100);
  cornerBalls[1].checkEdges(width-100, width-50, 50, 100);
  cornerBalls[2].checkEdges(width-100, width-50, height-100, height-50);
  cornerBalls[3].checkEdges(50, 100, height-100, height-50);
  noStroke();
  fill(255, 13);//128
  beginShape();
  for(int c = 0; c < 4; c++) curveVertex(cornerBalls[c].xpos, cornerBalls[c].ypos);
  for(int c = 0; c < 4; c++) curveVertex(cornerBalls[c].xpos, cornerBalls[c].ypos);
  endShape();  

  //the main blobs
  for (int s = 0; s < numBlobs; s++)
  {
    for (int b = 0; b < 3; b++)
    {
      balls[s][b].update();
      balls[s][b].checkEdges(0, width, 0, height);
      balls[s][b].checkBoundingSquares(squares[s]);
      if(showBalls == 1) balls[s][b].display();
    }
  }
  for (int s = 0; s < numBlobs; s++)
  {
    if(showSquares == 1) squares[s].display();
    blobs[s] = new colourBlob(balls[s], squares[s]);
  }
  for (int s = 0; s < numBlobs; s++)
  {
    blobs[s].display();
  }
  
  //appearances
  if(ghostShapes == 1) displayGhostShapes();
  if(joinShapes == 1) displayJoinShapes();
}

void displayJoinShapes()
{
  if((numBlobs > 1) && (joinShapes == 1))
  {
    for(int s = 0; s < numBlobs - 1; s++)
    {
      for(int t = s + 1; t < numBlobs; t++)
      {
        float dx = squares[s].getCentreX() - squares[t].getCentreX();
        float dy = squares[s].getCentreY() - squares[t].getCentreY();
        float distance = sqrt(dx*dx + dy*dy);
        if(distance < 255)
        {
          float redVal = (red(blobs[s].getColour()) + red(blobs[t].getColour())) / 2;
          float greenVal = (green(blobs[s].getColour()) + green(blobs[t].getColour())) / 2;
          float blueVal = (blue(blobs[s].getColour()) + blue(blobs[t].getColour())) / 2;
          stroke(redVal, greenVal, blueVal, 255-distance);
          line(squares[s].getCentreX(), squares[s].getCentreY(), squares[t].getCentreX(), squares[t].getCentreY());
        }
      }
    }
  }
}

void displayGhostShapes()
{
  if((numBlobs > 2))
  {
    noStroke();
    color[] ghostColours = new color[numBlobs];
    for(int s = 0; s < numBlobs; s++)
    {
      int t = (s + 1) % numBlobs;
      int u = (s + 2) % numBlobs;
      float sx = squares[s].getCentreX();
      float sy = squares[s].getCentreY();
      float tx = squares[t].getCentreX();
      float ty = squares[t].getCentreY();
      float ux = squares[u].getCentreX();
      float uy = squares[u].getCentreY();
      float STdist = dist(sx, sy, tx, ty);
      float TUdist = dist(tx, ty, ux, uy);
      float USdist = dist(ux, uy, sx, sy);
      
      float maxDist = max(STdist, max(TUdist, USdist));
      if((STdist < ghostDist) && (TUdist < ghostDist) && (USdist < ghostDist))
      {
        color sColour = blobs[s].getColour();
        color tColour = blobs[t].getColour();
        color uColour = blobs[u].getColour();
        float redVal = makePaler((red(sColour) + red(tColour) + red(uColour)) / 3);
        float greenVal = makePaler((green(sColour) + green(tColour) + green(uColour)) / 3);
        float blueVal = makePaler((blue(sColour) + blue(tColour) + blue(uColour)) / 3);
        float alphaVal = map(maxDist, 0, ghostDist, 255, 0);
        ghostColours[s] = color(redVal, greenVal, blueVal, alphaVal);

        fill(ghostColours[s]);
        beginShape();
        for(int i = 0; i < 2; i++)
        {
          curveVertex(sx, sy);
          curveVertex(tx, ty);
          curveVertex(ux, uy);
        }
        endShape();
      }
    }
  }    
}

float makePaler(float startValue)
{
  return (startValue + 2 * (255 - startValue) / 3);
}

void keyPressed()
{
  //colourSpaces
  if (key == 'c' || key == 'C') colourSpace = "CMYK";
  if (key == 'h' || key == 'H') colourSpace = "HSL";
  if (key == 'x' || key == 'X') colourSpace = "XYZ";
  if (key == 'l' || key == 'L') colourSpace = "LAB";
  if (key == 'r' || key == 'R') colourSpace = "RGB";

  //appearances
  if (key == 't' || key == 'T') untwist *= -1;
  if (key == 'b' || key == 'B') showBalls *= -1;
  if (key == 's' || key == 'S') showSquares *= -1;
  if (key == 'j' || key == 'J') joinShapes *= -1;
  if (key == 'g' || key == 'G') ghostShapes *= -1;

  //print
  if (key == 'p' || key == 'P')  
  {
    saveFrame();
  }
}



  


// BoundingSquare.pde

class BoundingSquare
{
  float centreX, centreY;
  Ball[] balls;
  Ball ball;


  BoundingSquare(Ball[] balls)
  {
    this.balls = balls;
    this.centreX = getCentreX();
    this.centreY = getCentreY();
  }
  void display()
  {
    noFill();
    stroke(0);
    rect(getCentreX() - 128, getCentreY() - 128, 256, 256);
  }

  float getCentreX()
  {
    float totalX = 0;
    for(int b = 0; b < balls.length; b++) totalX += balls[b].xpos;
    return (totalX / balls.length);
  }
  float getCentreY()
  {
    float totalY = 0;
    for(int b = 0; b < balls.length; b++) totalY += balls[b].ypos;
    return (totalY / balls.length);
  }
}



  


// colourBlob.pde

class colourBlob
{
  Ball[] balls, blobBalls;
  BoundingSquare thisSquare;
  int numVertices;
  PVector[] verticesX, verticesY, verticesXY;
  float[] xColours;
  float[] yColours;


  colourBlob(Ball[] blobBalls, BoundingSquare thisSquare)
  {
    this.blobBalls = blobBalls;
    this.thisSquare = thisSquare;
    mapBalls();
    makeColours();
  }
  
  //change the balls' values so that the shapes stay within the bounding squares
  void mapBalls()
  {
    balls = new Ball[blobBalls.length];
    for(int b = 0; b < balls.length; b++)
    {
      float xpos = thisSquare.getCentreX() + 128 - blobBalls[b].xpos;
      float ypos = thisSquare.getCentreY() + 128 - blobBalls[b].ypos;
      balls[b] = new Ball(xpos, ypos, 0, 0);
    }
  }
  

  void makeColours()
  {
    if (colourSpace == "CMYK")
    {
      xColours = convertRGBtoCMYK(balls[0].xpos, balls[1].xpos, balls[2].xpos);
      yColours = convertRGBtoCMYK(balls[0].ypos, balls[1].ypos, balls[2].ypos);
    }
    else if (colourSpace == "HSL")
    {
      xColours = convertRGBtoHSL(balls[0].xpos, balls[1].xpos, balls[2].xpos);
      yColours = convertRGBtoHSL(balls[0].ypos, balls[1].ypos, balls[2].ypos);
    }
    else if (colourSpace == "LAB")
    {
      //need to convert via XYZ first
      float[] tempxColours = convertRGBtoXYZ(balls[0].xpos, balls[1].xpos, balls[2].xpos);
      float[] tempyColours = convertRGBtoXYZ(balls[0].ypos, balls[1].ypos, balls[2].ypos);

      xColours = convertXYZtoLAB(tempxColours);
      yColours = convertXYZtoLAB(tempyColours);
    }
    else if (colourSpace == "XYZ")
    {
      xColours = convertRGBtoXYZ(balls[0].xpos, balls[1].xpos, balls[2].xpos);
      yColours = convertRGBtoXYZ(balls[0].ypos, balls[1].ypos, balls[2].ypos);
    }
    else //colourSapce = RGB
    {
      float[] tempxColours = {balls[0].xpos, balls[1].xpos, balls[2].xpos};
      float[] tempyColours = {balls[0].ypos, balls[1].ypos, balls[2].ypos};
      xColours = tempxColours;
      yColours = tempyColours;
    }
  }

  color getColour()
  {
    float medRed = (balls[0].xpos + balls[0].ypos) / 2;
    float medGreen = (balls[1].xpos + balls[1].ypos) / 2;
    float medBlue = (balls[2].xpos + balls[2].ypos) / 2;
    return  color(medRed, medGreen, medBlue, 192);
  }

    

  void makeVertices()
  {
    if (colourSpace == "CMYK") numVertices = 4;
    else numVertices = 3;
    verticesX = new PVector[numVertices];
    verticesY = new PVector[numVertices];
    verticesXY = new PVector[numVertices];
    for (int v = 0; v < numVertices; v++)
    {
      verticesX[v] = new PVector(xColours[v], xColours[(v+1)%numVertices]);
      verticesY[v] = new PVector(yColours[v], yColours[(v+1)%numVertices]);
      verticesXY[v] = new PVector(xColours[v], yColours[v]);
    }
  }

  void display()
  {
    makeVertices();
    
    for(int v = 0; v < numVertices; v++)
    {
      float offsetX = thisSquare.getCentreX() - 128;
      float offsetY = thisSquare.getCentreY() - 128;
      verticesX[v].x += offsetX;
      verticesX[v].y += offsetY;
      verticesY[v].x += offsetX;
      verticesY[v].y += offsetY;
      verticesXY[v].x += offsetX;
      verticesXY[v].y += offsetY;
    }

    if ((colourSpace == "CMYK") && (untwist == 1)) 
    {
      verticesX = untwistShape(verticesX);
      verticesY = untwistShape(verticesY);
      verticesXY = untwistShape(verticesXY);
    }

    noStroke();
    fill(getColour());
    beginShape();
    for (int v = 0; v < numVertices; v++) curveVertex(verticesXY[v].x, verticesXY[v].y);
    for (int v = 0; v < numVertices; v++) curveVertex(verticesXY[v].x, verticesXY[v].y);
    endShape();

    fill(balls[0].xpos, balls[1].xpos, balls[2].xpos, 64);
    beginShape();
    for (int v = 0; v < numVertices; v++) curveVertex(verticesX[v].x, verticesX[v].y);
    for (int v = 0; v < numVertices; v++) curveVertex(verticesX[v].x, verticesX[v].y);
    endShape();

    fill(balls[0].ypos, balls[1].ypos, balls[2].ypos, 64);
    beginShape();
    for (int v = 0; v < numVertices; v++) curveVertex(verticesY[v].x, verticesY[v].y);
    for (int v = 0; v < numVertices; v++) curveVertex(verticesY[v].x, verticesY[v].y);
    endShape();
  }

  //sort vertices clockwise from midpoint
  PVector[] untwistShape(PVector[] vertices)
  {
    float midpointX = 0;
    float midpointY = 0;

    for (int v = 0; v < vertices.length; v++)
    {
      midpointX += vertices[v].x;
      midpointY += vertices[v].y;
    }

    midpointX /= vertices.length;
    midpointY /= vertices.length;

    float[] anglesToVertices = new float[vertices.length];
    for (int v = 0; v < vertices.length; v++)
    {
      float dx = midpointX - vertices[v].x;
      float dy = midpointY - vertices[v].y;
      anglesToVertices[v] = atan2(dy, dx);
    }

    int[] sortedArray = new int[anglesToVertices.length];

    for (int i = 0; i < sortedArray.length; i++)
    {
      int arrayIndex = 80; //something much bigger than largest array length
      float minTestValue = 1000; // something much bigger than largest value

      for (int j = 0; j < anglesToVertices.length; j++)
      {
        if (anglesToVertices[j] < minTestValue)
        {
          minTestValue = anglesToVertices[j];
          arrayIndex = j;
        }
      }
      sortedArray[i] = arrayIndex;
      anglesToVertices[sortedArray[i]] = 1000;
    }

    PVector[] returnArray = new PVector[vertices.length];
    for (int a = 0; a < vertices.length; a++)
    {
      returnArray[a] = vertices[sortedArray[a]];
    }

    return returnArray;
  }


  //colour conversions
  //all colour space values mapped to 0-255 for display
  float[] convertRGBtoCMYK(float pos0, float pos1, float pos2)
  {
    float cyan = 1 - (pos0 / 255);
    float magenta = 1 - (pos1 / 255);
    float yellow = 1 - (pos2 / 255);
    float black = 1;

    if (cyan < black) black = cyan;
    if (magenta < black) black = magenta;
    if (yellow < black) black = yellow;

    if (black == 1) //black
    {
      cyan = 0;
      magenta = 0;
      yellow = 0;
    }
    else
    {
      cyan = (cyan - black) / (1 - black);
      magenta = (magenta - black) / (1 - black);
      yellow = (yellow - black) / (1 - black);
    }

    cyan = map(cyan, 0, 1, 0, 255);
    magenta = map(magenta, 0, 1, 0, 255);
    yellow = map(yellow, 0, 1, 0, 255);
    black = map(black, 0, 1, 0, 255);

    float[] tempColours = new float[4];
    tempColours[0] = cyan;
    tempColours[1] = magenta;
    tempColours[2] = yellow;
    tempColours[3] = black;

    return tempColours;
  }

  //conversion matrix from http://www.brucelindbloom.com/index.html?Eqn_RGB_to_XYZ.html
  float[] convertRGBtoXYZ(float redbit, float greenbit, float bluebit)
  {
    float xbit = (0.6326696 * redbit + 0.2045558 * greenbit + 0.1269946 * bluebit);
    float ybit = (0.2284569 * redbit + 0.7373523 * greenbit + 0.0341908 * bluebit);
    float zbit = (0 * redbit + 0.0095142 * greenbit + 0.8156958 * bluebit);

    float[] tempColours = new float[3];
    tempColours[0] = xbit;
    tempColours[1] = ybit;
    tempColours[2] = zbit;

    return tempColours;
  }

  //conversion http://www.easyrgb.com/index.php?X=MATH&H=18#text18
  float[] convertRGBtoHSL(float redbit, float greenbit, float bluebit)
  {
    float tempR = redbit / 255;
    float tempG = greenbit / 255;
    float tempB = bluebit / 255;

    float Lvalue = 0;
    float Hvalue = 0;
    float Svalue = 0;    

    float maxValue = max(tempR, tempG, tempB);
    float minValue = min(tempR, tempG, tempB);
    float diff = maxValue - minValue;

    Lvalue = (maxValue + minValue) / 2.0;

    Svalue = diff;
    if (Svalue > 0)
    {
      if (Lvalue < 0.5) Svalue /= (maxValue + minValue);
      else Svalue /= (2 - maxValue - minValue);
    }

    float someRed = (maxValue - tempR) / diff;
    float someGreen = (maxValue - tempG) / diff;
    float someBlue = (maxValue - tempB) / diff;

    if (tempR == maxValue)
    {
      if (tempG == minValue) Hvalue = 5 + someBlue;
      else Hvalue = 1 - someGreen;
    }
    else if (tempG == maxValue)
    {
      if (tempB == minValue) Hvalue = 1 + someRed;
      else Hvalue = 3 - someBlue;
    }
    else
    {
      if (tempR == minValue) Hvalue = 3 + someGreen;
      else Hvalue = 5 - someRed;
    }
    Hvalue /= 6;

    Hvalue = map(Hvalue, 0, 1, 0, 255);
    Svalue = map(Svalue, 0, 1, 0, 255);
    Lvalue = map(Lvalue, 0, 1, 0, 255);

    float[] tempColours = new float[3];
    tempColours[0] = Hvalue;
    tempColours[1] = Svalue;
    tempColours[2] = Lvalue;

    return tempColours;
  }

  // conversion http://www.brucelindbloom.com/index.html?Eqn_RGB_to_XYZ.html
  float[] convertXYZtoLAB(float[] xyzValues)
  {
    xyzValues[0] /= 255;
    xyzValues[1] /= 255;
    xyzValues[2] /= 255;

    float tempX = 0;
    float tempY = 0;
    float tempZ = 0;

    if (xyzValues[0] > 0.008856)
    {
      tempX = pow(xyzValues[0], 0.333);
    }
    else
    {
      tempX = (903.3 * xyzValues[0] + 16) / 116;
    }
    if (xyzValues[1] > 0.008856) 
    {
      tempY = pow(xyzValues[1], 0.333);
    }
    else
    {
      tempY = (903.3 * xyzValues[1] + 16) / 116;
    }
    if (xyzValues[2] > 0.008856) 
    {
      tempZ = pow(xyzValues[2], 0.333);
    }
    else
    {
      tempZ = (903.3 * xyzValues[2] + 16) / 116;
    }

    float Light = (116 * tempY) - 16;
    float aStar = 500 * (tempX - tempY);
    float bStar = 200 * (tempY - tempZ);

    Light = map(Light, -200, 200, 0, 255);
    aStar = map(aStar, -200, 200, 0, 255);
    bStar = map(bStar, -200, 200, 0, 255);

    float[] tempColours = new float[3];
    tempColours[0] = Light;
    tempColours[1] = aStar;
    tempColours[2] = bStar;

    return tempColours;
  }
}


  
