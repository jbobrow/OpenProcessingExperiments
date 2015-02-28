
// Anna Lee
// DMA 28 Summer 2012
// Workshop 7

class Robot
{
  float x;
  float y;
  float bodyHeight;
  float bandHeightFraction = 0.5;
  float headDir;
  float xmin;
  float xmax;
  float speed = random(1, 2);
  float headspeed = random(1/100.0, 3/100.0);
  
  Robot(float in_x, float in_y, float in_bodyHeight, float in_headDir)
  {
    x = in_x;
    y = in_y;
    bodyHeight = in_bodyHeight;
    headDir = in_headDir;
    xmin = x - random(50, 100);
    xmax = x + random(50, 100);
  }
  
  void update()
  {
    // robot moves horizontally between xmin and xmax
    x += speed;
    if (x > xmax)
    {
      x = xmax;
      speed = -speed;
    }
    else if (x < xmin)
    {
      x = xmin;
      speed = -speed;
    }
    
    // band is at bottom when robot is at xmin and max, and at top in the middle
    bandHeightFraction = (x-xmin)/(xmax-xmin);
    
    // spin head
    headDir += headspeed;
  }
  
  void draw()
  {
    pushMatrix();
      translate(x, y);
      
      // wheels
      fill(70);
      ellipse(-15, -10, 20, 20);
      ellipse(15, -10, 20, 20);
      
      // body
      fill(255, 235, 100);
      rect(-30, -bodyHeight-20, 60, bodyHeight);
      
      // band
      fill(68, 142, 242);
      float bandHeight = (bodyHeight-5)*bandHeightFraction;
      rect(-30, -25-bandHeight, 60, 5);
    
      // head  
      pushMatrix();
        translate(0, -bodyHeight-25);
        rotate(headDir-PI/2);
        // face
        fill(255, 171, 36);
        ellipse(0, 0, 50, 50);
        fill(255, 196, 100);
        triangle(0, 50, -25, -25, 25, -25);
        // eyes
        fill(77, 59, 30);
        ellipse(-8, -12, 6, 12);
        ellipse(8, -12, 6, 12);
      popMatrix();
     popMatrix();
  }
}

