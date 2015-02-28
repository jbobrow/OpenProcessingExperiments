
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
int directionX = 1;
int directionY = -1;

//rectangles (a.k.a. lines)
//rect 1
float rect1X = 100.0;
float rect1Y = 250.0;
float rect1Width = 150.0;
float rect1Height = 20.0;
float rect1XSpeed = 4.0;
float rect1YSpeed = 2.0;
float rect1XDirection = 1;
float rect1YDirection = -1;
//rect 2
float rect2X = 650.0;
float rect2Y = 260.0;
float rect2Width = 40.0;
float rect2Height = 150.0;
float rect2XSpeed = 3.0;
float rect2YSpeed = 1.5;
float rect2XDirection = -1;
float rect2YDirection = 1;


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
//type - display score, etc.
PFont font;

void setup()
{
  size(800,480);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  rectMode(CORNER);
  font = loadFont("Consolas-18.vlw");
  //randomize direction  ------------- NOT WORKING.
//  float r = random(0, 1.0);
//  if (r < 0.5) {
//     lineX1Direction = 1;
//  } else {
//    lineX1Direction = -1;
//  }
//  println(lineX1Direction);
}

void draw()
{
  background(0);

  //Objects to dodge
  fill(190,33,33);
  ellipse(x,y, radius,radius);
  stroke(190,33,33);
  //strokeWeight(10);
  strokeCap(SQUARE);
  //line(lineX1, lineY1, lineX1 + line1Length, lineY1); //line 1
  strokeWeight(30);
  //line(lineX2, lineY2, lineX2 + line2Length, lineY2); //line 2
  noStroke();
  rect(rect1X, rect1Y, rect1Width, rect1Height);
  rect(rect2X, rect2Y, rect2Width, rect2Height);
  
  
  //Game intro
  if(gameMode == 0)
  {
    fill(255);
    textFont(font,18);
    text("Click the white circle to begin.", 20,20);
    reset();
  }
  
  
  //Gameplay
  else if(gameMode == 1)
  {
    
    time = time + 1;
    score = score + 25;
    //println(time);
    //println(score);
    
    fill(255);//set font color to white
    textFont(font, 18);
    text("Dodge the objects!", 20,20);
    
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
    
     ///////////////Speed and Size Increments/////////////////
     //Counter to increase size of player sphere
     whiteRadius = 25 + time/300;
     //Counter to increase speed of enemy sphere.
     speedX = 3.0 + time/200;
     //rect 1 speed increase
     rect1XSpeed = 4.0 + time/500;
     rect1YSpeed = 2.0 + time/500;
     //rect 2 speed increase
     rect2XSpeed = 3.0 + time/300;
     rect2YSpeed = 1.5 + time/300;
  } 
 
  //Game end
  else if (gameMode == 2)
  {
    fill(255);//set font color
    textFont(font, 18);
    text("Game Over!", 20,20);
    text("Score:" + score, 20,40);
    text("Click to restart", 620, 470);
    //reset color
    fill(190,33,33);
  }
  
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
}



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
  directionX = 1;
  directionY = -1;
  
  rect1X = 100.0;
  rect1Y = 250.0;
  rect1Width = 150.0;
  rect1Height = 20.0;
  rect1XSpeed = 4.0;
  rect1YSpeed = 2.0;
  rect1XDirection = 1;
  rect1YDirection = -1;
  
  rect2X = 650.0;
  rect2Y = 260.0;
  rect2Width = 40.0;
  rect2Height = 150.0;
  rect2XSpeed = 3.0;
  rect2YSpeed = 1.5;
  rect2XDirection = 1;
  rect2YDirection = -1;
  
  time = 0.0;
  score = 0;
} 

  

