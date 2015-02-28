
/*Brian Chan
Started 10/29/2010
design plan:doodlejump -style
Art:ok
gameplay:INCOMPLETE
*/
ArrayList<Platform> platforms = new ArrayList<Platform>();
boolean lineRectangleIntersect;
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
int x, y;
int u, v;
int o, p;
int a, b;
int screenNumber;
int score;
int speed;
int doubleJump;
PFont font;
PImage aliens;
PImage robot;
PImage gameover;
PImage win;
void setup()
{
  size(600, 800);
  smooth();
  screenNumber = 0;
  doubleJump = 0;
  font = loadFont("TimesNewRomanPSMT-48.vlw");
  aliens = loadImage("Aliens.gif");
  robot = loadImage("Robot.gif");
  gameover = loadImage("gameover.gif");
  win = loadImage("win.gif");
  textFont(font, 36);
  x = 270;
  y = 640;
}

void draw()
{
  background(64, 128, 200);
  println(screenNumber);
  //instructions
  if (screenNumber == 0)
  {
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
    displayGameover();
  }
  else if (screenNumber == 2)
  {
    displayGamewin();
  }
  else if (screenNumber == 3)
  {
    movePlayers();
    drawPlayers(); 
    setSpeedLevel();
    //displayScore();
    //drawPlatforms();
    //drawObstacles():
    //drawIcecream();
  }
}
  void displayInstructions()
  {
   fill(0, 0, 255);
  text("Aliens have kidnapped your ice cream!", 25, 50); 
  image(aliens, 0, 50, 600, 500);
  text("Use the WASD keys to get it back!", 50, 600);
  text("Click to start!", 190, 700);
  if (mousePressed) screenNumber = 3;
  }
  
  void displayGameover()
  {y = 640;
  doubleJump = 0;
  fill(0, 0, 255);
  text("The aliens made off with your ice cream!", 10, 50);
  image(gameover, 0, 100);
  text("Go back in time?", 150, 750);
  if (mousePressed) screenNumber = 3;
  }
  
  void displayGamewin()
  {fill(0, 0, 255);
  text("You got your ice cream back!", 25, 50);
  image(win, 0, 100);
  text("Back to title screen?", 150, 650);
  if (mousePressed) screenNumber = 0;
  }
  
  void movePlayers()
  {y += 2;
   if (aPressed) x -= speed;
   if (sPressed) y += speed;
   if (dPressed) x += speed;
   if (doubleJump == 0)
   {
    if (wPressed) 
    {
    y = y - 50;
    doubleJump = 1;
    }
   }
   if (y > 800)
   {
    screenNumber = 1; 
   }
   if (x > 600)
   {
    x = x - 600;
   }
   if (x < 0)
   {
    x = x + 600;
   }
  }
  
  void drawPlayers()
  {
    image(robot, x, y, 60, 80);
  }
  
  void setSpeedLevel()
  {
    speed = 2;
  }
  
  void displayScore()
  {
    
  }
  
  void drawPlatforms()
  {

    /*{
      x = x + 200;
      doubleJump = 0;
    }*/
    platforms.add(new Platform(250, 721, 100, 10));
  }
  
  void drawObstacles()
{
    /*if (rectCircleIntersect(x, y, 60, 80, a, b, 100) == true)
  {
  y = y + 700;
  }  */
}
  
  void drawIcecream()
 {
   /*image(, o, p, 100, 100
    if (rectCircleIntersect(x, y, 60, 80, o, p, 100) == true)
  {
    screenNumber = 2;
  }  */
}
  
  void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
}
  
  void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}

