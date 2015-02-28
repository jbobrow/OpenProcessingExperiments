
PImage backgroundimage;
PImage bee;
PImage rainbow;
PImage butterfly;
PImage butterfly2;

//int backgroundIndex = 0;//testingthis

float timer = 12; 
float squaretimer = 0; 
float squarex = 0; 
float squarex2 = 0; 
float squarex3 = 0;
float squarey = 0;
float squarey2 = 0;
float squarey3 = 0;
float squaresize = 100; 
float squaresize2 = 100;
float squaresize3 = 100;
//float butterflysize = 50;
//float butterfly2size = 50;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 10;




void setup ()
{
  size (600, 500);
  backgroundimage = loadImage("flowerfield.jpeg");
  bee = requestImage ("bumblebee.png");
  rainbow = loadImage("rainbow.png");
  butterfly = requestImage ("butterfly.png");
  butterfly2 = requestImage ("butterfly2.png");
  textSize(20);
  frameRate (30);
}



void draw ()
{
  image(backgroundimage, 0, 0, width, height);
  
 // if (timer > 3)//lag
 //{//lag
 // backgroundIndex = backgroundIndex + 1;//lag
 // timer = 0;//lag
 //}//lag
  
  if (gamestate == PLAY_STATE)
  {
  timer = timer - (1.0 / 30.0);//framerate
  squaretimer = squaretimer + (1.0 / 30.0);
  
  if (squaretimer < 1)//
    {
        if (squarex < width - squaresize)
        {
          squarex = squarex + (2 * squaretimer);//
        }
        if (squarey > 0)
        {
          squarey = squarey - 6;//
        }
        if (squarex2 < width - squaresize)
        {
          squarex2 = squarex2 + (2 * squaretimer);
        }
        if (squarey2 > 0)
        {
          squarey2 = squarey2 - 6;
        }
        if (squarex3 < width - squaresize)
        {
          squarex3 = squarex3 + (2 * squaretimer);
        }
        if (squarey3 > 0)
        {
          squarey3 = squarey3 - 6;
        }
      }
  }
    else
    {
      if (squarex > 0)
      {
        squarex = squarex - 2;
      }
      if (squarey < height - squaresize)
      {
        squarey = squarey + (2 * squaretimer);
      }
    }
    
    if (squaretimer > 3)
    {
      squaretimer = 0;
      squarex = random(width - squaresize);
      squarey = random (0, height - squaresize);
      squarex2 = random(width - squaresize2);//
      squarey2 = random(0, height - squaresize2);//
      squarex3 = random(width - squaresize3);//
      squarey3 = random(0, height - squaresize3);//
    }
    
    if (squaretimer > 10)
    {
       squarex2 = random(width - squaresize2);// 
       squarey2 = random(0, height - squaresize2);//
       squarex3 = random(width - squaresize3);// 
       squarey3 = random(0, height - squaresize3);//
    }
    
    if (bee.width > 0)
    {
      image (bee, squarex, squarey, squaresize, squaresize);
    }
    
    if (butterfly.width > 0)
    {
      image (butterfly, squarex2, squarey2, squaresize2, squaresize2);
    }
    if (butterfly2.width > 0)
   {
      image (butterfly2, squarex3, squarey3, squaresize3, squaresize3);
   }
    
   
   
   
    fill (0);
    text("seconds left: " + (int)timer, 15, 25);
    text("clicks left: " + clickcount, 15, 50);
   
    if (timer < 0)
    {
      if (clickcount <= 0)
      {
        gamestate = WIN_STATE;
      }
      else
      {
        gamestate = LOSE_STATE;
      }
    } 
  //}//end of PLAY_STATE
 
  if (gamestate == LOSE_STATE)
  {
    tint (255, 0, 0);
    fill (255);
    textAlign (CENTER);
    text ("the bee escaped, and is coming to get you", 0, 250, width, height);
  }
  
  if (gamestate == WIN_STATE)
  {
    image (rainbow, 0, 0, width, height);
    textSize (25);
    textAlign (CENTER);
    fill(255);
    text ("congratulations! you scared the bee away!", 0, 250, width, height);
  } 
}


void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > squarex
    && mouseY > squarey
    && mouseX < (squarex + squaresize)
    && mouseY < (squarey + squaresize)
    )
    {
      clickcount = clickcount - 1;//how the counter docks clicks
      squaresize = squaresize * 0.98;//how much smaller the bee gets
    }
  }
}


