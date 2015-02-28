
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/96985*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//gridcollision
//jan 2013 
//fixed (I hope!) april 2013
//Sal Spring allonestring.co.uk
//started life based on Keith Peters Advanced AS animation
//but took on a life of its own
//excuse the inelegance!


float maxDiameter = 5;
Ball[] balls;
int numBalls = 1000;

GridElement[][] theGrid; //a 2D array of GridElements (or cells)
float gridSize = maxDiameter;
int numCellsX, numCellsY;
boolean displayGrid = false;

float alphaDist = 50;


void setup()
{
  size(500, 500);
  background(255);
  smooth();
  
//  noLoop();

  numCellsX = ceil(width / gridSize) + 1;
  numCellsY = ceil(height / gridSize) + 1;
//  println("numCells " + numCellsX + " " + numCellsY);
  theGrid = new GridElement[numCellsX][numCellsY];
  for (int i = 0; i < numCellsX ; i++)
  {
    for (int j = 0; j < numCellsY; j++)
    {
      theGrid[i][j] = new GridElement(i * gridSize, j * gridSize);
      theGrid[i][j].createNeighbours();
    }
  }
  
  numBalls = min(numBalls, (numCellsX * numCellsY));

  balls = new Ball[numBalls];
  for (int b = 0; b < numBalls; b++)
  {
    PVector ballPos = new PVector(random(maxDiameter, width-maxDiameter), random(maxDiameter, height-maxDiameter));
//    float posx = (int(b / numCellsX) + 0.5) * gridSize;
//    float posy = ((b % numCellsY) + 0.5) * gridSize;
//    PVector ballPos = new PVector(posx, posy);
    float ballDiameter = random(0.5, 1) * maxDiameter;
    balls[b] = new Ball(ballPos, ballDiameter);
    balls[b].vel = new PVector(random(-1, 1), random(-1, 1));
    balls[b].colour = color(random(64, 128), random(64, 128), random(64, 128));
  }
}

void draw()
{
  background(255);

  assignBallsToGrid();

  if(displayGrid) drawGrid();
  for (int b = 0; b < numBalls; b++)
  {
    balls[b].display();
    balls[b].update();
    balls[b].checkWalls();
  }
  checkGrid();
}

void mouseMoved()
{
  int i = int(mouseX/gridSize);
  int j = int(mouseY/gridSize);
  theGrid[i][j].displayNeighbours();
}

void checkGrid()
{
  for (int i = 0; i < numCellsX; i++)
  {
    for (int j = 0; j < numCellsY; j++)
    {

      GridElement thisCell = theGrid[i][j];
      //is there a ball in the current cell?
      if (thisCell.ballsInThisElement.size() > 0)
      {
        //does the cell have neighbours?
        for (int n = 1; n < 5; n++)
        {
          //if the neighbour is valid
          if (thisCell.neighbours[n].mag() < 5)
          {
            //find grid reference of neighbour
            int gridrefx = i + int(thisCell.neighbours[n].x);
            int gridrefy = j + int(thisCell.neighbours[n].y);
//            println("ij " + i +" " + j +" cell " + thisCell.xpos +" "+ thisCell.ypos +" "+ thisCell.neighbours[n] + " gridRefs " + gridrefx +" "+ gridrefy);
            GridElement neighbouringCell = theGrid[gridrefx][gridrefy];
            //is there a ball in the neighbouring cell?
            if (neighbouringCell.ballsInThisElement.size() > 0)
            {
              makeCollisionPairs(thisCell.ballsInThisElement, neighbouringCell.ballsInThisElement);
            }
          }
        }
      }
    }
  }
  for (int i = 0; i < numCellsX; i++)
  {
    for (int j = 0; j < numCellsY; j++)
    {
      GridElement thisCell = theGrid[i][j];
      //is there a ball in the current cell?
      if (thisCell.ballsInThisElement.size() > 1)
      {
        makeCollisionPairs(thisCell.ballsInThisElement);
      }
    }
  }
} 

void makeCollisionPairs(ArrayList theseBallIndices, ArrayList neighbouringBallIndices)
{
  for (int b = 0; b < theseBallIndices.size(); b++)
  {
    int thisBallIndex = (Integer) theseBallIndices.get(b);

    for (int c = 0; c < neighbouringBallIndices.size(); c++)
    {
      int neighbourBallIndex = (Integer) neighbouringBallIndices.get(c);

      if (thisBallIndex == neighbourBallIndex) break;

      else 
      {
        balls[thisBallIndex].doBallCollision(balls[neighbourBallIndex]);
      }
    }
  }
}

