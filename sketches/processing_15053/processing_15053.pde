
/** 
  * A minimal block-breaking "game"
  *  Copyright (C) 2010 Evan Raskob <evan@flkr.com>
  *
  *  This program is free software: you can redistribute it and/or modify
  *  it under the terms of the GNU Affero General Public License as
  *  published by the Free Software Foundation, either version 3 of the
  *  License, or (at your option) any later version.

  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU Affero General Public License for more details.

  *  You should have received a copy of the GNU Affero General Public License
  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */


ArrayList<Brick> bricks = new ArrayList<Brick>();
ArrayList<Ball> balls = new ArrayList<Ball>();
Paddle paddle;

//scoring
int score=0;

// SCREEN PROPERTIES --
int screenWidth = 400;
int screenHeight = 400;
color backgroundColor = #303030;

boolean backgroundRefreshes = true;

color[] rowsColors = {
    #ff00ff, #ff0000, #ff9900, #ffff00, #00ff00, #00ffff
  };
  
  // BRICK GROUP PROPERTIES --
int numberOfBricks = 40;
int bricksPerRow = 10;
int brickWidth = screenWidth/bricksPerRow;
int brickHeight = screenWidth/20;

boolean brickHasStroke = true;
color brickStroke = #ffffff;
boolean brickHasFill = true;
color brickFill = #ff0000;
int yBricks = 50;
  

void setup() 
{
  size(screenWidth,screenHeight);
  background(backgroundColor);
  frameRate(60);

  // create objects
  createBricks();
  createBalls();
  
  paddle = new Paddle(10,height-50, width/8,10);
  
}

void draw() 
{  
  
    // BACKGROUND
  if(backgroundRefreshes) 
  {
    background(backgroundColor);
  }


 //show score
  text("Score:" + score, 10,10);
  
  
  // BALLS
  for (int i=0; i<balls.size(); i++) 
  {
    Ball ball = (Ball)balls.get(i);
    
    //update ball position
    ball.update();

    stroke(0,255,0,100);    
 
    if (paddle.intersects(ball)) 
    {      
      PVector closestPoint = bounceBallOffRectangle(ball,paddle);
      
      fill(0,255,0,200);
      ellipse(closestPoint.x, closestPoint.y, 20, 20);
    }
    else
    {
      ArrayList<Brick> collisions = new ArrayList<Brick>();
    
      for (Brick b : bricks)
      {
        if (b.intersects(ball)) 
        {
          collisions.add(b);
     //     println("COLLISION");
        }
      }
      
      float closestDist = MAX_FLOAT; // some really big number
      
      Brick closestBrick = null;
      
      for (Brick brick : collisions)
      {
        //print("ball:" + + ball.minX + ", " + ball.maxX);
        //println("collided with brick:" + b.minX + "/" + b.maxX + ", " + b.y);
        
        // for each side of the brick, get the closest point...
        
        if (dist(brick.x, brick.y, ball.x, ball.y) < closestDist) 
        {
          closestBrick = brick;
        } 
      }
      
      // handle the ball colliding with a close brick
      if (closestBrick != null)
      {
        if (closestBrick.breakable == true)
        {
          //add to score
          score++;
          
          // remove broken brick
          bricks.remove(closestBrick);
  
          // create new brick
          bricks.add( createRandomBrick() );
          
        }
        else // ball is unbreakable- bounce it off!
        {
          
          PVector closestPoint = bounceBallOffRectangle(ball,closestBrick);
          
          fill(0,255,0,200);
          ellipse(closestPoint.x, closestPoint.y, 20, 20);
          
        // end testing for breakability
        }
      }
          
      // end handling closest brick the ball collided with 
      }
  }
  
  refreshScreen();
}


// Create some balls!
void createBalls()
{
  // BALL(S) PROPERTIES --
  int numberOfBalls = 3;
  int yBalls = 150;
  //
  for (int i=0; i<numberOfBalls; i++) 
  {
    int x = i*20;
    Ball ball = new Ball(x,yBalls,10,10);
    balls.add(ball);
  }
}

void createBricks()
{
  //
  // CREATE BRICKS --
  for (int i=0; i<numberOfBricks; i++)
  {
    int rowNum = i/bricksPerRow;
    // coords
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = yBricks+i/bricksPerRow*brickHeight;
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    // create brick
    Brick brick = new Brick(x, y, brickWidth, brickHeight);
    brick.fillColor = rowColor;
    
    float breakability = random(0,1);
    
    if (breakability < 0.2) brick.breakable = false;
    
    bricks.add(brick);
  }
}


