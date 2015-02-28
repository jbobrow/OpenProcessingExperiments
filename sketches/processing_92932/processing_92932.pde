
boolean circlesCollided(float x1, float y1, float x2, float y2, float radius1, float radius2)
{
  if (dist(x1, y1, x2, y2) < (radius1 + radius2))
  {
    return true;
  }
  else
  {
    return false;
  }
}

// assumes you are drawing images with imageMode(CENTER)
boolean imagesCollided(PImage image1, PVector position1, PImage image2, PVector position2)
{
  boolean collided = true;
  
  float left1 = position1.x - image1.width / 2;
  float right1 = position1.x + image1.width / 2;
  float top1 = position1.y - image1.height / 2;
  float bottom1 = position1.y + image1.height / 2;
  
  float left2 = position2.x - image2.width / 2;
  float right2 = position2.x + image2.width / 2;
  float top2 = position2.y - image2.height / 2;
  float bottom2 = position2.y + image2.height / 2;
 
  if (left2 > right1 || right2 < left1 || top2 > bottom1 || bottom2 < top1)
  {
    collided = false;
  }

  return collided;
}
