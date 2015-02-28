
class Predator
{
  float myDiameter = 20;
  float x;
  float y;
  color col = #981414;
  float speed = 1;
  float direction = 0;
  int interact = 60;
  
  void update() {
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;

    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;

    if (x > width)
    {
      x = 0;
    }

    if (x < 0)
    {
      x = width;
    }

    if (y > height)
    {
      y = 0;
    }

    if (y < 0)
    {
      y = height;
    }
    
    if( frameCount % 60 == 0) {
      noFill();
      stroke( col, 200);
      strokeWeight(2);
      ellipse( x, y, 50, 50);
      stroke( col, 100);
      strokeWeight(1);
      ellipse( x, y, 100, 100);
    }
    
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    for (int i = 0; i < NUM_THINGS; i++) {
      Thing other = things[i];
      float predDist = dist(x, y, other.x, other.y);
      
      if (predDist<100) {
          direction -= .2;
        }
        if (predDist>100) {
          direction += .05;
        }
    }

  }
}

