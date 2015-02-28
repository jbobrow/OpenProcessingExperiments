
/** 
 * A minimal block-breaking "game"
 *  Copyright (C) 2010 Evan Raskob <evan@openlabworkshops.org>
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

ArrayList bricks = null;
ArrayList balls = null;
ArrayList paddles = null;
ArrayList allGameObjects = null;

int mainPaddleIndex = 0;

static boolean verbose = false;

  // a very small numnber
static final float epsilon = 1E-4;

static final int BALL = 0;
static final int PADDLE = 1;
static final int BRICK = 2;
static final int WALL = 3;

/////// scoring //////////////////
int score=0;

static int gameTime = 0;


// SCREEN PROPERTIES --
static final int SCREEN_WIDTH = 480;
static final int SCREEN_HEIGHT = 360;

color backgroundColor = color(46, 33, 260, 100);

boolean backgroundRefreshes = true;




//////////////////////////////////////////////////////////////////////
//////// HERE IS WHERE YOU SET GAME OBJECTS PROPERTIES ///////////////
//////////////////////////////////////////////////////////////////////

// number of bricks left to break
int breakableBricks = 0;

///////// bricks properties  ///////////////////////////////
int numberOfBricks = 200;
int bricksPerRow = 26;
int brickScale = 30;  // relative to size of screen
int brickWidth = SCREEN_WIDTH/bricksPerRow;
int brickHeight = SCREEN_HEIGHT/brickScale;
int bricksStartY = 50;

boolean brickHasStroke = true;
color brickStroke = color(255);
boolean brickHasFill = true;

// alternating colors for rows of bricks
color[] rowsColors = {
  color(255,0,255), color(255,255,0), color(255,200,0), color(0,200,255), color(0,255,255), color(0,255,0)
};


////// balls properties /////////////////
int ballMinDiameter = SCREEN_WIDTH/80;
int ballMaxDiameter = SCREEN_WIDTH/40;
int numberOfBalls = 5;


int paddleHeight = SCREEN_HEIGHT/40;
int paddlesY     = SCREEN_HEIGHT-2*paddleHeight;

int numberOfPaddles = 4;
int paddleWidth  = min(SCREEN_WIDTH/numberOfPaddles, SCREEN_WIDTH/15);


////////////////////////////////////////////////////////////////
// Create ball objects and add to game balls list //////////////
////////////////////////////////////////////////////////////////
void createBalls()
{
  // TODO: remove all balls from allGameObjects first if necessary

  // get rid of all previous bricks, if there are any
  if (balls != null) 
  {
    balls.clear();
  }
  else
  {
    // otherwise make a new ArrayList to hold our game bricks
    balls = new ArrayList();
  }

  // figure out how much of the screen is taken up by bricks...
  int brickRows        = numberOfBricks/bricksPerRow;
  int brickBlockHeight = brickRows*brickHeight;

  int ballsStartY      = bricksStartY + brickBlockHeight + ballMaxDiameter;
  int ballsEndY        = SCREEN_HEIGHT - ballMaxDiameter;

  // check if we have space for balls!!!
  if (ballsEndY-ballsStartY < ballMaxDiameter) 
  {
    println("NO SPACE FOR BALLS!! Try less bricks (or smaller ones)");
  }

  int ballXInterval = SCREEN_WIDTH/((ballMaxDiameter+20)*numberOfBalls);

  for (int i=0; i<numberOfBalls; i++) 
  {
    int ballDiameter     = int(random(ballMinDiameter, ballMaxDiameter));
    float x = ballDiameter + i*(ballDiameter+5);
    float y = random(ballsStartY, ballsEndY);
    GameObject ball = new GameObject(x,y,ballDiameter,ballDiameter);
    ball.type = BALL;
    ball.frictionCoeff = 1f;  // balls never stop...
    ball.accelerate(randomVector().scaleSelf(10));
    balls.add(ball);
    ball.hasFill = true;
    ball.hasStroke = true;

    allGameObjects.add(ball);
  }
}


////////////////////////////////////////////////////////////////
// Create paddle objects and add to  list //////////////////////
////////////////////////////////////////////////////////////////

void createPaddles()
{

  // get rid of all previous bricks, if there are any
  if (paddles != null) 
  {
    paddles.clear();
  }
  else  
  {
    // otherwise make a new ArrayList to hold our game paddles
    paddles = new ArrayList();
  }

  int paddleXInterval = paddleWidth+20;

  // loop through and make new brick objects and add to bricks list
  for (int i=0; i < numberOfPaddles; i++)
  {
    float x = paddleWidth + i*paddleXInterval;

    GameObject p = new GameObject(x, paddlesY, paddleWidth, paddleHeight);
    p.type = PADDLE;
    paddles.add(p);
    p.hasFill = true;
    p.hasStroke = true;
    p.movable = false; // if true, will bounce back when it hits a ball
    
    p.fillColor = color(220,(i/float(numberOfPaddles-1)) * 128,10);
    
    p.frictionCoeff = 0.9f;  // paddles are a bit heavy...
    allGameObjects.add(p);
  }  
  
  // paddle 1  
  mainPaddleIndex = 0;
}



//-----------------------------------------------
// Create brick objects and add to game bricks list
//-----------------------------------------------
void createBricks()
{
  brickWidth = SCREEN_WIDTH/bricksPerRow;
  brickHeight = SCREEN_HEIGHT/brickScale;

  // get rid of all previous bricks, if there are any
  if (bricks != null) 
  {
    bricks.clear();
  }
  else  
  {
    // otherwise make a new ArrayList to hold our game bricks
    bricks = new ArrayList();
  }

  // loop through and make new brick objects and add to bricks list
  for (int i=0; i<numberOfBricks; i++)
  {
    int rowNum = i/bricksPerRow;
    // coords
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = bricksStartY + rowNum*brickHeight;
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    // create brick
    GameObject brick = new GameObject(x, y, brickWidth-1, brickHeight-1);
    brick.fillColor = rowColor;
    brick.hasFill = true;
    brick.hasStroke = true;

    brick.type= BRICK;


    boolean breakable = (random(0,1) >= 0.1);
    if (!breakable) brick.fillColor = color(100,100,100);
    else ++breakableBricks;
    
    brick.breakable = breakable;

    bricks.add(brick);
    allGameObjects.add(brick);
  }

  // add boundaries
  GameObject node = new GameObject(0,-20, width, 30);
  node.breakable = false;
  node.fillColor = color(0);
  node.type = WALL;
  node.movable = false;
  allGameObjects.add(node);

  node = new GameObject(-20,10, 30,height);
  node.breakable = false;
  node.fillColor = color(0);
  node.type = WALL;
  node.movable = false;
  allGameObjects.add(node);

  node = new GameObject(width-10,0, 30, height);
  node.breakable = false;
  node.fillColor = color(0);
  node.type = WALL;
  node.movable = false;
  allGameObjects.add(node);

  node = new GameObject(0,height-10, width, 30);
  node.breakable = false;
  node.fillColor = color(0);
  node.type = WALL;
  node.movable = false;
  allGameObjects.add(node);
}


//-----------------------------------------------
// Create a single random brick and add it to the list of bricks in the game
//-----------------------------------------------

GameObject createRandomBrick()
{
  //
  // CREATE BRICKS --
  int i= int( random(0, numberOfBricks));

  int rowNum = i/bricksPerRow;
  // coords
  int x = brickWidth*i;
  x -= rowNum*bricksPerRow*brickWidth;
  int y = bricksStartY+i/bricksPerRow*brickHeight;
  // color
  int num = min(rowNum, rowsColors.length-1);
  color rowColor = rowsColors[num];
  // create brick
  GameObject brick = new GameObject(x, y, brickWidth, brickHeight);
  brick.fillColor = rowColor;
  brick.hasFill = true;
  brick.hasStroke = true;


  return brick;
}




///////// SETUP  ///////////////////////////////

void setup() 
{
  size(480,360);
  //size(SCREEN_WIDTH, SCREEN_HEIGHT);
  

  background(backgroundColor);
  frameRate(60);

  newGame();
}


///////// INIT  //////////////////////////////////////////////
// in a separate method so it can be called again to re-init
/////////////////////////////////////////////////////////////
void newGame()
{

  gameTime = millis();

  if (allGameObjects != null) allGameObjects.clear();

  allGameObjects = new ArrayList();

  // create objects
  createBricks();
  createBalls();
  createPaddles();

  score = 0;
}  




/////////////////////////////////////////////////////////////
/// send a ball hit message to all clients

void sendBallHitOSCMessage(Vec2D v)
{
  if (verbose) println("ball hit! " + millis());
}


void sendPaddleHitOSCMessage(Vec2D v)
{
  if (verbose)   println("paddle hit! " + millis());
}

void sendBrickHitOSCMessage(Vec2D v, boolean breakable)
{
  if (verbose)   println("brick hit! " + millis());
}



////////////////////////////////////////////////////////
// move paddle /////////////////////////////////////////

void movePaddle(int i, float x, float y)
{
  if (i > -1 && i < paddles.size())
  {
    GameObject p = (GameObject)paddles.get(i);

    float xCoord = map(x, 0, 1, 0, width); 
    float yCoord = map(y, 0, 1, 0, height); 

    Vec2D a = new Vec2D(x-p.pos.x, y-p.pos.y);
    a.scaleSelf(0.05);

    //println("Moving X: " + xCoord + " Y: " +  yCoord ) ;
    p.accelerate(a);
  }
  else
  {
    println("!!!!ERROR :: Bad Paddle!!!! :::: " + i);
  }
}


/////////////////////////////////////////////////
// draw /////////////////////////////////////////

void draw() 
{ 
  smooth();

  // BACKGROUND
  if (backgroundRefreshes) 
  {
    background(backgroundColor);
  }

  fill(255);
  //show score
  text("Score:" + score, 40, 20);
  text("Time:" + (millis()-gameTime)/1000, 40, 36);


  // Update the balls - check for collisions with game objects (paddles,
  // bricks) and handle accordingly.

  // update position and draw
  for (int i=0; i<allGameObjects.size(); i++)
  {
  GameObject node = (GameObject)allGameObjects.get(i);
  
    //update ball position
    node.update();
    node.hasCollided = false;
    node.draw();
  }


  // handle collisions

  ArrayList<GameObject[]> collisions = new ArrayList<GameObject[]>();

  for (int i=0; i < allGameObjects.size(); i++) 
  {
    GameObject n0 = (GameObject)allGameObjects.get(i);

    for (int j=i+1; j < allGameObjects.size(); j++)
    {

      GameObject n1 = (GameObject)allGameObjects.get(j);

      if (n0.intersects(n1)) 
      {
        // keep track of collided pair
        collisions.add(new GameObject[] {
          n0, n1
        } 
        );

        n0.hasCollided = true;
        n1.hasCollided = true;

        //println("COLLISION");
      }
    }
  }

  //////////////////////////////////////
  //////// HANDLE COLLISIONS ///////////
  //////////////////////////////////////

  for (GameObject[] nodes : collisions)
  {
    // here's where you handle the collision...

    int node0Type = nodes[0].type;
    int node1Type = nodes[1].type;

    boolean hitBrick   = false;
    boolean hitBall    = false;
    boolean hitPaddle  = false;

    boolean node0IsBall   = false;
    boolean node0IsBrick  = false;
    boolean node0IsPaddle = false;
    boolean node0IsBreakable = false;

    boolean node1IsBall   = false;
    boolean node1IsBrick  = false;
    boolean node1IsPaddle = false;
    boolean node1IsBreakable = false;

    // if ball hits brick, it breaks.
    // if paddle hits brick, it doesn't.
    // if paddle hits paddle, ditto.
    // if brick hits brick, they break. (overlap)

    // SO, either 2 balls hit, or 2 paddles hit. then we do nothing but play a sound.
    // or, a ball hit a paddle (make sound), or a ball or brick hit a brick (break it, make sound)

    node0IsBall = node0Type == BALL;
    node0IsBrick = node0Type == BRICK;
    node0IsPaddle = node0Type == PADDLE;
    
    node0IsBreakable = nodes[0].breakable;

    node1IsBall = node1Type == BALL;
    node1IsBrick = node1Type == BRICK;
    node1IsPaddle = node1Type == PADDLE;

    
    node1IsBreakable = nodes[1].breakable;


    if ( node0IsBall && node1IsBall )
    {
      hitBall = true;

      // trigger sounds
      sendBallHitOSCMessage(nodes[0].vel.sub(nodes[1].vel));
    }
    else if ( node0IsPaddle || node1IsPaddle )
    {
      hitPaddle = true;

      // trigger sounds
      sendPaddleHitOSCMessage(nodes[0].vel);
    }
    else if (node0IsBrick || node1IsBrick)
    {
      if (node1IsBrick && node1IsBreakable) breakBrick(nodes[1]);
      if (node0IsBrick && node0IsBreakable) breakBrick(nodes[0]);

      hitBrick = true;
      // trigger sounds
      sendBrickHitOSCMessage(nodes[0].vel, node1IsBrick && node1IsBreakable && node0IsBrick && node0IsBreakable);
    }

    Collider.collide(nodes[0], nodes[1]);
  }
  // end draw
}


void breakBrick(GameObject brick)
{
  ++score;
  --breakableBricks;
  allGameObjects.remove(brick);
  bricks.remove(brick);

  // instant new game!!
  if (breakableBricks < 1) newGame();
}


//////////////////////////////
/// Key and mouse funcs
//////////////////////////////

void keyReleased()
{
  switch(key)
  {
  case 'v': 
    verbose = !verbose;
    break;
  }
}


// Update the paddle position when we move the mouse:

void mouseMoved()
{
  moveToMouse();
}

void mousePressed()
{
  moveToMouse();
}

void mouseReleased()
{
  moveToMouse();
}

void mouseDragged()
{
  moveToMouse();
}


void moveToMouse()
{
  if (paddles != null)
  {
    GameObject p = (GameObject)paddles.get(mainPaddleIndex);
    if (p.pos.x < 10 || p.pos.x > width-10 || p.pos.y < 10 || p.pos.y > height-10 )
      p.moveTo(mouseX-p.w/2, mouseY-p.h/2);
    else
    {
      Vec2D a = new Vec2D((mouseX-p.w/2)-p.pos.x, (mouseY-p.h/2)-p.pos.y);
      a.scaleSelf(0.02);

      //println("Moving X: " + xCoord + " Y: " +  yCoord ) ;
      p.accelerate(a);
    }
  }
}



////// Our drawable object class /////////////////////

class GameObject 
{
  //internal variables ///////

  // has this been hit?

  boolean hasCollided = false;
  boolean moving = false;
  boolean movable = true;
  boolean breakable = true;

  // bounding box
  float maxX, minX;
  float maxY, minY;

  float w;
  float h;

  float frictionCoeff = 0.95;

  // movement variables
  Vec2D pos;        // position  
  Vec2D prevPos;    // previous position, for hit testing

  Vec2D vel;        // velocity
  Vec2D accel;      // acceleration

  // drawing variables
  boolean hasStroke = false;
  color strokeColor = color(0);
  boolean hasFill = true;
  color fillColor = color(255);

  // type of this thing
  int type = 0;


  /// Constructor //////////////////////////////////////
  //////////////////////////////////////////////////////

  // default:
  GameObject()
  {
    pos = new Vec2D();
    prevPos = new Vec2D();

    w = 20;
    h = 20;

    vel = new Vec2D();
    accel = new Vec2D();

    updateBoundingBox();
  }


  GameObject(float _x, float _y, float _w, float _h)
  {
    pos = new Vec2D(_x, _y);
    prevPos = new Vec2D(_x, _y);

    vel = new Vec2D();
    accel = new Vec2D();
    
    w = _w;
    h = _h;

    updateBoundingBox();
  }


  void setX(float _x)
  {
    pos.x = _x;
    minX = pos.x;
    maxX = pos.x + w;
  }

  void setY(float _y)
  {
    pos.y = _y;
    minY = pos.y;
    maxY = pos.y + h;
  }

  void setW(float _w)
  {
    w = _w;
    maxX = pos.x + w;
  }

  void setH(float _h)
  {
    h = _h;
    maxY = pos.y + h;
  }


  void updateBoundingBox()
  {
    minX = pos.x;
    maxX = pos.x + w;

    minY = pos.y;
    maxY = pos.y + h;
  }

  void accelerate(Vec2D a)
  {
    accel.addSelf(a);
    moving = true;
  }


  void finishedMoving()
  {
    // not much!
  }



  /// update  ///////////////////////////////////////////
  //////////////////////////////////////////////////////

  void update()
  {
    if (moving)
    {
      // apply acceleration
      vel.addSelf(accel);

      pos.addSelf(vel);
      prevPos.set(pos);
      updateBoundingBox();

      // apply drag
      vel.scaleSelf(frictionCoeff);
      // clear acceleration
      accel.set(0, 0);
      
      if (vel.magnitude() < 0.25f) 
      {
        vel.x = vel.y = 0f;
        moving = false;
      
        // do something?
        finishedMoving();
      }
      
    }
  }


  /// moveTo /////////////////////////////////////////////
  //////////////////////////////////////////////////////

  void moveTo(float x, float y)
  {
    pos.set(x, y);
    prevPos.set(pos);
    updateBoundingBox();
  }


  void move(float x, float y)
  {
    pos.addSelf(x, y);
    prevPos.set(pos);

    updateBoundingBox();
  }



  /// draw /////////////////////////////////////////////
  //////////////////////////////////////////////////////

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

    // you can change this in subclasses to make custom objects

    //rectMode(CORNER);
    //rect(pos.x, pos.y, w,h);

    rectMode(CORNERS);
    rect(minX, minY, maxX, maxY);
  }




  // simple rectangluar boundary hit test
  boolean intersects(GameObject other)
  {

    if (minX > other.maxX || other.minX > maxX)
      return false;

    if (minY > other.maxY || other.minY > maxY)
      return false;

    return true;
  }


  void unload()
  {
    
  }

  // end class GameObject
}
//////////////////////////////////////////




/**
 * These are "borrowed" form th excellent toxiclibs Vec2D class
 * http://toxiclibs.org
 */

