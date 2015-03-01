

//These PImage variables will hold the images we load
//loading Images will be done in the setup Function
PImage bombImage;
PImage img_player;
PImage img_bullet;


//These are the starting positions for my 4 bombs

float[] xPositions = {100, 200, 300, 400, 500};
float[] yPositions = {100, 200, 300, 400, 500};

//These 2 arrays will hold the XY Velocity of each bomb
float[] xVelocity = {2.6, -4, 1.234, 6, 2};
float[] yVelocity = {-1.12, 2, 4.1, -2, 2};



//My bullets arrays will keep track of what ones are alive, their positions, and the flat speed they all move at.
boolean[] bulletsAlive = {false, false, false};
float[] bulletsXPosition ={0,0,0};
float[] bulletsYPosition = {0,0,0};
float bulletSpeed = 4.0;


//All my players variables
float playerSpeed=3.8;
float playerX = 70;
float playerY = 300;

float circPos = 10;

void setup()
{
  size(800,600);
  
  img_bullet = loadImage("bullet.png");
  img_player = loadImage ("spaceship.png");
  bombImage = loadImage("mario_bomb.jpg");
  



  
  





}


void draw()
{
  /*
  background(0);
  circPos+=5;
  
  for(int i =0; i <5; i++)
  {
    //ellipse(X, Y, width, height);
    
    
    //Remember:        X        ,   Y,    width,  height
    ellipse(  100+circPos+  (i*30), 200+circPos, 10+(i*3), 10+(i*3)  );
   
    
  }
  */
  

  background(0);
  updatePlayer();
  updateBombs();
}









//I moved my FireBullet to key released to quickly fix a bug I was having
//It works fine like this.
void keyReleased()
{
  if(key == ' ')
    {
      player_FireBullet();
    }
}




//This function is what takes care of ALL player actions and manages the players bullets
void updatePlayer()
{
  //Draw the spaceship image at the players XY position
  image(img_player,playerX,playerY);
  
  //check for movement. W goes up, S goes down
  player_Movement();
  
  
  //Update and Manages the bullets the player fires
  updateBullets();
  
}

//updates players XY position depending on what key is pressed
void player_Movement()
{
  if(keyPressed)
  {
    if(key == 'w')
    {
      playerY -=playerSpeed;
    }
    
    if(key == 's')
    {
      playerY +=playerSpeed;
    }
    
    
  }
}


//This will go through the bullet array, find the ones that are alive, and render them.
//It will also update their position by adding the bulletSpeed to their current X position
void updateBullets()
{
  for(int i =0; i < bulletsAlive.length; i++)
  {
    
    if(bulletsAlive[i] == true)
    {
      image(img_bullet, bulletsXPosition[i], bulletsYPosition[i]);
      bulletsXPosition[i]+= bulletSpeed;
      
      if(bulletsXPosition[i] > 800)
      {
        bulletsAlive[i] = false;
      }
    }
    
    
  }
}




//This function is called when the space bar is released.
//It will go through the bulletAlive array, and find one that is currently dead
//It will then set the Bullets state to alive, and give it the same XY as the players current position.
void player_FireBullet()
{
  //Cycle through the bulletsAlive array
  for(int i =0; i < bulletsAlive.length; i++)
  {
    //Find one that is currently dead
    if(bulletsAlive[i] == false)
    {
      //Turn it alive and set its position to player current position
      bulletsAlive[i]=true;
      bulletsXPosition[i] = playerX;
      bulletsYPosition[i] = playerY;
      
      
      //WE BREAK HERE!!!!
      //Break will stop it from continuing the FOR LOOP
      //So if we find a dead bullet in the first slot, we dont care to check the next ones
      //Because we already found what we wanted.
      //Checking any more will cause all bullets to spawn, not just 1 in that position
      //It is also a waste of processing power on our computer
      break;
    }
  }
}



//This function handels all movement for our Bombs
void updateBombs()
{
  //We first find out how many bombs total we have planned for existing
  //By getting the size of our array
  int NumberOfBombs = yPositions.length;
  
  //We then cycle through our bombs drawing them each at their unique XY position
  //That we defined at the top of our program
  for(int i=0; i <NumberOfBombs; i++)
   {
     
     //Each bomb gets drawn at its personal XY
     image(bombImage, xPositions[i], yPositions[i]);
     
     //And its position is then updated by its personal XY Velocity
     xPositions[i] += xVelocity[i];
     yPositions[i] += yVelocity[i];
     
     
     
     //This code checks if the bomb is outside our window
     //And if so, flips the XY velocity to make it go in the opposite direction
     if( xPositions[i] < 0 || xPositions[i] > 800)
     {
       xVelocity[i] = xVelocity[i] *-1;
     }
     
     if( yPositions[i] < 0 || yPositions[i] > 600)
     {
       yVelocity[i] = yVelocity[i] *-1;
     }
   }
}


