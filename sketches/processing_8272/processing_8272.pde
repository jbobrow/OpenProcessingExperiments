
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
//angles - for sin functions
float circleAngle = 0.0;
float rect1Angle = 0.0;
float rect2Angle = 0.0;

//fade to black - game end transparancy
float trans = 0.0;
float transSpeed = 3.0;
float transDirection = 1.0;
//"Dodge the Objects!" text fade alpha value
float fade = 255.0;
//typography - display score, etc.
PFont font;
PFont bigFont;

void setup()
{
  size(800,480);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  rectMode(CORNER);
  font = loadFont("AndaleMono-48.vlw");
  bigFont = loadFont("AndaleMono-48.vlw");

}

void draw()
{
  background(0);
  //float s = sin(angle);
  //float c = cos(angle);
  

  //Objects to dodge
  fill(190,33,33);
  ellipse(x,y, radius, radius);
  rect(rect1X, rect1Y, rect1Width, rect1Height);
  rect(rect2X, rect2Y, rect2Width, rect2Height);
  
  
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
    if(x > width-radius)
    {
      x = width-radius;
      directionX = -directionX;
    }
    if(x < radius)
    {
      x = radius;
      directionX = -directionX;
    }
    
    y += speedY * directionY;
    if(y > height-radius)
    {
      y = height-radius;
      directionY = -directionY;
    }
    if(y < radius)
    {
      y = radius;
      directionY = -directionY;
    }
    whiteX = mouseX;
    whiteY = mouseY;
    
      if(score > 10000.0)
      {  
        //pulsing
        float s = sin(circleAngle);
        radius = map(s, -1,1, 30, 50);
        circleAngle += 0.1;
      }
      
    //rect 1 motion
    rect1X += rect1XSpeed * rect1XDirection;
    if(rect1X < 0)
    {
      rect1X = 0;
      rect1XDirection = -rect1XDirection;
    }
    if(rect1X + rect1Width > width)
    {
      rect1X = width - rect1Width;
      rect1XDirection = -rect1XDirection;
    }
    
    rect1Y += rect1YSpeed * rect1YDirection;
    if(rect1Y < 0)
    {
      rect1Y = 0;
      rect1YDirection = -rect1YDirection;
    }
    if(rect1Y + rect1Height > height)
    {
      rect1Y = height - rect1Height;
      rect1YDirection = -rect1YDirection;
    }
    
      if(score > 20000.0)
      {
        //pulsing
        float s = sin(rect1Angle);
        rect1Width = map(s, -1,1, 140, 160);
        rect1Height = map(s, -1,1, 15, 25);
        rect1Angle += 0.1;
        println(s);
      }
      
  
    
    //rect 2 motion
    rect2X += rect2XSpeed * rect2XDirection;
    if(rect2X < 0)
    {
      rect2X = 0;
      rect2XDirection = -rect2XDirection;
    }
    if(rect2X + rect2Width > width)
    {
      rect2X = width - rect2Width;
      rect2XDirection = -rect2XDirection;
    }
    rect2Y += rect2YSpeed * rect2YDirection;
    if(rect2Y < 0)
    {
      rect2Y = 0;
      rect2YDirection = -rect2YDirection;
    }
    if(rect2Y + rect2Height > height)
    {
      rect2Y = height - rect2Height;
      rect2YDirection = -rect2YDirection;
    }
      if(score > 30000.0)
      {
        //pulsing
        float s = sin(rect2Angle);
        rect2Width = map(s, -1,1, 30, 50);
        rect2Height = map(s, -1,1, 140, 160);
        rect2Angle += 0.1;
      }
    
    
     //Speed Increments
     //Counter to increase size of player sphere
     whiteRadius = 25 + time/500;
     //Counter to increase speed of enemy sphere.
     speedX = 3.0 + time/500;
     //rect 1 speed increase
     rect1XSpeed = 4.0 + time/1100;
     rect1YSpeed = 2.0 + time/1100;
     //rect 2 speed increase
     rect2XSpeed = 3.0 + time/800;
     rect2YSpeed = 1.5 + time/800;
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
    text("Click the white circle to begin.", 20,35);
  }
  else if(gameMode == 1)
  { 
      fill(255);
      textFont(font,18);
      text("Score:" + score, 20,460);
      fill(255, fade);//set font color to white, fade away
      textFont(font, 18);
      text("Dodge the objects!", 20,35); 
      fade--;
  }
  else if(gameMode == 2)
  {
    fill(255);//set font color
    textFont(bigFont, 48);
    text("Game Over!", 258,250);
    textFont(font, 18);
    fill(247,255,26);
    text("Score:" + score, 20,460);
    fill(255);
    text("Click to restart", 20, 35); 
    
    //fade to black at end
    fill(0, trans);
    rect(0,0, width, height);
    trans += transSpeed * transDirection;
    if(trans > 255 || trans < 0)
    {
      transDirection = -transDirection;
    }
    //println(transDirection);
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
  trans = 0.0;
  transSpeed = 3.0;
  transDirection = 1.0;
  fade = 255.0;
} 

  

