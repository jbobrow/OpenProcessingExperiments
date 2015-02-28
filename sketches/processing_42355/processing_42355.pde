
//moving balls
int numBalls = 200;
int numSnow = 400;
int numSnow2 =600;
Ball[] myBalls = new Ball[numBalls];
Ball[] snow = new Ball[numSnow];
Ball[] snow2 = new Ball[numSnow2];
Ball[] snow3 = new Ball[numSnow2];
Ball[] snow4 = new Ball[600];
//Ball myBall;
//Ball myBall2;


void setup()
//size first!
{  
  size(500, 500);
  smooth();
  noStroke();
  
  //population
  for(int i = 0; i < numBalls; i++)
  {
    myBalls[i] = new Ball();
    myBalls[i].myDiameter = 15;
    myBalls[i].x = random(0,width);
    myBalls[i].y = random(0, height);
    myBalls[i].speedY = random(0, 3);
    myBalls[i].a = 255;
 }
 for(int i = 0; i < numSnow; i++)
    {
      snow[i] = new Ball();  
     snow[i].x = random(0, width);
     snow[i].y = random(0,height);
     snow[i].myDiameter = 12;
     snow[i].speedY = random(0, 2);
     snow[i].a = 150;
    }
 
 for(int i = 0; i < numSnow2; i++)
    {
      snow2[i] = new Ball();  
     snow2[i].x = random(0, width);
     snow2[i].y = random(0,height);
     snow2[i].myDiameter = 9;
     snow2[i].speedY = random(0, 1);
     snow2[i].a = 100;

    }
   for(int i = 0; i < numSnow2; i++)
    {
      snow3[i] = new Ball();  
     snow3[i].x = random(0, width);
     snow3[i].y = random(0,height);
     snow3[i].myDiameter = 6;
     snow3[i].speedY = random(0, .5);
     snow3[i].a = 75;

    }
     for(int i = 0; i < 600; i++)
    {
      snow4[i] = new Ball();  
     snow4[i].x = random(0, width);
     snow4[i].y = random(0,height);
     snow4[i].myDiameter = 4;
     snow4[i].speedY = random(0, .3);
     snow4[i].a = 50;

    }
  
  
  //create a new instance
//  myBall = new Ball();
//  myBall.x = 10;
//  myBall.y = 10;
//  myBall2 = new Ball();
//  myBall2.b = 0;
//  myBall2.g = 0;
//  myBall2.speedX = .5;
//  myBall2.x = 100;
//  myBall2.y = 100;
//  myBall2.myDiameter = 25;
  
}

void draw()
{
 background(150);
   for(int i = 0; i < numBalls; i++)
   {
     myBalls[i].update();
   }
   for(int i = 0; i < numSnow; i++)
   {
     snow[i].update();
   }
   for(int i = 0; i < numSnow2; i++)
   {
     snow2[i].update();
   }
   for(int i = 0; i < numSnow2; i++)
   {
     snow3[i].update();
   }
   for(int i = 0; i < 600; i++)
   {
     snow4[i].update();
   }

 //myBalls.update();
// myBall.update();
// myBall2.update();
}


//create class

class Ball
{
  //properties
  int myDiameter = 10;
  float x        = 250;
  float y        = 0;
  float speedX = 1;
  float speedY = 3;
  int r = 255;
  int g = 255;
  int b = 255;
  int a = 0;
  
  //method
  void update()
  {  fill(r, g, b, a);
     ellipse(x,y, myDiameter, myDiameter);
     //accelerate
     //speedX +=.1;
     x+=speedX;
     y+=speedY;
     if(y>height)
     {
      y = 0;
     x= random(0, 500); 
     }
     if(x>width)
     {
     x = 0;
     }
  }
}                           
