
 
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
 
 
 
 
 
 
  

