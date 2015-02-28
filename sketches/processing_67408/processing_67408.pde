
/*WHAT WE ARE GOING TO NEED
player 1 - positionX
jelly - positionX, positionY, direction

player 1 - score
*/

ball[] jellyfish;
PImage character, bg, EndSC, net, jelly;
PFont font;
int screenNum;
int x;
int y;
int speed2;
int score;
int life;
boolean upPressed, downPressed, leftPressed, rightPressed,rPressed;
 
void setup()
{
  frameRate(60);
  smooth();
  size(800, 800);
  imageMode(CENTER);
  font = loadFont("font.vlw");
  textFont(font,50);
  bg = loadImage("bg.png");
  EndSC = loadImage("bg.png");
  net = loadImage("net.png");
  jelly = loadImage("catjelly.png");
  jellyfish = new ball[10];
  for(int i = 0; i<10; i++)
  {
    jellyfish[i] = new ball();
    jellyfish[i].a = (int)random(0,650);
    jellyfish[i].b = (int)random(-200,-50);
    jellyfish[i].speed = (int)random(2,5);
  }
  x = y = width/2;
  speed2 = 15;
  screenNum = 1;
  score = 0;
  life = 5;
}
 
void draw()
{
  background(0);
  if (screenNum == 1)
  {
     
    for(int i = 0; i<jellyfish.length; i++)
    {
      jellyfish[i].show2();
    }
     
    x = y = width/2;
    image(bg,10,10);
    text("Use Arrow Keys", width/2, 750);
    if (mousePressed) screenNum = 2;
  }
 
  if (screenNum == 2)
  {
    for(int i = 0; i<jellyfish.length; i++)
    {
      jellyfish[i].show();
      jellyfish[i].checkCollisionJelly();
      jellyfish[i].charInside();
    }
       
    image(net, x+7, y+31, 100, 100); //net 
 
    if (rightPressed) x += speed2;
    if (leftPressed)  x -= speed2;
    if (upPressed)    y -= speed2;
    if (downPressed)  y += speed2;
   
    text("Score:"+score,20,30);
    text("Lives:"+life,550,30);
  }
  if (screenNum == 3)
  { 
    endscreen();
    life = 5;
    score = 0;
    text(" R To Replay",245, 600);
     
    for(int i = 0; i<jellyfish.length; i++)
    {
      jellyfish[i].nothing();
      jellyfish[i].speed = (int)random(2,5);
    }
  }
}
 
 
 
class ball
{
  float a, b;
  int speed, speed2;
 
 
  void show()
  {
 
    fill(252,175, 246);
    image(jelly,a,b, 50,50); //monsters 

 
    if (b > 700)
    {
      b = (int)random(-250,-50);
      life = life - 1;
      if( life == 0)
      {
        life = life;
        screenNum = 3;
      }
      a = random(700);
    }
    b += speed;
     
    if (screenNum == 1)
    {
      b = -100;
    }
    if (screenNum == 3)
    {
      b = -100;
      a = -200;
    }
  }
   
  void nothing()
  {
    b = random(-250,-50);
      a = -200;
  }
   
  void show2()
  {
    if (screenNum == 1)
    {
      a = random(width);
    }
  }
   
 void checkCollisionJelly()
  { 
    if(dist(x,y,a,b)<(50))
    {
      b = -100;
      a = random(5,695);
      score = score +1;
    }
  }
   
  void charInside()
  {
    if( x > width-5 ) x = width;
    if( y > height ) y = height;
    if( x < 2 ) x = 2;
    if( y < 2 ) y = 2;
  }
} // end of class
 
void endscreen()
{
    image(EndSC,350,350);
    if (rPressed)
    {
    screenNum = 1;
    }
}
 
//keys  
 
void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN ) downPressed = true;
  if (keyCode == LEFT ) leftPressed = true;
  if (keyCode == RIGHT ) rightPressed = true;
  if (key == 'r' ) rPressed = true;
}
 
void keyReleased()
{
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN ) downPressed = false;
  if (keyCode == LEFT ) leftPressed = false;
  if (keyCode == RIGHT ) rightPressed = false;
  if (key == 'r' ) rPressed = false;
}

