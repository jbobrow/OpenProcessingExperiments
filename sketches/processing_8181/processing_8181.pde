
//circles
//for enemy circle
float x = 650.0;
float y = 120.0;
float radius = 40.0;
//white circle
float whiteX = 400;
float whiteY = 240;
float whiteRadius = 25.0;

//speed and direction
float speedX = 3.0;
float speedY = 1.0;
int directionX;
int directionY;

//rectangles (a.k.a. lines)
//rect 1
float rect1X = 100.0;
float rect1Y = 250.0;
float rect1Width = 150.0;
float rect1Height = 20.0;
float rect1XSpeed = 4.0;
float rect1YSpeed = 2.0;
float rect1XDirection;
float rect1YDirection;
//rect 2
float rect2X = 650.0;
float rect2Y = 260.0;
float rect2Width = 40.0;
float rect2Height = 150.0;
float rect2XSpeed = 3.0;
float rect2YSpeed = 1.5;
float rect2XDirection;
float rect2YDirection;


int gameMode = 0; 
/* gameMode:
0 - initial reset
1 - playing
2 - lost
*/

//timer
float time = 0.0;
//score keeper
int score = 0;
//angle - for sin and cos functions
float angle = 0.0;
//type - display score, etc.
PFont font;
PFont bigFont;

void setup()
{
  size(800,480);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  rectMode(CORNER);
  font = loadFont("Consolas-18.vlw");
  bigFont = loadFont("Consolas-48.vlw");

}

void draw()
{
  background(0);
  float s = sin(angle);
  float c = cos(angle);
  

  //Objects to dodge
  fill(190,33,33);
  ellipse(x,y, radius, radius);
  rect(rect1X, rect1Y, rect1Width, rect1Height);
  rect(rect2X, rect2Y, rect2Width, rect2Height);
  angle += 0.1;
  
  
  //Game intro
  if(gameMode == 0)
  {
    reset();
  }
  
  
  //Gameplay
  else if(gameMode == 1)
  {
    
    time = time + 1;
    score = score + 25;
    //println(time);
    //println(score);
    
    
    //reset color
    fill(190,33,33);
    
    //ellipse motion
    x += speedX * directionX;
    if((x > width-radius) || (x < radius))
    {
      directionX = -directionX;
    }
     y += speedY * directionY;
    if((y > height-radius) || (y < radius))
    {
      directionY = -directionY;
    }
    whiteX = mouseX;
    whiteY = mouseY;
    
      //pulsing
      radius = radius + s;
       
    //rect 1 motion
    rect1X += rect1XSpeed * rect1XDirection;
    if((rect1X < 0) || (rect1X + rect1Width > width))
    {
      rect1XDirection = -rect1XDirection;
    }
    rect1Y += rect1YSpeed * rect1YDirection;
    if((rect1Y < 0) || (rect1Y + rect1Height > height))
    {
      rect1YDirection = -rect1YDirection;
    }
      //pulsing
      rect1Width = rect1Width + s;
      rect1Height = rect1Height + c;
      
  
    
    //rect 2 motion
    rect2X += rect2XSpeed * rect2XDirection;
    if((rect2X < 0) || (rect2X + rect2Width > width))
    {
      rect2XDirection = -rect2XDirection;
    }
    rect2Y += rect2YSpeed * rect2YDirection;
    if((rect2Y < 0) || (rect2Y + rect2Height > height))
    {
      rect2YDirection = -rect2YDirection;
    }
      //pulsing
      rect2Width = rect2Width + c;
      rect2Height = rect2Height + s;
    
    
     //Speed Increments
     //Counter to increase size of player sphere
     whiteRadius = 25 + time/300;
     //Counter to increase speed of enemy sphere.
     speedX = 3.0 + time/300;
     //rect 1 speed increase
     rect1XSpeed = 4.0 + time/800;
     rect1YSpeed = 2.0 + time/800;
     //rect 2 speed increase
     rect2XSpeed = 3.0 + time/500;
     rect2YSpeed = 1.5 + time/500;
  } 
 
 
  //Game end
  else if (gameMode == 2)
  {
    //reset color
    fill(190,33,33);
  }
  
  
  //Collision Detection
  //Detects circle-circle collision
  if (circleCircleIntersect(x,y, radius, whiteX, whiteY, whiteRadius) == true) 
  { 
    gameMode = 2; 
  }
  //Detects rect-circle collison
  else if (rectCircleIntersect(rect1X, rect1Y, rect1Width, rect1Height, whiteX, whiteY, whiteRadius) == true)
  {
    gameMode = 2;
  }
  else if (rectCircleIntersect(rect2X, rect2Y, rect2Width, rect2Height, whiteX, whiteY, whiteRadius) == true)
  {
     gameMode = 2;
  } else {
    fill(255);
  }
  ellipse(whiteX,whiteY, whiteRadius,whiteRadius);
  
  
  
  //Text display
  if(gameMode == 0)
  {
    fill(255);
    textFont(font,18);
    text("Click the white circle to begin.", 20,20);
  }
  else if(gameMode == 1)
  { 
    if(gameMode == 1)//constantly shows score increase in gameplay
    {
      fill(255);
      textFont(font,18);
      text("Score:" + score, 20,470);
    }
    if((gameMode == 1) && (time < 150.0))//makes text disappear
    {
      fill(255);//set font color to white
      textFont(font, 18);
      text("Dodge the objects!", 20,20); 
    }
  }
  else if(gameMode == 2)
  {
    fill(255);//set font color
    textFont(bigFont, 48);
    text("Game Over!", 280,230);
    textFont(font, 18);
    fill(247,255,26);
    text("Score:" + score, 20,470);
    fill(255);
    text("Click to restart", 20, 20); 
  }
  
}


