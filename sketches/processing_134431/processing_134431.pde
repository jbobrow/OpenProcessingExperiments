
float timer = 10; 
float squaretimer = 0; 
float squarex = 0; 
float squarey = 0; 
float squaresize = 100; 
int gamestate = 0; 
int PLAY_STATE = 0; 
int WIN_STATE = 1; 
int LOSE_STATE = 2; 
int clickcount = 10; 
PImage forest;

class Asteroid 
{ 
  float x = random(10, width - 10); 
  float y = -20; 
  float radius = 20; 
  float speed = random(3,7); 
} 

class Ship 
{ 
  float x = 250; 
  float y = 400; 
  float w = 50; 
  float h = 25; 
  float speed = 5; 
} 

boolean isLeftDown = false; 
boolean isRightDown = false; 

Asteroid[] asteroids = new Asteroid[25]; 
Ship player = new Ship(); 

void setup() 
{ 
  forest = requestImage("Forest.jpg");
  size(500, 500); 
  textSize(50); 
  frameRate(30); 
  
  
  for (int i = 0; i < asteroids.length; i += 1) 
  { 
    asteroids[i] = new Asteroid(); 
  } 
} 

void draw() 
{ 
  image(forest, 0, 0, width, height);
  
  
  if (gamestate == PLAY_STATE) 
  { 
     
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
        squarex = squarex - 2; 
      } 
      if (squarey < height - squaresize) 
      { 
        squarey = squarey + (5 * squaretimer); 
      } 
    } 

    if (squaretimer > 1.5) 
    { 
      squaretimer = 0; 
      squarex = random(width - squaresize); 
      squarey = random(0, height - squaresize); 
    } 

    fill(random(255), random(255), random(255));
    rect(squarex, squarey, squaresize, squaresize); 
 
    fill(0); 
    text("TIME: " + (int)timer, 200, 200); 
    text("CLICKS: " + clickcount, 200, 400); 

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
   
    rect(player.x, player.y, player.w, player.h); 
  
    for (int i = 0; i < asteroids.length; i += 1) 
    { 
      asteroids[i].y += asteroids[i].speed; 
  
      if (rectRectIntersect( 
        player.x,  
        player.y,  
        player.x + player.w,  
        player.y + player.h, 
        asteroids[i].x,  
        asteroids[i].y,  
        asteroids[i].x + asteroids[i].radius,  
        asteroids[i].y + asteroids[i].radius)) 
      { 
        asteroids[i].x = -1000; 
        gamestate = LOSE_STATE;
      } 
     
      if (asteroids[i].y > 510)
      {
        asteroids[i].y = -20;
        asteroids[i].x = random(10, width - 10); 
      }
  
      ellipseMode(CORNER);                   
      ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius); 
    }  
  } 
  
  if (gamestate == LOSE_STATE) 
  { 
      background(255, 0, 0); 
      textAlign(CENTER); 
      text("Defeat", 0, 0, width, 100); 
  } 

  if (gamestate == WIN_STATE) 
  { 
      background(0, 255, 0); 
      textAlign(CENTER); 
      text("Victory", 0, 0, width, 100); 
  } 
  
  if (isRightDown == true) 
  { 
    player.x += player.speed; 
  } 


  if (isLeftDown == true) 


  { 


    player.x -= player.speed; 


  } 





} 


  


void keyPressed() 


{ 


  if (key == CODED) 


  { 


    if (keyCode == LEFT) 


    { 


      isLeftDown = true; 


    } 


    if (keyCode == RIGHT) 


    { 


      isRightDown = true; 


    } 


  } 


} 


  


void keyReleased() 


{ 


  if (key == CODED) 


  { 


    if (keyCode == LEFT) 


    { 


      isLeftDown = false; 


    } 


    if (keyCode == RIGHT) 


    { 


      isRightDown = false; 


    } 


  } 


} 


  


boolean rectRectIntersect(float left, float top, float right, float bottom, 


                          float otherLeft, float otherTop, float otherRight, float otherBottom) { 


  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop); 

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