public final Vec2D randomVector() {
  return new Vec2D(random(0, 1), random(0, 1));
}


public class Vec2D
{  
  float x, y;

  public Vec2D(float x, float y) 
  {
    this.x = x;
    this.y = y;
  }

  public Vec2D(float[] v) 
  {
    this.x = v[0];
    this.y = v[1];
  }

  public Vec2D() 
  {
    x = y = 0;
  }

  public final Vec2D scaleSelf(float s)
  {
    x *= s;
    y *= s;
    return this;
  }
  public final Vec2D addSelf(float a, float b) {
    x += a;
    y += b;
    return this;
  }

  public final Vec2D addSelf(Vec2D v) {
    x += v.x;
    y += v.y;
    return this;
  }

  public final Vec2D sub(float a, float b) {
    return new Vec2D(x - a, y - b);
  }

  public final Vec2D sub(Vec2D v) {
    return new Vec2D(x - v.x, y - v.y);
  }

  public final Vec2D add(float a, float b) {
    return new Vec2D(x + a, y + b);
  }

  public final Vec2D add(Vec2D v) {
    return new Vec2D(x + v.x, y + v.y);
  }

  public final Vec2D set(float x, float y) {
    this.x = x;
    this.y = y;
    return this;
  }

  public final Vec2D set(Vec2D v) {
    x = v.x;
    y = v.y;
    return this;
  }

