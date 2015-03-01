
/* @pjs preload="bug.jpg"; */

/*
 Code allows to tranasform an image into particles. 
 myLoadedPicture is the original picture, myResultPicture is the PImage holding the particles (blocks). 
 */

Boolean isInitialized = false;

final int BG_VALUE      = 88;//bg color
final int STILL         = 0;//blocks are not moving
final int MOVING        = 1;//blocks are following the mouse
final int BOMB          = 2;//blocks are bombing away from the mouse
final int INITIALIZING  = 3;//blocks are returning to their original positions
final int TIMER_LONG_MOUSE_PRESS = 20;//how long the mouse has to be pressed to trigger a tween
final int STROKE_WEIGHT = 2;//stroke weight of the result image border
final int MARGIN_TOP = 40;
final int MARGIN_LEFT = 30;

float time;//goes from 0 to 1
float tween;//tweened variable
final float TWEEN_DURATION = 2;//seconds
boolean isTweening = false;
boolean isClicked = false;
PVector lastPosition[][];//position of the blocks when lauching a tween

int blockW = 9;//block width
int blockH = 9;//block height
boolean blocksFitW;//true if all blocks are the same width
boolean blocksFitH;//true if all blocks are the same height
int gap = 1;//gap between two consecutive blocks
int nbBlocksW;//number of x axis blocks
int nbBlocksH;//number of y axis blocks
float distanceMin;//min distance between the blocks and the mouse
float speedMax;//max speed of the blocks
int resultPictureW;//result picture width
int resultPictureH;//result picture height
int timerDrag = 0;//detects how long the mouse click lasts
float G = -10;//gravitational force

Block blocks[][];
PImage myLoadedPicture;//original picture
int loadedPicW;
int loadedPicH;
PImage myResultPicture;//result picture
int currentMode = STILL;
int previousMode = STILL;

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
void setup()
{
  size(800, 700, P2D);
  background(BG_VALUE);

  myLoadedPicture = loadImage("bug.jpg");
}
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

