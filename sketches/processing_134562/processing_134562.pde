
/* @pjs preload = "tardiskey.png", "dalek1.png"; */






int x_p;
int y_p;
int Win = 1;
int playing = 0;
float xPosition = 0;
float yPosition = 0;


float easing = 15.0; //slows the dalek down before it hits the player
PImage  tkey;
PImage  tardis;
PImage daleks;
PImage doctor;
PImage background;
PImage dalekG;
PImage dalekR;
PImage tardis1;
boolean keyOver = false;
boolean doctorOver = false;



void setup()
{
  size (500,500);
  frameRate (30);
  
    

  youWin(); 

  gameStart();
}
void youWin()

{   
      tardis1 = requestImage("tardis1.jpg");
      background (0);
      image ( tardis1, 250,250, width, height);
      textAlign(CENTER);
      textSize( 25);
      text("You're so clever you've won!", width/2, height/2); 
    }



void gameStart()
{
   x_p = int (random(width));
  y_p = int (random(height));
  
  tardis1 = requestImage("tardis1.jpg");
  doctor = requestImage("miniDoctor2.png");
  tkey = requestImage ("tardisKey.png");
  daleks = requestImage("dalek1.png");
  tardis = requestImage("tardis.png");
  background = requestImage("back.png");
  dalekG = requestImage( "dalek2.png");
  dalekR = requestImage("dalek3.png");
  noCursor();
 xPosition = 0;
 yPosition = 0;}
  
void draw()
{
  background (100);
  image(background, 0, 0, width, height);
  image(tkey, 350,350, 40,40);
  
  
  x_p = mouseX;
  y_p = mouseY;
  

  
  image(doctor, x_p - doctor.width, y_p - doctor.height/2);
  
  image(dalekG, xPosition - dalekG.width/2, 400 - 30);
  
  image(dalekR, 100 - dalekR.width/2, yPosition );
  
  image(daleks, xPosition - daleks.width/2, yPosition - 20);
  
  if (abs(xPosition - x_p) > 1 || abs(yPosition - y_p) > 1)
  {
    xPosition = xPosition + (x_p - xPosition)/ easing;
    yPosition = yPosition + (y_p - yPosition)/ easing;
  }
  if ( dist( x_p - doctor.width, y_p - doctor.height/2,  xPosition - dalekG.width/2, 400 - 30 ) < 30)
  {
    gameStart();
  }
  if ( dist (x_p - doctor.width, y_p - doctor.height/2,  100 - dalekR.width/2, yPosition) < 20)
  {
    gameStart();
  }
  if ( dist( x_p - doctor.width, y_p - doctor.height/2,  xPosition - daleks.width/2, yPosition - 20) < 10)
  {
    gameStart();
  }
  
  if ( dist ( x_p - doctor.width, y_p - doctor.height/2,  350,350) < 40)
  {
    
    image( tardis, 390, 350, 40, 40);
  }
  
  if (dist(x_p-doctor.width, y_p - doctor.height/2,  390,350) < 10)
  {
    playing = Win;
  }
  
  if ( playing == Win)
  {
    youWin();
  }

 
}
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop); }