void makeCollisionPairs(ArrayList theseBallIndices)
{
  for (int b = 0; b < theseBallIndices.size() - 1; b++)
  {
    int thisBallIndex = (Integer) theseBallIndices.get(b);

    for (int c = b + 1; c < theseBallIndices.size(); c++)
    {
      int otherBallIndex = (Integer) theseBallIndices.get(c);

      if (thisBallIndex == otherBallIndex) break;

      else 
      {
        balls[thisBallIndex].doBallCollision(balls[otherBallIndex]);
      }
    }
  }
}

void keyPressed()
{
  if(keyCode == 'g' || keyCode == 'G') displayGrid = !displayGrid;
}

void drawGrid()
{
  stroke(128);
  strokeWeight(1);
  for (int i = 0; i < numCellsX; i++)
  {
    line(i * gridSize, 0, i * gridSize, height);
  }
  for (int j = 0; j < numCellsY; j++)
  {
    line(0, j * gridSize, width, j * gridSize);
  }
}  


void assignBallsToGrid()
{
  //empty out exising arraylist by making a new one
  for (int i = 0; i < numCellsX; i++)
  {
    for (int j = 0; j < numCellsY; j++)
    {
      GridElement thisCell = theGrid[i][j];
      thisCell.ballsInThisElement = new ArrayList();
    }
  }
  for (int b = 0; b < numBalls; b++)
  {
    //constrain ballPos so that indices don't get invalid values
    int xindex = int(constrain(balls[b].pos.x, 0, width) / gridSize);
    int yindex = int(constrain(balls[b].pos.y, 0, height) / gridSize);
//    constrain(xindex, 0, numCellsX-1);
//    constrain(yindex, 0, numCellsY-1);
//    println("ballPos " + int(balls[b].pos.x) +" "+ int(balls[b].pos.y) +" index " + xindex +" "+ yindex);
    theGrid[xindex][yindex].ballsInThisElement.add(b);
  }
}

class Ball
{
  float diam;
  float mass;
  PVector pos;
  PVector vel;
  color colour = 128;

  Ball(PVector pos, float diam)
  {
    this.pos = pos;
    this.diam = diam;
    this.mass = diam;
    this.colour = colour;
  }

  void display()
  {
    fill(colour);
    noStroke();
    ellipse(pos.x, pos.y, diam, diam);
  }

  void update()
  {
    pos.add(vel);
  }

