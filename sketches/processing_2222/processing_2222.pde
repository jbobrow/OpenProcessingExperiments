
class MyClass
    {
      float damping = 0.75;
      float stiffness = 1;
      float x;
      float y;
      float vy;
      float vx = 1;
      float x2;
      float y2;
      
       MyClass(float m, float g, float xpos, float ypos)
        {
          gravity = g;
          mass = m;
          x = xpos;
          y = ypos;
        }
     void Spring(float targetX, float targetY)
    {
        float forceX = (targetX - x) * stiffness;
        //forceX += gravity;
        float ax = forceX/mass;
        vx = damping * (vx + ax);
        x += vx;
        if ( targetX > 500)
        {
         forceX = forceX *-1;
        }
        
        float forceY = (targetY - y) * stiffness;
        forceY += gravity;
        float ay = forceY/mass;
        vy = damping *(vy + ay);
        y += vy;
        if ( targetY > 500)
        {
         y = y *-1;
        }
        
    }
    void display(float nx, float ny, float RealSize)
    {
  
     noStroke();
      ellipse(x, y,Size,RealSize);
      stroke(255);
      line(mouseX, mouseY,x,y);
      line(nx,ny,x,y);
      
    }
}

