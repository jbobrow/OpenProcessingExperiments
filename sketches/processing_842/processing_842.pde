
class bullet
{
  boolean active;
  float bulletRadius;
  PVector position;
  PVector velocity;
  
  bullet()
  {
    active = false;
    bulletRadius = 10;
    position = new PVector();
    velocity = new PVector();
  }
  
 void move(PVector moveTarget)
 {
     active = true;
     position.x = xLoc;
     position.y = yLoc;
     velocity.x=moveTarget.x;
     velocity.y=moveTarget.y;
     velocity.sub(position);
     velocity.normalize();
     velocity.mult(5);
 }
 
 void update()
 {
   if(active)
   {
     position.add(velocity);
     if(position.x<0||position.x>width||position.y<0||position.y>height)
     {
       active = false; 
     }
     int bulletLocationIndex = (int)position.x+(((int)position.y)*width);
     if(bulletLocationIndex > 0 && bulletLocationIndex < width*height)
     {
       if(bkgImage.pixels[(int)position.x+(((int)position.y)*width)] != color(255,255,255,255))
       {
         int xLeftBound = (int)position.x-(int)bulletRadius;
         if(xLeftBound<0)
           xLeftBound=0;
           int xRightBound = (int)position.x+(int)bulletRadius;
         if(xRightBound>width)
           xRightBound=width;
          int yLeftBound = (int)position.y-(int)bulletRadius;
         if(yLeftBound<0)
           yLeftBound=0;
           int yRightBound = (int)position.y+(int)bulletRadius;
         if(yRightBound>height)
           yRightBound=height;
         
        for(int x = xLeftBound; x < xRightBound; x++)
        {
          for(int y = yLeftBound; y < yRightBound; y++)
          {
            PVector distance = new PVector();
            distance.x = x;
            distance.y = y;
            if(distance.dist(position)<bulletRadius)
            {
             bkgImage.pixels[x+y*width]=color(255,255,255,255); 
            }
          } 
        } 
        bkgImage.updatePixels();
       }
     }
   }
 }
 
 void render()
 {
   if(active)
   {
     stroke(0,0,0);
     ellipse((int)position.x,(int)position.y,5,5);
   } 
  }
}

