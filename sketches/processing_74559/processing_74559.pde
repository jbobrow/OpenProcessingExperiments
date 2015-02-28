
float x = 0;
float y = 40;
float vx, vy, gravity;

void setup()
{
  size(800, 800);
  smooth();
  //noFill();
  
  vx = random(-20,20);
  vy = random(-2,2);
  gravity = .80;
  rad = 100
  
}

void draw()
{
  background(255);
  fill(random(0,255),0,0, 100);
  stroke(random(0,255),0, 0, 5);
  ellipse(x,y+340, rad,rad);
  
  fill(0,0, random(0,255), 100);
  stroke(random(0,255),0, 0, 5);
  ellipse(x,y+400, rad,rad);
  
  fill(255,255, random(0,25), 100);
  stroke(random(0,255),0, 0, 5);
  ellipse(x-50,y+370, rad,rad);
  
  x = x + vx;
  y = y + vy;
  
  vy+=gravity;
  vx*=.99;
  
   //no semi-colons after "if" statement
  //right side
  if(x > width)
  {
    
    vx*=-1;
    x = width;
  }
  
  //left side
  if(x < 0)
  {
    vx*=-1;
    x = 0;
  }
  
  //bottom edge
   if(y > height - (rad/2))
    {
      vy*=-1;
      y = height-(rad/2);
    }
  
 
  x = x + 15; //velocity
  
}
