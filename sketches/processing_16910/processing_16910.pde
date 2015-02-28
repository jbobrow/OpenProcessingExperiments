
/*Prototype
Brian Chan, Vanessa Wong, James Ye
Group Game Project
date - whenever...
 */
boolean upPressed, downPressed, leftPressed, rightPressed,rPressed;
ball[] jellyfish;
PImage character, SC1, EndSC;
PFont chiller;
int screenNumber,x,y,speed2,score, life;

void setup()
{
  frameRate(60);
  smooth();
  size(700, 700); 
  imageMode(CENTER);
  chiller = loadFont("Chiller-Regular-50.vlw");
  textFont(chiller,50);
  SC1 = loadImage("SC1.gif");
  EndSC = loadImage("EndSC.gif");
  jellyfish = new ball[10];
  for(int i = 0; i<10; i++)
  {
    jellyfish[i] = new ball();
    jellyfish[i].a = (int)random(0,650);
    jellyfish[i].b = (int)random(-250,-50);
    jellyfish[i].speed = (int)random(2,5);
  }
  x = y = width/2;
  speed2 = 15;
  screenNumber = 1;
  score = 0;
  life = 5;
}

void draw()
{
  background(0);
  if (screenNumber == 1)
  {
    
    for(int i = 0; i<jellyfish.length; i++)
    {
      jellyfish[i].show2();
    }
    
    x = y = width/2;
    image(SC1,350,350);
    text("Use Arrow Keys", 240, 600);
    if (mousePressed) screenNumber = 2;
  }

  if (screenNumber == 2)
  {
    for(int i = 0; i<jellyfish.length; i++)
    {
      jellyfish[i].show();
      jellyfish[i].checkCollisionJelly();
      jellyfish[i].charInside();
    }
      
  
    fill(250, 250, 140);
    rect(x-27,y,54,35);
    fill(250,250,140);
    ellipse(x,y, 54,44);
    fill(0);
    ellipse(x-10,y, 3,3);
    ellipse(x+10,y, 3,3);
    fill(250,250, 140);
    noStroke();

    ellipse(x-22, y+31, 10, 27);
    ellipse(x+22, y+31, 10,27);
    ellipse(x-7, y+31, 10,27);
    ellipse(x+7, y+31, 10, 27);

    if (rightPressed) x += speed2;
    if (leftPressed)  x -= speed2;
    if (upPressed)    y -= speed2;
    if (downPressed)  y += speed2;
  
    text("Score:"+score,20,30);
    text("Lives:"+life,550,30);
  }
  if (screenNumber == 3)
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
    ellipse(a,b, 50,50);
    fill(255, 255,0);
    fill(0);
    ellipse(a+9, b-4, 8, 15);
    ellipse(a-9, b-4, 8,15);
    fill(255);
    ellipse(a-9, b-6, 5,9);
    ellipse(a+9, b-6, 5,9);
    fill(161,159,247);

    if (b > 700)
    {
      b = (int)random(-250,-50);
      life = life - 1;
      if( life == 0)
      {
        life = life;
        screenNumber = 3;
      }
      a = random(700);
    }
    b += speed;
    
    if (screenNumber == 1)
    {
      b = -100;
    }
    if (screenNumber == 3)
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
    if (screenNumber == 1)
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
    screenNumber = 1; 
    }
}



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