  public final float magnitude() {
    return sqrt(x * x + y * y);
  }

  public final float dot(Vec2D v) {
    return x * v.x() + y * v.y();
  }
  public final float x() {
    return x;
  }

  public final float y() {
    return y;
  }
}


///////////////////////////////
///// Collision detection ////////////////////////////
//////////////////////////////

// COLLISION DETECTION FUNCTIONS   
// -------------------------------------


static class Collider
{
  // Find the closest point (x,y) to a piece of a line, and return it.

  static final Vec2D closestPointToLine(Vec2D l0, Vec2D l1, Vec2D p)
  {
    Vec2D direction = l1.sub(l0);
    Vec2D w = p.sub(l0);
    float proj = w.dot(direction);

    if (proj <= 0)
      return l0;
    else
    {
      float vsq = direction.dot(direction);
      if (proj >= vsq)
        return l0.add(direction);
      else
        return l0.add( direction.scaleSelf(proj/vsq));
    }
  }

  // Find the shortest possible distance between a point and a line.

  static final float distancePointToLine(Vec2D l0, Vec2D l1, Vec2D p)
  {
    Vec2D direction = l1.sub(l0);
    Vec2D w = p.sub(l0);
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


  // collide two rectangles

  static void collide(GameObject n0, GameObject n1)
  {
    n0.accel.set(0,0);    
    n1.accel.set(0,0);    

    int collisionSide = 0;  
    // left = 0
    // right = 1
    // top = 2
    // bottom = 3

    float min_dist = MAX_FLOAT;  // something really small   

    // handle collisions in X axis
    if (!(n0.minY > n1.maxY || n1.minY > n0.maxY))
    {
      // top      
      if(n0.maxY > n1.minY)
      {
        float top_min_dist = n0.maxY - n1.minY;
        if (top_min_dist < min_dist)
        {
          collisionSide = 2;
          min_dist = top_min_dist;
        }
      }
      if(n0.maxY > n1.maxY)
      {
        float bot_min_dist = n1.maxY - n0.minY;
        if (bot_min_dist < min_dist)
        {
          collisionSide = 3;
          min_dist = bot_min_dist;
        }
      }
    }

    // handle collisions in y axis
    if (!(n0.minX > n1.maxX || n1.minX > n0.maxX))
    {
      // left

      if(n0.maxX > n1.minX)
      {
        float d = n0.maxX - n1.minX;

        if (d < min_dist)
        {
          min_dist = d;
          collisionSide = 0;
        }
      }
      if (n0.maxX > n1.maxX)
      {
        float right_min_dist = n1.maxX - n0.minX;
        if (right_min_dist < min_dist)
        {
          collisionSide = 1;
          min_dist = right_min_dist;
        }
      }
    }

    min_dist += 2f; // for rounding errors...

    switch (collisionSide)
    {
    case 0: // left
      if (verbose)  println("LEFT");
      float amountToMove = min_dist;

      if (n0.movable && n1.movable) amountToMove /= 2f;

      if (n0.movable)
      {
        n0.move(-amountToMove,0);
        n0.vel.x = -n0.vel.x + 0.1*n1.vel.x;
      }
      if (n1.movable)
      {
        n1.move(amountToMove,0);
        n1.vel.x = -n1.vel.x + 0.1*n0.vel.x;
      }
      break;

    case 1: // right
      if (verbose) println("RIGHT");
      amountToMove = min_dist;

      if (n0.movable && n1.movable)  amountToMove /= 2f;

      if (n0.movable)
      {
        n0.move(amountToMove,0);
        n0.vel.x = -n0.vel.x + 0.1*n1.vel.x;
      }
      if (n1.movable)
      {
        n1.move(-amountToMove,0);
        n1.vel.x = -n1.vel.x + 0.1*n0.vel.x;
      }

      break;

    case 2: // top
      if (verbose)  println("TOP");
      amountToMove = min_dist;
      if (n0.movable)
      {
        if (n1.movable)
          amountToMove /= 2f;
        n0.move(0,-amountToMove);
        n0.vel.y = -n0.vel.y + 0.1*n1.vel.y;
      }
      if (n1.movable)
      {
        n1.move(0,amountToMove);
        n1.vel.y = -n1.vel.y + 0.1*n0.vel.y;
      }
      break;

    case 3: // bottom
      if (verbose) println("BOTTOM");

      amountToMove = min_dist;
      if (n0.movable)
      {
        if (n1.movable)
          amountToMove /= 2f;
        n0.move(0,amountToMove);
        n0.vel.y = -n0.vel.y + 0.1*n1.vel.y;
      }
      if (n1.movable)
      {
        n1.move(0,-amountToMove);
        n1.vel.y = -n1.vel.y + 0.1*n0.vel.y;
      }
      break;
    }
  }

  // end class Collider
}



