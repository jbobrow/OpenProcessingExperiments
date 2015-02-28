
class Ball
{
  float x;
  float y;
  float OrgX = 230;
  float OrgY = 230;
  boolean moving = false;

  Ball(float xStart, float yStart)
  {
    x = xStart;
    y = yStart;
    OrgX = xStart;
    OrgY = yStart;
  }
 
  void startMoving()
  {
   // if the mouse is within the ball
   if(mouseX > x - 15 && mouseX < x + 15 && mouseY > y - 15 && mouseY < y + 15)
   {
     moving = true; 
   }
  }
 
  void stopMoving()
  {
    if(moving == true)
    {
      moving = false;
      OrgX = mouseX;
      OrgY = mouseY;
    }
  } 
  
  void display()
  {
   x = OrgX;
   y = OrgY;
   
   if(moving == true)
   {
     x = mouseX;
     y = mouseY; 
   }
    
   ellipse(x,y,30,30);
   
   line (x,y,0,0);
   //ine (x,y,0,60);
   //line (x,y,0,120);
   line (x,y,0,180);
   //line (x,y,0,240);
   //line (x,y,0,300);
   line (x,y,0,360);
   //line (x,y,0,420);
   //line (x,y,0,480);
   line (x,y,0,540);
   line (x,y,0,600);
   line (x,y,60,0);
   line (x,y,120,0);
   //line (x,y,180,0);
   //line (x,y,240,0);
   line (x,y,300,0);
   line (x,y,360,0);
   //line (x,y,420,0);
   //line (x,y,480,0);
   line (x,y,600,0);
   line (x,y,600,60);
   //line (x,y,600,120);
   //line (x,y,600,180);
   //line (x,y,600,240);
   line (x,y,600,300);
   line (x,y,600,360);
   //line (x,y,600,420);
   //line (x,y,600,480);
   line (x,y,600,540);
   line (x,y,600,600);
   line (x,y,60,600);
   //line (x,y,120,600);
   //line (x,y,180,600);
   //line (x,y,240,600);
   line (x,y,300,600);
   //line (x,y,360,600);
   //line (x,y,420,600);
   //line (x,y,480,600);
   line (x,y,540,600);
   
   
   if(keyPressed)
   {
     stroke(random(255));
     line (x,y,0,0);
     line (x,y,0,60);
     line (x,y,0,120);
     line (x,y,0,180);
     line (x,y,0,240);
     line (x,y,0,300);
     line (x,y,0,360);
     line (x,y,0,420);
     line (x,y,0,480);
     line (x,y,0,540);
     line (x,y,0,600);
     line (x,y,60,0);
     line (x,y,120,0);
     line (x,y,180,0);
     line (x,y,240,0);
     line (x,y,300,0);
     line (x,y,360,0);
     line (x,y,420,0);
     line (x,y,480,0);
     line (x,y,600,0);
     line (x,y,600,60);
     line (x,y,600,120);
     line (x,y,600,180);
     line (x,y,600,240);
     line (x,y,600,300);
     line (x,y,600,360);
     line (x,y,600,420);
     line (x,y,600,480);
     line (x,y,600,540);
     line (x,y,600,600);
     line (x,y,60,600);
     line (x,y,120,600);
     line (x,y,180,600);
     line (x,y,240,600);
     line (x,y,300,600);
     line (x,y,360,600);
     line (x,y,420,600);
     line (x,y,480,600);
     line (x,y,540,600); 
   }
    
  }
}