Brick createRandomBrick()
{
  //
  // CREATE BRICKS --
  int i= int( random(0, numberOfBricks));
  
  int rowNum = i/bricksPerRow;
  // coords
  int x = brickWidth*i;
  x -= rowNum*bricksPerRow*brickWidth;
  int y = yBricks+i/bricksPerRow*brickHeight;
  // color
  int num = min(rowNum, rowsColors.length-1);
  color rowColor = rowsColors[num];
  // create brick
  Brick brick = new Brick(x, y, brickWidth, brickHeight);
  brick.fillColor = rowColor;

  return brick;
}



void refreshScreen() {

  // PADDLE
//  paddle.draw();
  //

  for (int b=0; b<balls.size(); b++)
  {
    Ball ball = (Ball)balls.get(b);
    ball.draw();
  }
  
  // BRICKS
  for (int i=0; i<bricks.size(); i++)
  {
    Brick brick = (Brick)bricks.get(i);
    brick.draw();
  }
  
  paddle.draw();
}



void mouseMoved()
{
   // move paddle with mouse
   paddle.moveTo(mouseX,mouseY);
}


PVector closestPointToLine(PVector l0, PVector l1, PVector p)
{
  PVector direction = PVector.sub(l1,l0);
  PVector w = PVector.sub(p,l0);
  float proj = w.dot(direction);
  
  if (proj <= 0)
    return l0;
  else
  {
    float vsq = direction.dot(direction);
    if (proj >= vsq)
      return PVector.add(l0,direction);
    else
      return PVector.add(l0, PVector.mult(direction,proj/vsq));
  }
}

float distancePointToLine(PVector l0, PVector l1, PVector p)
{
  PVector direction = PVector.sub(l1,l0);
  PVector w = PVector.sub(p,l0);
  float proj = w.dot(direction);
  
  if (proj <= 0)
    return w.dot(w);
  else
  {
    float vsq = direction.dot(direction);
    if (proj >= vsq)
      return w.dot(w) - 2.0f*proj+vsq;
    else
      return w.dot(w) - proj*proj/vsq;
  }
}

// BALL

class Ball extends Rectangle{

  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;

  // velocity
  int vx = 2;
  int vy = 1;

  int prevX;
  int prevY;
  
  Ball(int _x, int _y, int _w, int _h)
  {
    super(_x, _y, _w, _h);
  }


  // Update the position of the ball, based on a boundary that contains it.
  // Here we assume the ball will bounce off the boundary without losing or gaining speed.

  void update() 
  {        
    
    prevX = x;
    prevY = y;
    
    // add velocity to position
    setX( x + vx);
    setY( y + vy);
    
    if (x > width) 
    {
      vx = -vx;
      setX(width);
    } 
    else if (x < 0)
    {
      vx = -vx;
      setX(0);
    }
      
    if (y > height) 
    {
      vy = -vy;
      setY(height);
    } 
    else if (y < 0)
    {
      vy = -vy;
      setY(0);
    }      
  }


  void draw()
  {
    // stroke
    if (hasStroke) 
    {
      stroke(strokeColor);
    } 
    else 
    {
      noStroke();
    }
    // fill
    if (hasFill) 
    {
      fill(fillColor);
    } 
    else {
      noFill();
    }

    // you can change this to make custom balls
    ellipseMode(CORNER);
    ellipse(x,y,w,h);
  }
}




// BRICK

class Brick extends Rectangle{

  boolean hasStroke = true;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;

  boolean respawns = false;
  int timeToRespawn = 60; // time is in frames
  int frames = 0;
  
  boolean breakable = true;

  Brick(int x, int y, int w, int h) 
  {
    super(x, y, w, h);
  }

  void refresh()
  {
    if (respawns)
    {
      frames++;
      if(frames>timeToRespawn)
      {
        // rise up from your grave, brick
        breakable = true;
      }
    }
  }


  void draw()
  {
    if (hasStroke)
    {
      stroke(strokeColor);
    }
    else
    {
      noStroke();
    }
    if (hasFill)
    {
      fill(fillColor);
    }
    else
    {
      noFill();
    }

    rectMode(CORNER); 
    rect(x,y, w, h);
  }


  void die() 
  {
    breakable = false;
    frames = 0;
  }
  // END CLASS Brick
}





// PADDLE

class Paddle extends Rectangle
{
  
  // PADDLE PROPERTIES --
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;

  Paddle(int _x, int _y, int _w, int _h)
  {
    super(_x, _y, _w, _h);
  }
}



