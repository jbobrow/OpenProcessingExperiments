
/* @pjs crisp=true; 
globalKeyEvents=true; 
pauseOnBlur=true; 
preload="defeat.png,intro.png,victory.png"; 
 */

/***********************
*  Snake game
*  Copyright(c) 2013 Alexey Tkachenko
*  GPL v2 License:
*  https://www.gnu.org/licenses/gpl-2.0.html
*  Freedom Included.
*  NO WARRANTY.
***********************/

//Snake consists of blocks, which are stored as linked lists
class Block
{
  public float x, y;
  public float blockSize;
  public float xDirection, yDirection;
  public Block next, prev;
  
  public Block()
  {
    this( width/2,  height/2, 10); 
  }
  
   public Block(float posX, float posY)
  {
    this( posX, posY, 10); 
  }
  
  public Block( float posX, float posY, float size)
  {
    x = posX;
    y = posY;
    blockSize = size;
    xDirection = 0;
    yDirection = 0;
    prev = null;
    next = null;
  }
  
  public void draw()
  {    
    fill(0); 
    rect(x, y, blockSize, blockSize);    
  }
  
  //Automatic (with each frame) movement of block based on direction
  //call this in snake's draw method but only for head block
  //Handling of other blocks following the head is done in Snake class
  public void move()
  {
       
    x += xDirection;
    y += yDirection;
    //Sending back across the screen(sort of like going through)
    if (x >= width)
    {
      x = 0;
    }
    else if (x < 0)
    {
      x = width;
    }
    if( y >= height )
    {
      y = 0;
    }
    else if( y < 0)
    {
      y = height;
    }      
  }  
  
  //Appending new block as the prev to current block based on head's direction
  public void append(Block head)
  {
    if( head.xDirection < 0)
      prev = new Block(x+blockSize,y);
    else if (head.xDirection > 0)
      prev = new Block(x-blockSize,y);
    else if (head.yDirection < 0 )
      prev = new Block(x,y+blockSize);
    else //if ( head.yDirection > 0) and in general
      prev = new Block(x,y-blockSize);
    prev.next = this;    
  }
} //End of Block class declaration


//Our hero, our hero (as a class)
class Snake
{
  public int length;  
  private Block head;
  public int MAX_LENGTH = 200;
  
  public Snake()
  {
    this( width/2 - (width/2)%10,  height/2 - (height/2)%10, 10 );       
  } 
  
  public Snake( float posX, float posY)
  {
    this( posX,  posY,  10);       
  } 
  
  public Snake( float posX, float posY, float size)
  {
    head = new Block( posX,  posY,  size);  
    length = 1;
  } 
  
  //Draws snake
  public void draw()
  {
       
    Block ptr;
    ptr = head;    
    while( ptr != null )
    {
      ptr.draw();
      ptr = ptr.prev;      
    }
  }
  
  //Moves snake according to Directions every frame
  public void move()
  {
    Block ptr;
    float lastX, lastY, curX, curY;
    lastX = head.x;
    lastY = head.y;
    head.move();
    ptr = head.prev;    
    while( ptr != null )
    {  
      curX = ptr.x;
      curY = ptr.y;
      ptr.x = lastX;
      ptr.y = lastY;
      lastX = curX;
      lastY = curY;
      ptr = ptr.prev;           
    }
    
  }  
  
  //To switch movement directions
  public void chDir( float xDir, float yDir )
  {
    Block ptr; 
    PVector vectPrev;   
    
    vectPrev = new PVector( head.prev.x, head.prev.y );    
    //Normalize the direction change attempt
    //e.g. Do not allow user to instantly start moving baack
    //when he is moving forward
    if ( xDir < 0 ) //moving left
    {
      if( vectPrev.x < head.x)
        return; // do not change
    }
    else if( xDir > 0 ) //moving right
    {
      if( vectPrev.x > head.x)
        return; // do not change
    }
    else if( yDir < 0 ) // moving up
    {
      if( vectPrev.y < head.y)
        return; // do not change
    }
    else if( yDir > 0 ) //moving down
    {
      if( vectPrev.y > head.y)
        return; // do not change
    } 
    head.xDirection = xDir;
    head.yDirection = yDir;   
  }
  
