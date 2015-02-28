
PVector pos, vel, acc;
float rad;
boolean switchedX, outX, outY, switchedY, caps;

//boolean switched


void setup()
{
  size(400,400);
  frameRate(24);
  caps = false;
  rad = 25;
  pos = new PVector( width/2, height/2);
  vel = new PVector(5, 1);
  
  //Make sure this is in the 'draw' function so that it actually updates
  //acc = new PVector((mouseX-pos.x)*.001, (mouseY-pos.y)*.001);
}

void draw()
{
  background(150);
  acc = new PVector((mouseX-pos.x)*.001, (mouseY-pos.y)*.001);
  vel.add(acc);
  pos.add(vel);
  
  
  //classic collison detection
  
//  if(pos.y > height - rad)
//  {
//    vel.y = -vel.y;
//  }
//  
//  
//  if(pos.y < 0 + rad)
//  {
//    vel.y = -vel.y;
//  }
//  
//  
//  if(pos.x > width - rad)
//  {
//    vel.x = -vel.x;
//  }
//  
//  
//  if(pos.x < 0 + rad)
//  {
//    vel.x = -vel.x;
//  }
  
  //-----------------------------------
  
  //Attempt 2 at tolerant collision detection
  
//    if(pos.x < 0 + rad || pos.x > width - rad)
//    {
//      out = true;
//      reverseX = true;
//      out = false;
//    }
//    
//    else
//    {
//      reverseX = false;
//    }
//    
//    
//    if(pos.y < 0 + rad || pos.y > height - rad)
//    {
//      out = true;
//      reverseY = true;
//      out = false;
//    }
//    
//    else
//    {
//      reverseY = false;
//    }
//    
//    if (reverseX)
//    {
//      vel.x = -vel.x;
//    }
//    if (reverseY)
//    {
//      vel.y = -vel.y;
//    }


//------------------------------

// tolerant collison detection iteration 3

//  if(pos.x <= 0 + rad || pos.x >= width - rad)
//  {
//    outX = true;
//  }
//  
//  else
//  {
//    outX = false;
//    switched = false;
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
//    switched = false;
//  }
//  
//  if (!switched && outX)
//  {
//    vel.x = -vel.x;
//    switched = true;
//  }
//  
//  if (!switched && outY)
//  {
//    vel.y = -vel.y;
//    switched = true;
//  }

//----------------------------

//// iteration 4
//
//  if(pos.x < 0 + rad || pos.x > width - rad)
//  {
//    outX = true;
//  }
//  
//  if(pos.x > 0 + rad - 1 || pos.x < width - rad + 1)
//  {
//    outX = false;
//    switched = false;
//  }
//  
//  if(pos.y < 0 + rad || pos.y > height - rad)
//  {
//    outY = true;
//  }
//  
//   if(pos.y > 0 + rad - 1 || pos.y < height - rad + 1)
//  {
//    outY = false;
//    switched = false;
//  }
//  
//  if (!switched && outX)
//  {
//    vel.x = -vel.x;
//    switched = true;
//  }
//  
//  if (!switched && outY)
//  {
//    vel.y = -vel.y;
//    switched = true;
//  }

//----------------------------------------

// tolerant collison detection iteration 5

  if(pos.x <= 0 + rad || pos.x >= width - rad)
  {
    outX = true;
  }
  
  else
  {
    outX = false;
    switchedX = false;
  }
  
  if(pos.y <= 0 + rad || pos.y >= height - rad)
  {
    outY = true;
  }
  
  else
  {
    outY = false;
    switchedY = false;
  }
  
  if (!switchedX && outX)
  {
    vel.x = -vel.x;
    switchedX = true;
  }
  
  if (!switchedY && outY)
  {
    vel.y = -vel.y;
    switchedY = true;
  }

//---------------------------------

  
    //speed caps static
  
  if(!caps)
  {
    if (vel.x > 15)
    {
      vel.x = 15;
    }
    
    if (vel.y > 15)
    {
      vel.y = 15;
    }
    
    if (vel.x < -15)
    {
      vel.x = -15;
    }
    
    if (vel.y < -15)
    {
      vel.y = -15;
    }
  }

// speed caps leeway

  if (caps)
  {
    if (vel.x > 5)
    {
      vel.x = vel.x * .01;
    }
    
    if (vel.y > 5)
    {
      vel.y = vel.y * .01;
    }
    
    if (vel.x < -5)
    {
      vel.x = vel.x * .01;
    }
    
    if (vel.y < -5)
    {
      vel.y = vel.y * .01;
    }
  
  }
  
  ellipse(pos.x, pos.y, rad*2, rad*2);
  
  println(vel.x);
    
}


