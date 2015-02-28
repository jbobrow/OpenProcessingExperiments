
/*
**-**  Made By Rohan Sinha
 **-**  Distributed by Rohan Sinha Technologies Inc. 
 **-**  Copyright 2009
 **-**  October 30, 2009
 */

/* Directions
-------Use WASD or Arrow keys to control the two snakes
-------Select Difficulty before playing
*/

Apple[] apple;        //Draw Apples

int d = 1;            //Distance snakes move on keyPress

float f = 500;        //frameRate variable

int currentScreen = 0;
int difficulty = 0;

int scoreP1;                  //Player 1 Score   
int scoreP2;                  //Player 2 Score

int s = 15;                   //size of snakes
int x = width/4;              //X-Coordinate of Snake 1
int y = height/2;             //Y-Coordinate of Snake 1
int a = width/4*3;            //X-Coordinate of Snake 2
int b = height/2;             //Y-Coordinate of Snake 2
int g1 = 238;                 //Green of Snake 1
int b1 = 238;                 //Blue of Snake 1
int g2 = 150;                 //Green of Snake 2
int b2 = 187;                 //Blue of Snake 2
float m1X = x + s/2;          //X-Coordinate of center of Snake 1
float m1Y = y + s/2;          //Y-Coordinate of center of Snake 1
float m2X = a + s/2;          //X-Coordinate of center of Snake 1
float m2Y = b + s/2;          //Y-Coordinate of center of Snake 1

boolean wPressed;
boolean aPressed;
boolean sPressed;
boolean dPressed;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean mPressed;

void setup()
{
  size(800, 500);
  background(0);
  frameRate(f);
  scoreP1 = 0;         //Player 1 Score
  scoreP2 = 0;         //Player 2 Score

  apple = new Apple[2];
  for(int i = 0; i < apple.length; i++)
  {
    apple[i] = new Apple();
    apple[i].c = color(255, 0, 0);                       //Color
    apple[i].x = (int)random(25, width-25);              //X-Coordinate of apple
    apple[i].y = (int)random(25, height-25);             //Y-Coordinate of apple
    apple[i].z = (int)random(10,15);                     //Size of apple
  }
  currentScreen = 3;
}