// in this game every visible object is a Rectangle
// (ball, paddle, bricks, even the game frame)
// are represented by a Rectangle:

class Rectangle 
{

  int x,y,w,h, minX, maxX, minY, maxY;

  Rectangle(int _x, int _y, int _w, int _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    minX = x;
    maxX = x+w;
    minY = y;
    maxY = y+h;
  }  

  void draw()
  {
    rectMode(CORNER);
    rect(x, y, w, h);
  }

  void moveTo(float _x, float _y)
  {
    moveTo(int(_x),  int(_y));
  }

  void moveTo(int _x, int _y)
  {
    setX(_x);
    setY(_y);
  }
  
  void setX(int _x)
  {
    x = _x;
    minX = x;
    maxX = x+w;
  }
  void setY(int _y)
  {
    y=_y;
    minY = y;
    maxY = y+h;
  }
  void setH(int _h)
  {
    h=_h;
    maxY = y+h;
  }
  void setW(int _w)
  {
    w=_w;
    maxX=x+w;
  }
    

  // COLLISION DETECTION FUNCTIONS   
  // -------------------------------------

  // test if this intersects another Rectangle
  boolean intersects(Rectangle other)
  {
//    if (mousePressed)
//    {
//      println("x:" + minX+"/"+maxX + " :: y:" + minY + "/" + maxY);
//      println("other x:" + other.minX+"/"+other.maxX + " :: y:" + other.minY + "/" + other.maxY);
//    }

    if (minX > other.maxX || other.minX > maxX)
      return false;
     
    if (minY > other.maxY || other.minY > maxY)
      return false;


    return true;
  }
  // end class Rectangle
}


// bounces the ball and returns the closest point

PVector bounceBallOffRectangle(Ball ball, Rectangle r)
{
      PVector pTopL = new PVector(r.minX,r.minY);
      PVector pTopR = new PVector(r.maxX,r.minY);
      PVector pBotL = new PVector(r.minX,r.maxY);
      PVector pBotR = new PVector(r.maxX, r.maxY);
      PVector ballPrevPos =  new PVector(ball.prevX,ball.prevY);
  
      PVector closestTopPoint = closestPointToLine(pTopL,pTopR,ballPrevPos);
      PVector closestBotPoint = closestPointToLine(pBotL,pBotR,ballPrevPos);
      PVector closestLeftPoint = closestPointToLine(pTopL,pBotL,ballPrevPos);
      PVector closestRightPoint = closestPointToLine(pTopR,pBotR,ballPrevPos);
      
      float dt, db, dl, dr;  // distance to points from prev ball pos
      
      dt = closestTopPoint.dist(ballPrevPos);
      db = closestBotPoint.dist(ballPrevPos);
      dl = closestLeftPoint.dist(ballPrevPos);
      dr = closestRightPoint.dist(ballPrevPos);
     
      /* For debugging ****
      
      fill(255,255,0,100);
      ellipse(closestTopPoint.x,closestTopPoint.y,20,20);
      ellipse(closestBotPoint.x,closestBotPoint.y,20,20);
      ellipse(closestLeftPoint.x,closestLeftPoint.y,20,20);
      ellipse(closestRightPoint.x,closestRightPoint.y,20,20);
      */
     
      float bestDistance = dt;
      
      int newBallVx, newBallVy;
      
      PVector closestPoint =  closestTopPoint;
      ball.moveTo(closestPoint.x, closestPoint.y-ball.h-1);
      newBallVx = ball.vx;
      newBallVy = -ball.vy;
      //println("TOP");
      
      if (db < bestDistance)
      {
        closestPoint =  closestBotPoint;
        ball.moveTo(closestPoint.x,closestPoint.y+1);
        newBallVx = ball.vx;
        newBallVy = -ball.vy;
        //println("BOT");
      }
      else if (dl < bestDistance)
      {
        bestDistance = db;
        closestPoint =  closestLeftPoint;
        ball.moveTo(closestPoint.x-ball.w-1,closestPoint.y);
        newBallVx = -ball.vx;
        newBallVy = ball.vy;
        //println("LEFT");
      }
      else if (dr < bestDistance)
      {
        bestDistance = dr;
        closestPoint =  closestRightPoint;
        ball.moveTo(closestPoint.x,closestPoint.y+1);
        newBallVx = -ball.vx;
        newBallVy = ball.vy;
//        println("RIGHT");
      }
      
        ball.vx = newBallVx;
        ball.vy = newBallVy;
        
        return closestPoint;
}




