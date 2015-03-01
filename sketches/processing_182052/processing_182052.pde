
ArrayList<Square> squares = new ArrayList<Square>(); // array list for squares
Player p; // adds player
PImage gameover; // game over image
PImage player;

void setup()
{
  // sets up the background and makes the x,y of any images the center of the image
  size(500,500); // size of the screen
  background (255); // background is white
  
  p = new Player(); // adds a new class (player) to the background
  
  int xpos; //sets the xpos of the squares
  xpos = 0; // xpos of the first square is 0
    for (int i = 0; i < 9; i++)
    {
      xpos = xpos + 50; //adds 50 pixels to the xpos of the square and adds a new square at the new x,y coordinates
      squares.add(new Square(xpos,0,25,random(1,5)));
      println(xpos); // prints the xpos of the squares
    }
  player = loadImage("stickman_2.png"); // loads the player image
  gameover = loadImage("GameOver.png"); // loads the game over image
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void draw()
{
  background(255); //gets rid of all of the old squares when a new frame is produced
  
  p.rectangle();// creates the player
  
  for (int i = 0; i < 9; i++)
  {
    Square s = squares.get(i); // goes through all of the squares in the array
    s.DrawSquare(); // draws the squares
  }
  
  p.movement(); // calls method for movement
}
 
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------- PLAYER CLASS -----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

class Player
{
  // variables for the class
  float xpos;
  float ypos;
  int size;
  color c;
  int cp;
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//  
  
  Player() // constructor
  {
    xpos = 250;
    ypos = 375;
    size = 50;
    
    c = color(255); // color of player
    rectMode(CENTER); // makes the x,y of the player the center of the image/shape
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//  
  
  void rectangle() // creates the players shape
  {
    stroke(c);
    fill(c);
    imageMode(CENTER);
    image(player,xpos,ypos,size,size); // shape is a rectangle (x,y,size,size)
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//  
  
  void movement() // left and right movement of the player
  {
    if (keyPressed)
    {
      if (keyCode == LEFT)
      {
        xpos -= 3; // moves player 3 pixels left per frame if left arrow is pressed
      }
      if (keyCode == RIGHT)
      {
        xpos += 3; // moves player 3 pixels right if right arrow is pressed
      }
    }
      for (int i = 0; i < 9; i++)
    {
      Square s = squares.get(i);
      s.motionStop(c); //stops the motion of the square
    }
    if(xpos <= 25) // keeps player on the screen
    {
      xpos = 25;
    }
    if (xpos >= width - 25)
    {
      xpos = width - 25;
    }
    
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
    
    void collision(float x, float y)
    {
      float distance = dist(x,y,xpos,ypos);
      if (distance <= 35)
      {
        c = 0; // makes the color of the player black so it can not be seen
        cp = 0;
      }
     }
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- FALLING SQUARES -------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

class Square
{
  // variables for the class
  float xpos;
  float ypos;
  float size;
  float yvel;
  color c;
  color cs = color(0);

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

  Square(float x, float y, float s, float yv) // constructer of falling squares
  {
    xpos = x;
    ypos = y;
    size = s;
    yvel = yv;
    
    c = color(int(random(255)),int(random(255)),int(random(255)));
    rectMode(CENTER);
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//  
  
  void DrawSquare() // draws the square
  {
    stroke(c);
    fill(c);
    rect(xpos,ypos,size,size);
    ypos += yvel;
    if (ypos >= 500)
    {
      ypos = 0; // if the square is at the bottom of the screen it goes back to the top
    }
    p.collision(xpos,ypos); // if the square is near the player the player disapears
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------//  
  
  void motionStop(int cp)
  {
    if (cp != 0)
    {
      yvel = yvel;
    }
    
    else
    {
      yvel = 0;
      imageMode(CENTER); // makes the x,y of the images the center of the image
      image(gameover,250,250,500,500); // shows the game over image
    }
  }
}