void draw()
{
  if(currentScreen == 3)  //Opening Screen
  {
    PFont openScreen;
    openScreen = loadFont("VladimirScript-30.vlw");
    textFont(openScreen, 44); 
    text("Begin Game", width/2 - 100, height/3);
    text("Options", width/2 - 65, height/2);
  
    PImage snakeL;
    snakeL = loadImage("gameSnakeL.jpg");
    PImage snakeR;
    snakeR = loadImage("gameSnakeR.jpg");
    snakeR.resize(width/8, height/3);
    image(snakeR, width/6, height/4);
    snakeL.resize(width/8, height/3);
    image(snakeL, width*3/4, height/4);   
    
    PFont reset;
    reset = loadFont("SegoeUI-20.vlw");
    textFont(reset, 18); 
    text("To return to the home screen, refresh the web browser", width/5, height-25);
   }
  
  if(mousePressed == true && mouseX > width/2 - 100 && mouseX < width/2 + 90 && mouseY > height/3 - 20 && mouseY < height/3)
  {
    currentScreen = 1;     //Begin Game
  }
  
  if(mousePressed == true && mouseX > width/2 - 65 && mouseX < width/2 + 55 && mouseY > height/2 - 20 && mouseY < height/2)
  {
    currentScreen = 2;     //Options
  }
  
  if(currentScreen == 1)  //Begin Game
  { 
    PFont reset;
    reset = loadFont("SegoeUI-20.vlw");
    textFont(reset, 18); 
    text("To return to the home screen, refresh the web browser", width/5, height*25); 
    
    fill(0, 15);
    rect(0, 0, width, height);
    fill(0, g1, b1);
    rect(x, y, s, s);
    fill(0, g2, b2);
    rect(a, b, s, s);
    checkCollision();
    if ((x > width) || (x < 0) || (y > height) || (y < 0))
    {
      x = width/4;
      y = height/2;
      rect(x, y, s, s);
      scoreP1 = 0;
    }
    for(int i = 0; i < apple.length; i++)
    {
      apple[i].show();
    }
    if ((a > width) || (a < 0) || (b > height) || (b < 0))
    {
      a = width/4*3;
      b = height/2;
      rect(a, b, s, s);
      scoreP2 = 0;
    }
    
    if (wPressed == true)
    {
      y = y-d;
    } 
    if (aPressed == true)
    {
      x = x-d;
    } 
    if (sPressed == true)
    {
      y = y+d;
    } 
    if (dPressed == true)
    {
      x = x+d;
    } 
    if (upPressed == true)
    {
      b = b-d;
    } 
    if (downPressed == true)
    {
      b = b+d;
    } 
    if (leftPressed == true)
    {
      a = a-d;
    } 
    if (rightPressed == true)
    {
      a = a+d;
    } 
     /*
      g1--;
     b1--;
     b2--;
     */
    PFont Score;
    Score = loadFont("ComicSansMS-18.vlw");
    textFont(Score, 18); 
    text("Player 1: "+scoreP1, 5, 20);
    text("Player 2: "+scoreP2, width-110, 20);
  }

  if(currentScreen == 2)  //Options
  {
    PFont openScreen;
    openScreen = loadFont("VladimirScript-30.vlw");
    background(0);
    textFont(openScreen, 44); 
    text("Difficulty", width/2, 100);
    text("Easy", width/4, 400);
    text("Medium", width/2, 400);
    text("Hard", width*3/4, 400);
    if(mousePressed == true && mouseX > width/4 && mouseX < width/4 + 100 && mouseY > 300 && mouseY < 400)
    {
      difficulty = 1;
    }
    if(mousePressed == true && mouseX > width/2 && mouseX < width/2 + 100 && mouseY > 300 && mouseY < 400)
    {
      difficulty = 2;
    }
    if(mousePressed == true && mouseX > width*3/4 && mouseX < width*3/4 + 100 && mouseY > 300 && mouseY < 400)
    {
      difficulty = 3;
    }
    PFont reset;
    reset = loadFont("SegoeUI-20.vlw");
    textFont(reset, 18); 
    text("To return to the home screen, refresh the web browser", width/5, height-25);
  }
  if(difficulty == 1)
  {
    d = 2;
    f = 25;
    currentScreen = 1;
  }
  if(difficulty == 2)
  {
    d = 3;
    f = 75;
    currentScreen = 1;
  }
  if(difficulty == 3)
  {
    d = 5;
    f = 150;
    currentScreen = 1;
  }
  if(x > apple[0].x - apple[0].z && y > apple[0].y - apple[0].z && x < apple[0].x + apple[0].z && y < apple[0].y + apple[0].z) 
  {
    apple[0].x = (int)random(25, width-25);            //X-Coordinate of apple
    apple[0].y = (int)random(25, height-25);           //Y-Coordinate of apple
    background(0);
    scoreP1 += 10;
    println(scoreP1);
  }
  if(x > apple[1].x - apple[1].z && y > apple[1].y - apple[1].z && x < apple[1].x + apple[1].z && y < apple[1].y + apple[1].z)
  {
    apple[1].x = (int)random(25, width-25);            //X-Coordinate of apple
    apple[1].y = (int)random(25, height-25);           //Y-Coordinate of apple
    background(0);
    scoreP1 += 10;
    println(scoreP1);
  }
  if(a > apple[0].x - apple[0].z && b > apple[0].y - apple[0].z && a < apple[0].x + apple[0].z && b < apple[0].y + apple[0].z) 
  {
    apple[0].x = (int)random(25, width-25);            //X-Coordinate of apple
    apple[0].y = (int)random(25, height-25);           //Y-Coordinate of apple
    background(0);
    scoreP2 += 10;
    println(scoreP2);
  }
  if(a > apple[1].x - apple[1].z && b > apple[1].y - apple[1].z && a < apple[1].x + apple[1].z && b < apple[1].y + apple[1].z)
  {
    apple[1].x = (int)random(25, width-25);            //X-Coordinate of apple
    apple[1].y = (int)random(25, height-25);           //Y-Coordinate of apple
    background(0);
    scoreP2 += 10;
    println(scoreP2);
  }
}