void initPictures()
{
  loadedPicW = myLoadedPicture.width;
  loadedPicH = myLoadedPicture.height;
  if (loadedPicW * loadedPicH > 0)
  {
    blocksFitW = (loadedPicW % blockW) == 0;
    blocksFitH = (loadedPicH % blockH) == 0;

    nbBlocksW = (int)(loadedPicW/blockW) + (blocksFitW ? 0 : 1);
    nbBlocksH = (int)(loadedPicH/blockH) + (blocksFitH ? 0 : 1);
    resultPictureW = loadedPicW + (nbBlocksW-1) * gap;
    resultPictureH = loadedPicH + (nbBlocksH-1) * gap;
    myResultPicture = createImage(resultPictureW, resultPictureH, RGB);
    distanceMin = max(resultPictureW, resultPictureH) / 5;
    speedMax = max(resultPictureW, resultPictureH) / 5;

    G = min(-resultPictureW / 30, -resultPictureH / 30);

    blocks = new Block[nbBlocksW][nbBlocksH];
    int currentBlockW;
    int currentBlockH;

    for (int i = 0; i < nbBlocksW; i++)
    {
      for (int j = 0; j < nbBlocksH; j++)
      {
        currentBlockW = blockW;
        currentBlockH = blockH;

        if (i == nbBlocksW-1)
        {//size of the right column blocks
          currentBlockW = blocksFitW ? blockW : loadedPicW % blockW;
        }
        if (j == nbBlocksH-1)
        {//size of the bottom line blocks
          currentBlockH = blocksFitH ? blockH : loadedPicH % blockH;
        }

        blocks[i][j] = new Block(new PVector(i*blockW + i*gap, j*blockH + j*gap), currentBlockW, currentBlockH);
      }
    }
    displayParticles();

    //frame around the image
    noFill();
    stroke(255);
    strokeWeight(STROKE_WEIGHT);
    rect(MARGIN_LEFT - STROKE_WEIGHT/2, MARGIN_TOP - STROKE_WEIGHT/2, resultPictureW + STROKE_WEIGHT, resultPictureH + STROKE_WEIGHT);
    //cleans bg when resizing
    fill(BG_VALUE);
    noStroke();
    rect(MARGIN_LEFT - STROKE_WEIGHT, MARGIN_TOP - STROKE_WEIGHT, width, height);
    
    isInitialized = true;
  }
}

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
void draw()
{
  if (isInitialized)
  {
    //check how long the mouse remains clicked
    if (isClicked)
    {
      timerDrag++;
      if (timerDrag > TIMER_LONG_MOUSE_PRESS)//lauch the reinitialization
      {
        timerDrag = 0;
        currentMode = INITIALIZING;
        isClicked = false;
      }
    }

    if (currentMode == INITIALIZING)
    {
      if (!isTweening)//the initialization mode was triggered but not launched yet
      {
        time = 0;
        isTweening = true;
        Block currBlock;
        for (int i = 0; i < nbBlocksW; i++)
        {
          for (int j = 0; j < nbBlocksH; j++)
          {
            currBlock = blocks[i][j];
            currBlock.lastPos = currBlock.pos.get();//stores the start position for the tween
            currBlock.speed = new PVector(0, 0);
          }
        }
      } else
      {
        if (time >= 1.0)
        {
          for (int i = 0; i < nbBlocksW; i++)
          {
            for (int j = 0; j < nbBlocksH; j++)
            {
              blocks[i][j].pos = blocks[i][j].origin.get();
            }
          }     
          isTweening = false;
          currentMode = STILL;
        } else
        {
          time += .01;
        }
      }
//      tween = sin(map(time, 0, 1, 0, HALF_PI));
//      tween = map(time, 0, 1, 0, HALF_PI)*map(time, 0, 1, 0, HALF_PI);
        //cubic ease in/out
        float t = time*2;
        tween = t < 1 ? t*t*t/2 : ((t-=2)*t*t+2)/2;
    }
    displayParticles();

    if (currentMode == BOMB)//BOMB state only lasts one frame
    {
      currentMode = MOVING;
    }
  }
}
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

void displayParticles()
{
  stroke(200);
  rect(MARGIN_LEFT, MARGIN_TOP, resultPictureW, resultPictureH);
  //cleans the resultImage
  myResultPicture.loadPixels();
  for (int k = 0; k < resultPictureW*resultPictureH; k++)
  {
    myResultPicture.pixels[k] = color(0, 0, 0);
  }
  myResultPicture.updatePixels();

  //loop through all the blocks
  Block currBlock;
  for (int i = 0; i < nbBlocksW; i++)
  {
    for (int j = 0; j < nbBlocksH; j++)
    {
      currBlock = blocks[i][j];
      PVector coeff = currBlock.coeffSize;
      PVector p = currBlock.pos;
      currBlock.update(currentMode);
      //myResultPicture.blend(myLoadedPicture, i*blockW+1, j*blockH, currBlock.w, currBlock.h, (int)p.x, (int)p.y, (int)(currBlock.w*coeff.x), (int)(currBlock.h*coeff.y), BLEND);
      myResultPicture.copy(myLoadedPicture, i*blockW+1, j*blockH, currBlock.w, currBlock.h, (int)p.x, (int)p.y, (int)(currBlock.w*coeff.x), (int)(currBlock.h*coeff.y));
    }
  }  
  image(myResultPicture, MARGIN_LEFT, MARGIN_TOP);
}

void mousePressed() {
  if (!isInitialized)
  {
    initPictures();
  } else if (//detects if the mouse is over the result image
    mouseX > MARGIN_LEFT && mouseX < MARGIN_LEFT + resultPictureW &&
      mouseY > MARGIN_TOP && mouseY < MARGIN_TOP + resultPictureH)
  {
    if (currentMode == STILL)
    {
      currentMode = MOVING;
    } else if (currentMode == MOVING)
    {
      isClicked = true;
      currentMode = BOMB;
    }
  }
}

