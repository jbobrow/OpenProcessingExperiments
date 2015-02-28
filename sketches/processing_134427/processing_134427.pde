
//Coded by Mia Rosado; Sprite images by user Rynen10K from TIG assemblee page
/* @pjs preload="hotdog.gif, popcorn.gif, soda.gif"; */

PImage hotdog;
PImage soda;
PImage popcorn;
PImage curtain; 
PImage opencurtain;

boolean GAME_MENU = true; 

float timer = 10;
float squaretimer = 0;
float squarex = 0;
float squarey = 0;
float squaresize = 75;

int gamestate = 0;
int PLAY_STATE = 0; 
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 1;


PImage[] food = new PImage[3];

void setup ()
{
  size(500,500);
  background(0); 
  frameRate(25);
  rectMode(CENTER); 

  food[0] = loadImage("hotdog.gif");
  food[1] = loadImage("soda.gif"); 
  food[2] = loadImage("popcorn.gif"); 
  curtain = loadImage("Red-Closed-Curtains-Movie-Theatre.jpg");
  opencurtain = loadImage("movie_theatre.jpg");
    
}

void draw()
{ 
  if (GAME_MENU == true)
  {
      pushMatrix();
      background(8,12,80);
      image(curtain,0,0,500,500);
fill(122,2,170);
textSize(55);
text("Odd One Out",80,100); 
      popMatrix();
      
      pushMatrix();
      fill(255);
      textSize(12);
      text("Click the one that's different to win!",150,150);
      popMatrix();

image(food[0], 120,250);
image(food[1], 220, 250);
image(food[2], 300, 250);
  pushMatrix();
  fill(255);
  textSize(30); 
  text("Press SPACE to start!",100,400);
  popMatrix();

  }
  
  if (GAME_MENU == false)
  {   
    gamestate = PLAY_STATE;
    
    background(31,32,88);
    image(opencurtain, 0,0,500,500);
    fill(255); 
    //hotdog
    for (int y = 20; y < 350; y += random(2,10))
    {for (int x = -20; x < 200; x += 30)
    {
    
    image(food[0],x+= random(0, 800),y);
  }
    }
    
    timer = timer - (1.0 / 30.0);
    squaretimer = squaretimer + (1.0 / 30.0);
     
    if (squaretimer < .75)
    {
      if (squarex < width - squaresize)
      {
        squarex = squarex + (5 * squaretimer);
      }
      if (squarey > 0)
      {
        squarey = squarey - 2;
      }
    }
    else
    {
      if (squarex > 0)
      {
        squarex = squarex ;
      }
      if (squarey < height - squaresize)
      {
        squarey = squarey + (5 * squaretimer);
      }
    }
     
    // randomly change square position every 1.5 seconds
    if (squaretimer > 1.5)
    {
      squaretimer = 0;
      squarex = random(width - squaresize);
      squarey = random(0, height - squaresize);
    }
     
  
    if (food[1].width > 0)
    {
      image(food[1], squarex, squarey, squaresize, squaresize);
    }
     
    fill(250);
    text("TIME: " + (int)timer, 0, 500);
    
      if (clickcount <= 0)
      {
        gamestate = WIN_STATE;
      }
      if (timer < 0)
    {
        gamestate = LOSE_STATE;
      }
  if (gamestate == LOSE_STATE)
  {
      background(255, 0, 0);
      textAlign(CENTER);
      text("GAME OVER!", 250, 300, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      background(0, 255, 0);
      textAlign(CENTER);
      text("YOU WON!", 250, 300, width, 100);

  }

}
}
    
   void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > squarex
      && mouseY > squarey
      && mouseX < (squarex + squaresize)
      && mouseY < (squarey + squaresize))
    {
      clickcount = clickcount - 1;
      squaresize = squaresize * 0.95;
    }
  }
}

  
  void keyReleased()
{

  if(keyCode == ' ')
  {
    GAME_MENU = false;
  }
  
}
  
 


