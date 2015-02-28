
PVector pos, vel, acc;
boolean switchedX, outX, outY, switchedY;

float rad;

void setup()
{
  size(400,400);
  frameRate(30);
  rad = 25;
  pos = new PVector( width/2, height/2);
  vel = new PVector( 0, 0);
  
}

void draw()
{
  background(50);
  acc = new PVector(-(mouseX-pos.x)*.001, -(mouseY-pos.y)*.001);
  vel.add(acc);
  
  if (vel.x > 5)
  {
   vel.x = 5; 
  }
  if (vel.x < -5)
  {
   vel.x = -5;
  }
  if (vel.y > 5)
  {
   vel.y = 5; 
  }
  if (vel.y < -5)
  {
   vel.y = -5; 
  }
  
  
  pos.add(vel);
  fill(240);
  strokeWeight(3);
  stroke(150);
  
//// tolerant border collison detection iteration 5
//
//  if(pos.x <= 0 + rad || pos.x >= width - rad)
//  {
//    outX = true;
//  }
//  
//  else
//  {
//    outX = false;
//    switchedX = false;
//  }
//  
//  if(pos.y <= 0 + rad || pos.y >= height - rad)
//  {
//    outY = true;
//  }
//  
//  else
//  {
//    outY = false;
//    switchedY = false;
//  }
//  
//  if (!switchedX && outX)
//  {
//    vel.x = -vel.x;
//    switchedX = true;
//  }
//  
//  if (!switchedY && outY)
//  {
//    vel.y = -vel.y;
//    switchedY = true;
//  }


// wrapping detection iteration 1

  if(pos.x < 0)
  {
    pos.x = width;
  }
  
  if(pos.x > width)
  {
    pos.x = 0;
  }
  
  if(pos.y < 0)
  {
    pos.y = height;
  }
  
  if(pos.y > height)
  {
    pos.y = 0;
  }
  
  
  //circle
  
  ellipse(pos.x,pos.y, rad*2, rad*2);
  
}