  //vector-based ball collision code snippet
  //thisBall is A, otherBall is B
  void doBallCollision(Ball otherBall)
  {
    //find vector joining the balls' centres and its normal
    //vjc and jcn respectively
    float xbit = this.pos.x - otherBall.pos.x;
    float ybit = this.pos.y - otherBall.pos.y;
    PVector vjc = new PVector(xbit, ybit);
    PVector jcn = new PVector(ybit, -xbit);

    float distance = vjc.mag();
    if (distance < (this.diam + otherBall.diam) / 2)
    {
      //find projections of balls' velocities onto vjc and jcn
      //projection = target * (vel DOT target)/target DOT target)
      //need a couple of dot products first
      float vjcDot = vjc.dot(vjc);
      float jcnDot = jcn.dot(jcn);

      float avelDOTvjc = this.vel.dot(vjc);
      PVector aVel_vjc = PVector.mult(vjc, (avelDOTvjc / vjcDot));
      float bvelDOTvjc = otherBall.vel.dot(vjc);
      PVector bVel_vjc = PVector.mult(vjc, (bvelDOTvjc / vjcDot));

      float avelDOTjcn = this.vel.dot(jcn);
      PVector aVel_jcn = PVector.mult(jcn, (avelDOTjcn / jcnDot));
      float bvelDOTjcn = otherBall.vel.dot(jcn);
      PVector bVel_jcn = PVector.mult(jcn, (bvelDOTjcn / jcnDot));

      //push balls away from each other 
      //so that they don't get stuck overlapping
      float absVel = aVel_vjc.mag() + bVel_vjc.mag();
      float overlap = (this.diam/2 + otherBall.diam/2) - distance;
      PVector aVel_overlap = PVector.mult(this.vel, (overlap / absVel));
      PVector bVel_overlap = PVector.mult(otherBall.vel, (overlap / absVel));
      this.pos.sub(aVel_overlap);
      otherBall.pos.sub(bVel_overlap);

      //collision using conservation of momentum 
      //and Newtons law of restitution 
      //(assume coefficient of restitution = 1)
      float sumMass = this.mass + otherBall.mass;
      float dMass = this.mass - otherBall.mass;

      //firstBit = (mass - other mass) * vel
      //secondbit = (1 + coefficient of restitution) * other mass * other vel
      //new vel = (firstBit + secondBit) / sum of masses
      PVector firstBitA = PVector.mult(aVel_vjc, dMass);
      PVector secondBitA = PVector.mult(bVel_vjc, (2 * otherBall.mass));
      PVector topLineA = PVector.add(firstBitA, secondBitA);
      PVector newAvjc = PVector.div(topLineA, sumMass);
      PVector firstBitB = PVector.mult(bVel_vjc, -dMass);
      PVector secondBitB = PVector.mult(aVel_vjc, (2 * this.mass));
      PVector topLineB = PVector.add(firstBitB, secondBitB);
      PVector newBvjc = PVector.div(topLineB, sumMass);

      //add (x, y) components of new vel in direction of vjc
      //and existing vel in direction of jcn
      this.vel.x = newAvjc.x + aVel_jcn.x;
      this.vel.y = newAvjc.y + aVel_jcn.y;
      otherBall.vel.x = newBvjc.x + bVel_jcn.x;
      otherBall.vel.y = newBvjc.y + bVel_jcn.y;
    }
  }

  void wrapWalls()
  {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
  

  void checkWalls()
  {
    if (pos.x > width - diam / 2)
    {
      pos.x = width - diam / 2;
      vel.x *= -1;
    }
    if (pos.x < diam / 2)
    {
      pos.x = diam / 2;
      vel.x *= -1;
    }
    if (pos.y > height - diam / 2)
    {
      pos.y = height - diam / 2;
      vel.y *= -1;
    }
    if (pos.y < diam / 2)
    {
      pos.y = diam / 2;
      vel.y *= -1;
    }
  }
}

class GridElement
{
  PVector[] neighbours = new PVector[5];

  float xpos, ypos;
  ArrayList ballsInThisElement;

  GridElement(float xpos, float ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    ballsInThisElement = new ArrayList();
  }

  //neighbours of this cell are 
  //0 = itself
  //1 = the one to the right if there is one
  //2 = the one to the lower right if there is one
  //3 = the one below if there is one
  //4 = the one to the lower left is there is one
  void createNeighbours()
  {
    //first populate with invalid values
    //(3, 4) chosen so that magnitude is 5
    //later I can test to see if the magnitude is 5
    //if it isn't then this counts as a valid neighbouring cell
    for (int n = 0; n < 5; n++)
    {
      neighbours[n] = new PVector(3, 4);
    }
    //now repopulate individually
    //neighbours[0] is current cell
    neighbours[0] = new PVector(0, 0);
    //neighbours[1] is to the right of current cell
    //unless cell is on righthand edge
    if (xpos + gridSize < width) neighbours[1] = new PVector(1, 0);
    //neighbours[2] is to the lower right of current cell
    //unless cell is in bottomright corner
    if ((xpos + gridSize < width) && (ypos + gridSize < height)) neighbours[2] = new PVector(1, 1);
    //neighbours[3] is below current cell
    //unless cell is on bottom edge
    if (ypos + gridSize < height) neighbours[3] = new PVector(0, 1);
    //neighbours[4] is to the lower left of current cell
    //unless cell is on left edge
    if ((xpos > 0) && (ypos + gridSize < height)) neighbours[4] = new PVector(-1, 1);
  }

  void displayNeighbours()
  {
    noStroke();
    fill(255, 0, 0, 40);
    rect(xpos, ypos, gridSize, gridSize);
    for (int n = 0; n < 5; n++)
    {
      if (neighbours[n].mag() != 5)
      {
        fill(255, 0, 0, 20);
        rect(xpos + gridSize * neighbours[n].x, ypos + gridSize * neighbours[n].y, gridSize, gridSize);
      }
    }
  }
}