class Apple
{
  float x, y;
  color c;
  int z;

  void show()
  {
    fill(c);
    ellipse(x,y, z,z);
  }
}

void checkCollision()
{
  float distanceSnake = dist(a, b, x, y);
  int distSumSnake =  s;
  float distSumSA1 = dist(apple[0].x, apple[0].y, m1X-7.5, m1Y-7.5);
  float distSumSA2 = dist(m2X-7.5, m2Y-7.5, apple[1].x, apple[1].y);

  float distanceSA1 = dist(m1X, m1Y, apple[0].x, apple[0].y);
  float distanceSA2 = dist(m2X, m2Y, apple[1].x, apple[1].y);

  if(distanceSnake < distSumSnake)
  {
    x = width/4;
    y = height/2;
    rect(x, y, 15, 15); 
    scoreP1 = 0;

    a = width/4*3;
    b = height/2;
    rect(a, b, 15, 15);
    scoreP2 = 0;
  }

  if(distanceSA1 > distSumSA1)
  {
    x = width/4;
    y = height/2;
    rect(x, y, 15, 15);
    scoreP1 = 0;

    a = width/4*3;
    b = height/2;
    rect(a, b, 15, 15);
    scoreP2 = 0;
  }

  if(distanceSA2 > distSumSA2)
  {
    x = width/4;
    y = height/2;
    rect(x, y, 15, 15);
    scoreP1 = 0;

    a = width/4*3;
    b = height/2;
    rect(a, b, 15, 15);
    scoreP2 = 0; 
  }
}

void keyPressed()
{
  if (key == 'W' || key == 'w')
  {
    wPressed = true;
    g1 = 238;
    b1 = 238;
    b2 = 187;
  }
  if (key == 'A' || key == 'a')
  {
    aPressed = true;
    g1 = 238;
    b1 = 238;
    b2 = 187;
  }
  if (key == 'S' || key == 's')
  {
    sPressed = true;
    g1 = 238;
    b1 = 238;
    b2 = 187;
  }
  if (key == 'D' || key == 'd')
  {
    dPressed = true;
    g1 = 238;
    b1 = 238;
    b2 = 187;
  }
  if (key == 'M' || key == 'm')
  {
    mPressed = true;
  }
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      upPressed = true;
      g1 = 238;
      b1 = 238;
      b2 = 187;
    }
    if (keyCode == DOWN) 
    {
      downPressed = true;
      g1 = 238;
      b1 = 238;
      b2 = 187;
    }
    if (keyCode == LEFT) 
    {
      leftPressed = true;
      g1 = 238;
      b1 = 238;
      b2 = 187;
    }
    if (keyCode == RIGHT) 
    {
      rightPressed = true;
      g1 = 238;
      b1 = 238;
      b2 = 187;
    }
  } 
}

void keyReleased()
{
  if (key == 'W' || key == 'w')
  {
    wPressed = false;
  }
  if (key == 'A' || key == 'a')
  {
    aPressed = false;
  }
  if (key == 'S' || key == 's')
  {
    sPressed = false;
  }
  if (key == 'D' || key == 'd')
  {
    dPressed = false;
  }
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      upPressed = false;
    }
    if (keyCode == DOWN) 
    {
      downPressed = false;
    }
    if (keyCode == LEFT) 
    {
      leftPressed = false;
    }
    if (keyCode == RIGHT) 
    {
      rightPressed = false;
    }
  } 
}

