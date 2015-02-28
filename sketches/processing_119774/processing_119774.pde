
/* Programming Project 6
 * Daniel Hamilton
 * 11/6/2013
 * 
 * DESCRIPTION: I remade the original "Freeze Tag" game to incorporate different levels and 
 * a difficulty increase between levels. The rectangles will also unfreeze each other if they 
 * collide. The game is played by trying to freeze all of the rectangles by clicking on them.
 * If you successfully freeze all the rectangles in three consecutive levels, then you win the
 * game. The rectangles get smaller and faster with each successive level.
 * 
 */

Box[] box;    //an array stores all the rectangle objects

int level = 1;    //the level is controlled by an integer variable

boolean pause = false;    //these booleans control the screens that are shown after each level
boolean gameOver = false;

void setup()
{
  size(500, 500);

  box = new Box[5];    //create 5 rectangles with randomized properties

  for (int i = 0; i < box.length; i++)
  {
    box[i] = new Box();
  }
}

void draw() 
{
  background(0);

  updateBoxes();  //this method uses a for loop to call the display() and move() methods for every rectangle
  
  checkCollision();  //using the boolean isBoxColliding(), this method checks for collision between the boxes
  
  checkGameState();  //checks to see if all rectangles are frozen and then ends the level or game
  
  fill(255);
  textSize(24);
  textAlign(CORNER);
  text("Level: " + level, 15, 30);

  if (pause)    //shown between levels and at the end of the game
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    if (gameOver)
    {
      textSize(56);
      textAlign(CENTER);
      text("You WIN!", width/2, height/2);
    }
    else
    {
      textAlign(CENTER);
      textSize(48);
      text("LEVEL " + (level - 1) + " COMPLETE!", width/2, height*4/9);
      textSize(24);
      text("Click to continue", width/2, height*6/9);
    }
  }
}

void checkCollision()
{
  for (int i = 0; i < box.length; i++)
  {
    for (int j = i; j < box.length; j++)  //starting at 'i' so it doesnt check the same 2 rectangles twice
    {
      if (!(i == j))  //so it doesnt check for collision with itself
      {
        if (isBoxColliding(box[i], box[j]))
        {
          if (box[i].isFrozen())
          {
            box[i].unfreeze();
          }

          if (box[j].isFrozen())
          {
            box[j].unfreeze();
          }
        }
      }
    }
  }
}

boolean isBoxColliding(Box b1, Box b2)
{
  float xDist = abs(b1.getCenterX() - b2.getCenterX());
  float yDist = abs(b1.getCenterY() - b2.getCenterY());

  if ((xDist < b1.getW()/2 + b2.getW()/2) && (yDist < b1.getH()/2 + b2.getH()/2))
  {
    return true;
  }
  return false;
}

void levelComplete()
{
  pause = true;
  level++;
  for (int i = 0; i < box.length; i++)
  {
    box[i].unfreeze();
    box[i].gottaGoFast();  //speed up and make smaller
  }
}

void checkGameState() 
{
  if (box[1].isFrozen() && 
    box[2].isFrozen() && 
    box[3].isFrozen() && 
    box[4].isFrozen() && 
    box[0].isFrozen()) 
  {
    levelComplete();

    if (level > 3)   //after the 3rd level, the game is ended
    {
      gameOver = true;
    }
  }
}

void updateBoxes()  
{
  for (int i = 0; i < box.length; i++)
  {
    box[i].display();
    box[i].move();
  }
}


void mousePressed()   //advances game to next level
{
  if (pause && !gameOver)
  {
    pause = false;
  }

  for (int i = 0; i < box.length; i++)
  {
    if (box[i].clicked()) box[i].freeze();
  }
}

class Box
{
  float x, y, w, h, xVel, yVel, centerX, centerY, startXVel, startYVel;
  color c;
  boolean frozen;

  Box() {
    x = random(50, 250);    //no input parameters because everything is random anyway
    y = random(50, 250);
    w = random(40, 80);
    h = random(40, 80);
    xVel = random(-3, 3);
    yVel = random(-3, 3);
    startYVel = yVel;    //store the velocities before freezing
    startXVel = xVel;
    c = color(random(255), random(255), random(255));
    centerX = x + w/2;    //coordinates for the center of the rectangle for detecting collision
    centerY = y + h/2;
    frozen = false;
  }

  void gottaGoFast()    //called after each level to speed up by 125% and make it 75% the original size 
  {
    xVel *= 1.25;
    yVel *= 1.25;
    startYVel = yVel;
    startXVel = xVel;

    w *= .75;
    h *= .75;
  }

  float getW()    //accessor methods
  {
    return w;
  }

  float getH()
  {
    return h;
  }

  float getCenterX()
  {
    return centerX;
  }

  float getCenterY()
  {
    return centerY;
  }

  void update() 
  {    
    display();
    move();
  }

  void freeze() 
  {          
    c = color(255, 0, 0);
    xVel = 0;
    yVel = 0;
    frozen = true;
  }

  void unfreeze()    //continues moving at original velocity
  {
    xVel = startXVel;
    yVel = startYVel;
    c = color(random(255), random(255), random(255));
    centerX = x + w/2;
    centerY = y + h/2;
    frozen = false;
  }

  boolean clicked()     //determines if rectangle was clicked
  {
    if (x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h) {
      return true;
    }
    return false;
  }

  boolean isFrozen()     //determines if rectangle is frozen
  {        
    if (frozen) return true;
    return false;
  }

  void display() 
  {
    fill(c);
    rect(x, y, w, h);
  }  

  void move() 
  {
    x += xVel;
    y += yVel;

    centerX = x + w/2;
    centerY = y + h/2;

    if (x + w >= width) 
    {
      x = width - w;
      xVel *= -1;
      startXVel *= -1;
      c = color(random(255), random(255), random(255));
    }

    if (y + h >= height) 
    {
      y = width - h;
      yVel *= -1;
      startYVel *= -1;
      c = color(random(255), random(255), random(255));
    }

    if (x <= 0) 
    {
      x = 0;
      xVel *= -1;
      startXVel *= -1;
      c = color(random(255), random(255), random(255));
    }

    if (y <= 0) 
    {
      y = 0;
      yVel *= -1;
      startYVel *= -1;
      c = color(random(255), random(255), random(255));
    }
  }
}



