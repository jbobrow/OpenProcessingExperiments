

float timer = 0;
int backgroundIndex = 0;
PImage [] Background = new PImage [10];
PImage girl1;
PImage girl2;
PImage girl3;
PImage girl4;
PImage girl5;
PImage girl6;
PImage girl7;
PImage Mons1;

PImage Paper;
PImage Sigh;
PImage Swish1;
PImage Swish2;
PImage Rain;

float paperSpeed = 5;
float rainSpeed = -2000;
float sighSpeed = 70;
float moveSpeed = 50;
float monsterSpeed =150;


int index;

/* @pjs preload="character1.png", "character2.png", "character3.png", "character5", "character6.png", "character7.png", "character8.png", "paper.png", "sigh.png", "swish1.png", "swish2.png", "rain.png"; */




void setup()
{
  size (600,500);
  frameRate(30);
  
  for (int i=0; i<9; i++)
  
  {
    Background[i] = requestImage( "Background" + (i+1) + ".jpg");
    
    girl1 = requestImage ("character1.png");
    girl2 = requestImage ("character2.png");
    girl3 = requestImage ("character3.png");
    girl5 = requestImage ("character4.png");
    girl6 = requestImage ("character6.png");
    girl7 = requestImage ("character7.png");
    Mons1 = requestImage ("character8.png");
  
    Paper = requestImage ("paper.png");
    Sigh  = requestImage ("sigh.png");
    Swish1 = requestImage ("swish1.png");
    Swish2 = requestImage ("swish2.png");
    Rain   = requestImage ("rain.png");
  
  }
}



void draw()
{
  background (0);
  timer += 1.0/30.0;
  
  if (timer >= 3)
  
  {
    backgroundIndex +=1;
    timer = 0;
  }
  if (backgroundIndex < 0 || backgroundIndex >= Background.length)
  
    {
      backgroundIndex = 0;
    }

image (Background [backgroundIndex], 0,0,width, height);


  
  
  
 if (backgroundIndex == 1 && girl1.width > 0 )
  {
     image(girl1, 400, 200, 200, 300);
  }
   
 


//the swish
  moveSpeed = moveSpeed + 2;
  if (backgroundIndex == 2 && Swish1.width >0)
  {
    image(Swish1, moveSpeed, 100, 400,100);
  }
  
  
  if (backgroundIndex == 2 && girl3.width > 0 )
  {
     image(girl3, 200, 200, 200, 300);
  }
  
  
  
  
    if (backgroundIndex == 3 && girl6.width > 0 )
  {
     image(girl6, 350, 100, 100, 300);
  } 
 //paper
   paperSpeed= paperSpeed + 1;
   if (backgroundIndex ==3 && Paper.width >0  )
   {
     image(Paper, paperSpeed, 400, 100,100);
   }

 
 
  monsterSpeed = monsterSpeed - .3;
  if (backgroundIndex == 4 && Mons1.width > 0 )
  {
     image(Mons1, monsterSpeed, 100, 550, 400);
  }  
  
  if (backgroundIndex == 4 && girl7.width > 0 )
  {
     image(girl7, 0, 0, 200, 600);
  } 
  
  
  // the sigh
  sighSpeed = sighSpeed - .2;
  if (backgroundIndex == 5 && Sigh.width >0)
  {
    image(Sigh,sighSpeed,280,100,100);
  }
 
  
   


if ( timer >0)
{
  rainSpeed= rainSpeed + 1;
  if (backgroundIndex == 0 || backgroundIndex <=5)
  {
    image (Rain,0,rainSpeed,600, 2500);
  }
}

}



void keyReleased()
{
  // pauses on a frame for 3 more seconds
  if (keyCode == RIGHT)
  {
    timer = 0;
  }
    
}