  //Finds tail of the snake
  public Block findLast()
  {
    Block ptr;
    ptr = head;
    while( ptr.prev != null )
    {
      ptr = ptr.prev;
    }
    return ptr;
  }
  
  //Add new block to tail
  public void addNewBlock()
  {
    Block tail;
    for ( int i = 0; i < 1; i++ )
    {
      tail = findLast();
      tail.append( head ); //pass head here to know snake's direction
      length++;
    }
  }
  
  public float size()
  {
    return head.blockSize;
  }
  
  public PVector headCoords()
  {
    return new PVector(head.x, head.y);
  }  
  
  public boolean selfCollision()
  {
    Block ptr;
    ptr = head.prev;
    while( ptr != null )
    {
      PVector centerHead, centerVect;
      centerHead = new PVector( (head.x + 5), (head.y + 5) );
      centerVect = new PVector( (ptr.x + 5), (ptr.y + 5) );
      if( abs(centerHead.y - centerVect.y) < (10) )
      {
        if( abs(centerHead.x - centerVect.x) < (10) )
        {
          return true;
        }      
      }
      ptr = ptr.prev;
    } 
    return false;
  } 
} //end of Snake class declaration


//Game scene class, responsible for generated food objects in game
class Scene
{
  private int numObj;
  private PVector food;
  public boolean toDraw;
  
  public Scene()
  {
    numObj = 0;
    toDraw = true;
  }
  
  public void placeFood()
  {
    float tmpX, tmpY;
    numObj = 1;
    tmpX = random(10, width-20);
    tmpY = random(10, height-20);
    tmpX = tmpX - tmpX%10;
    tmpY = tmpY - tmpY%10;
    food = new PVector(tmpX, tmpY);
  }
  
  public void draw()
  {
    if( food != null && toDraw )
    {
      fill( 255, 0, 0);
      rect(food.x, food.y, 10, 10);
    }
  }
  
  public void removeFood()
  {
    numObj = 0;
    food = null;
  }
  
  public boolean processCollisions(PVector vect)
  {     
    PVector centerFood, centerVect;
    centerFood = new PVector( (food.x + 5), (food.y + 5) );
    centerVect = new PVector( (vect.x + 5), (vect.y + 5) );
    if( abs(centerFood.y - centerVect.y) < (10) )
    {
      if( abs(centerFood.x - centerVect.x) < (10) )
      {
        return true;
      }
    }
    return false;
  }
} //end of Scene class declaration

/****************Global variables***************/

//Snake object for latter drawing, processing, etc.
Snake snake;
//Frame parity counter, to control update speed
int frameParity;
//Scene object that will contain some generated objects of the game
Scene scene;
//State of the game
boolean playing;
String state;
PImage stopScreen;
//Additional visual effects
Effect1 eff;

/********************MAIN ROUTINES**************/

//Initializations
void setup()
{
  size(500, 500);
  background(255);
  frameRate(60);
  frameParity = 0;
  snake = new Snake();
  for( int i = 0; i<1; i++)
    snake.addNewBlock();  
  scene = new Scene();
  scene.placeFood();
  scene.toDraw = true;
  playing = false;
  state = "";
  eff = new Effect1();
}

//Called every frame
void draw()
{
  PVector snakeHead;
  background(255);
  stroke(255);
  
  frameParity = (frameParity+1)%3; //every 3d frame
    
  snake.draw();
  scene.draw();
  
  if( playing)
  {
    if (frameParity == 0) //decreses movement speed of snake without affecting fps
      snake.move();
      
    snakeHead = snake.headCoords();     
    if ( scene.processCollisions( snakeHead) ) //we ate food, let's grow
    {
      scene.removeFood();
      snake.addNewBlock();
      checkScore(snake);
      scene.placeFood();
    }
    if( snake.selfCollision() ) //OUCH!
    {
      state = "defeat";
      endGame();
    }
  }
  else //!playing
  {    
    endGame(); //draw End game screen in a loop
  }  
}

