
/*
  Three free-falling balls
  by Ergun Coruh
  1 September 2011
*/

int fps = 40;           // frame rate
float motionRate = 0.2; // motion-rate

Ball b1 = null;
Ball b2 = null;
Ball b3 = null;

void setup()
{
  size(100,640);
  //noStroke();
  frameRate(fps);
  smooth();

  b1 = new Ball(width/4,20);
  b2 = new Ball(width/2,20);
  b3 = new Ball(width*3/4,20);
}


class Ball
{
  float diameter;
  float xpos;
  float ypos;
  float ypeak;
  int direction;
  float time;
  boolean stopped;
  float r,g,b,a;
  float delay;
  
  Ball (
    float x0,
    float diam
    )
    {
      xpos = x0;
      diameter = diam;
      direction = 1;
      time = 0;
      ypeak = diameter/2;
      ypos = ypeak;
      stopped = false;
      r = random(255);
      g = random(255);
      b = random(255);
      a = random(255);
      delay = random(20);
    }
    
    public boolean isStopped()
    {
      return stopped;
    }
    
    void draw()
    {
      if (delay > 0)
      {
        delay--;
        return; 
      } 
      
      fill(r,g,b,a);  
      ellipse (xpos, ypos, diameter, diameter);    

      if (stopped)
        return;

      time = time + direction * motionRate;
     
      // Free-fall equation (y(t) is height at t). 
      // y(t) = -0.5 * g * t**2 + y(0) + v0 * t where v0 = 0
      ypos =  0.5 * 9.81 * time * time + ypeak;
    
      // If peak is reached flip direction   
      if (ypos <= ypeak)
      {
        direction = 1;
      }
    
      float ground = height-diameter/2;
    
      // if ground is reached flip direction
      if (ypos > ground)
      {
        ypos = ground;
        direction = -1;
      }  
      
      if (ypeak < ground)
      {
        // calc new peak proportional to remaining height
        ypeak += (ground-ypeak) * 0.01 + 0.05;
      }
      else
      {
        // stop animation
        stopped = true;
      }
    }
}

void draw()
{
  background(102);
  b1.draw();
  b2.draw();
  b3.draw();
}