//Mouse click commands
void mousePressed()
{
  if(gameMode == 0)
  {
    gameMode = 1;
  }
//  else if(gameMode == 1)
//  {
//    gameMode = 2;
//  }
  else if(gameMode == 2)
  {
    gameMode = 0;
  }
}


//Collision detection bools by REAS
//circleCircleIntersect example by REAS
boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) { 
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) { 
    return true; 
  } else { 
    return false; 
  } 
} 
//rectCircleIntersect example by REAS
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) 
{ 
 
  float circleDistanceX = abs(cx - rx - rw/2); 
  float circleDistanceY = abs(cy - ry - rh/2); 
 
  if (circleDistanceX > (rw/2 + cr)) { return false; } 
  if (circleDistanceY > (rh/2 + cr)) { return false; } 
  if (circleDistanceX <= rw/2) { return true; }  
  if (circleDistanceY <= rh/2) { return true; } 
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
  return cornerDistance <= pow(cr, 2); 
}



//reset function, restarts game. 
void reset()
{
  //circles
  x = 650.0;
  y = 120.0;
  radius = 40.0;

  whiteX = 400;
  whiteY = 240;
  whiteRadius = 25.0;
 
  speedX = 3.0;
  speedY = 1.0;
  //randomize direction
  float rx = random(0, 1.0);
  if (rx < 0.5) {
     directionX = 1;
  } else {
    directionX = -1;
  }
  float ry = random(0, 1.0);
  if (ry < 0.5) {
     directionY = 1;
  } else {
    directionY = -1;
  }
  
  //rectangle 1
  rect1X = 100.0;
  rect1Y = 250.0;
  rect1Width = 150.0;
  rect1Height = 20.0;
  rect1XSpeed = 4.0;
  rect1YSpeed = 2.0;
  //randomize direction  -------------  WORKING.
  //x direction
  float r1x = random(0, 1.0);
  if (r1x < 0.5) {
     rect1XDirection = 1;
  } else {
    rect1XDirection = -1;
  }
  //y direction
  float r1y = random(0, 1.0);
  if (r1y < 0.5) {
     rect1YDirection = 1;
  } else {
    rect1YDirection = -1;
  }

  //rectangle 2
  rect2X = 650.0;
  rect2Y = 260.0;
  rect2Width = 40.0;
  rect2Height = 150.0;
  rect2XSpeed = 3.0;
  rect2YSpeed = 1.5;
  //randomize direction
  //x direction
  float r2x = random(0, 1.0);
  if (r2x < 0.5) {
     rect2XDirection = -1;
  } else {
    rect2XDirection = 1;
  }
  //y direction
  float r2y = random(0, 1.0);
  if (r2y < 0.5) {
     rect2YDirection = 1;
  } else {
    rect2YDirection = -1;
  }
  
  time = 0.0;
  score = 0;
} 

  