/***************Helper Functions******************/

void checkScore(Snake snake)
{
  if (snake.length >= snake.MAX_LENGTH)
  {
    state = "victory";
    endGame();
  }
}

void startGame()
{
  if( !playing )
  {
    setup();
    playing = true;
    state = "";
    snake.chDir(0, snake.size());
  }
}

void endGame()
{
  playing = false;  
  if ( state == "defeat")
  {
    //eff.draw();
    stopScreen = loadImage("defeat.png");
  }
  else if ( state == "victory")
  {
    eff.draw();
    stopScreen = loadImage("victory.png");
  }
  else
  {
    //eff.draw();
    stopScreen = loadImage("intro.png");
    scene.toDraw = false;
  }
  imageMode(CENTER);
  image(stopScreen, width/2, height/2, stopScreen.width, stopScreen.height);
}

/**********************EVENTS*********************/


void mousePressed()
{
  startGame();
}

void keyPressed()
{  
  if( key == 'A' || key == 'a' || keyCode == LEFT )
  {
    snake.chDir(-snake.size(), 0);
  }
  else if( key == 'D' || key == 'd' || keyCode == RIGHT )
  {
    snake.chDir(snake.size(), 0);
  }
  else if( key == 'W' || key == 'w' || keyCode == UP )
  {
    snake.chDir(0, -snake.size());
  }
  else if( key == 'S' || key == 's' || keyCode == DOWN )
  {
    snake.chDir(0, snake.size());
  }
}
class Effect1
{
  //
  //All credit for this effect goes to Reinhard Langner 
  //http://www.openprocessing.org/sketch/100965
   
   
  private Ball[] aBall;
  private int MAX_BALL = 300;
  private int MAX_BALL_AGE = 150;
  private float MAX_BALL_SIZE = 30;
  
  public Effect1()
  { 
    
    aBall = new Ball[MAX_BALL];
    for (int i=0; i<MAX_BALL; i++) {
      aBall[i] = new Ball(i, i);
    }
  } 
   
  public class Ball {
    PVector pos;
    PVector vel;
    int age;
    float size;
    float sizeVel;
    float sizeMax;
    color BallColor;
     
    Ball(float x, float y) {
      pos = new PVector(x, y, 0);
      vel = new PVector(random(-1,1), random(-1,1));
      age = int(random(20, MAX_BALL_AGE));
      size = 0;
      sizeMax = random(10,MAX_BALL_SIZE);
      sizeVel = sizeMax / (age/2);
       
      int r = (int)random(0,255);
      int g = (int)random(0,255);
      int b = (int)random(0,255);
      BallColor = color( r,g,b, random(0,255) );
       
    }
   
    boolean update() {
      pos.add(vel);
       
      // reflect at the edges
      if (pos.x < size) {
        vel.x = -vel.x;
        pos.x = size;
      }
      if (pos.x > (width-size)) {
        vel.x = -vel.x;
        pos.x = width-size;
      }
      if (pos.y < size) {
        vel.y = -vel.y;
        pos.y = size;
      }
      if (pos.y > (height-size)) {
        vel.y = -vel.y;
        pos.y = height-size;
      }   
       
      size += sizeVel;
      if (size > sizeMax) {
         sizeVel = -sizeVel;
         size = sizeMax;
      }
      age--;
      return age > 0;
    }
   
    void draw() {
      fill(BallColor);
      stroke(255);
      strokeWeight(1);
      ellipse(pos.x, pos.y, size, size);
    }
     
  }
   
  public void  draw()
  {  
    // update balls
    int idxBall = -1;
    for (int i=0; i<MAX_BALL; i++) {
      if (aBall[i].update() == false) {
        idxBall = i;
        aBall[i] = new Ball(random(0,width), random(0,height));
      }
    }  
      
    for (int i=0; i<MAX_BALL; i++) {
      aBall[i].draw();
    }
  }
}


