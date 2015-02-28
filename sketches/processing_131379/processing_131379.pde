
/* 
Helena Neves
Advanced Programming
Spring 2014

Object Oriented Review
Class
*/

Bot[] bots; //make an array of type Bot called bots

void setup()
{
  size(800,400);
  bots = new Bot[20]; //make 20 flies
  for (int i=0; i < bots.length; i++)
  {
    bots[i] = new Bot(i*10,200,i);
  }
}

void draw()
{

  int timer = millis()/1000;

  background(255);
  
  textSize(32);
  fill(0);
  text(timer, 10, 30);
  
  PImage sweet;
  sweet = loadImage("sweet.jpg");
  image(sweet, 500, 0);
  
  for (int i=0; i < bots.length; i++)
  {
    bots[i].move();
    bots[i].collision(mouseX, mouseY);
    bots[i].display();
    //bots[i].setSpeed(0);
    //print(bots[i].xPos); //pulls out xPos
    //print(bots[i].yPos); //pulls out yPos
  }
  
  PImage swatter;
  swatter = loadImage("swatter.png");
  image(swatter, mouseX, mouseY);
 
}

class Bot
{
   //define class
   float xPos, yPos;
   float speed;
   int id;
   
   //constructor
   Bot(float _xPos, float _yPos, int _id) 
   {
     xPos = _xPos;
     yPos = _yPos;
     id = _id;
     speed = 0;
   }
  //methods
  void move()
  {
    xPos+=random(-speed,speed);
    yPos+=random(-speed,speed);
    speed += .1;
  }
  void display()
  {
    PImage fly;
    fly = loadImage("fly.png");
    image(fly, xPos, yPos);
  }
  
  //encapulation
  //getter and setters
  float getX()
  {
    return xPos;
  }
  float getY()
  {
    return yPos;
  }
  void setSpeed(float s)
  {
    speed = s;
  }
  
  void collision(float xOver, float yOver)
  {
     if (xOver > xPos && xOver < xPos+32 && yOver > yPos && yOver < yPos+32)
     {
       setSpeed(0);
     }
  }
  
}

