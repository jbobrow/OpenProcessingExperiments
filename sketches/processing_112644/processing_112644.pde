
float timer = 0;
float angle = 0;
float s = 1;
float scaleSpeed = 0.01;
float ellipseX = 0;

void setup()
{
  size( 500, 500);
}

void draw()
{
  timer += 1;
  angle += 0.1;
  s += scaleSpeed;
  ellipseX += 1;
  rectMode(CENTER);
  
  if (s > 3 || s < 0)
  {
   scaleSpeed = - scaleSpeed; 
  }
  
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  
  if(timer > 50)
  {
    fill(0, 0, 255);
    pushMatrix();
    translate(width/2, height/2);
    scale(s);
    ellipse(0, 0, 100, 100);
    popMatrix();
  }
  
  if(timer < 65)
  {
    fill(0, 255, 0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    rect(0, 0, 50, 50);
    popMatrix();
  }
  else
  {
   fill(255, 0, 0);
   float curve = ellipseX * 4;
   float ellipseY = (height/2 + cos(radians(curve)) * 100);
   ellipse(ellipseX, ellipseY, 100, 100); 
  }
  
    if(timer == 117)
    {
     timer = 0; 
    }
}