void mouseReleased() {
  timerDrag = 0;
  isClicked = false;
  if (currentMode == INITIALIZING)
  {
    currentMode = MOVING;
    isTweening = false;
    timerDrag = 0;
  }
}

void keyPressed()
{
  switch(key)
  {
  case 's':
    blockW = max(blockW - 2, 1);
    break;
  case 'f':
    blockW = min(blockW + 2, 80);
    break;
  case 'd':
    blockH = max(blockH - 2, 1);
    break;
  case 'e':
    blockH = min(blockH + 2, 80);
    break;
  case 'g':
    gap = max(gap - 1, 0);
    break;
  case 't':
    gap = min(gap + 1, 10);
    break;
  } 
  currentMode = STILL;
  initPictures();
}

class Block
{
  final static float BOUNCE_WALL = -.75;//affects the speed when hitting a wall
  final static float FRICTION    = .95;//air friction
  PVector speed;
  PVector pos;
  PVector origin;
  PVector lastPos;
  float mass;
  int w, h;//block width and height
  PVector coeffSize;//dilatation coeff
  float tweenCoeff = random(1.0, 1.15);

  Block(PVector o, int p_w, int p_h)
  {
    speed = new PVector(0, 0);
    coeffSize = new PVector(1, 1);
    mass = random(10) + 8;
    origin = o.get();
    pos = o.get();
    lastPos = o.get();
    w = p_w;
    h = p_h;
  }

  void update(int p_mode)
  {
    float distance;
    float theta;
    switch(p_mode)
    {
    case MOVING:
      distance = max(pos.dist(new PVector(mouseX-w/2 - MARGIN_LEFT, mouseY-h/2 - MARGIN_TOP)), distanceMin);
      theta = atan2(pos.y - (mouseY-h/2 - MARGIN_TOP), pos.x - (mouseX-w/2 - MARGIN_LEFT));
      speed.x += G * mass * cos(theta) / distance;
      speed.y += G * mass * sin(theta) / distance;
      speed.mult(FRICTION);
      break;
    case BOMB:
      distance = max(pos.dist(new PVector(mouseX - MARGIN_LEFT, mouseY - MARGIN_TOP)), distanceMin);
      theta = atan2(pos.y - mouseY + MARGIN_TOP, pos.x - mouseX + MARGIN_LEFT);
      speed = new PVector(cos(theta), sin(theta));
      speed.mult(distanceMin/distance * speedMax * (1 + 1 / (distanceMin*distanceMin)) * .8);
      break;
    case INITIALIZING:
      pos.x = map(min(tween*tweenCoeff, 1), 0.0, 1.0, lastPos.x, origin.x);
      pos.y = map(min(tween*tweenCoeff, 1), 0.0, 1.0, lastPos.y, origin.y);
      break;
    case STILL:
      break;
    }
    move();
  }

  void move()
  {
    pos.add(speed);
    
    float coeffSizeW, coeffSizeH;
    coeffSizeW = coeffSizeH = constrain(5/speed.mag(), .7, 1);
    if (blockW == 1)
    {
      coeffSizeW = 1;
    }
    if (blockH == 1)
    {
      coeffSizeH = 1;
    }

    //prevent blocks from exiting the frame
    if (pos.x < 0)
    {
      pos.x = 0;
      speed.x *= BOUNCE_WALL;
    } else if (pos.x > resultPictureW - w)
    {
      pos.x = resultPictureW - w;
      speed.x *= BOUNCE_WALL;
    }
    if (pos.y < 0)
    {
      pos.y = 0;
      speed.y *= BOUNCE_WALL;
    } else if (pos.y > resultPictureH - h)
    {
      pos.y = resultPictureH - h;
      speed.y *= BOUNCE_WALL;
    }
  }
}

