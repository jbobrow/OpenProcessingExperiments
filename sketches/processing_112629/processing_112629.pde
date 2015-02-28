
float timer = 0.0, degrees = 0.0, scaleDeg = 0.1;
float xVal = 500.0, yVal = 300.0, angle = 0.0;

void setup()
{
  size(600, 400);
  background(51, 157, 151);
}

void draw()
{
  timer++;
  
  if(timer >= 700)
  {
    degrees += 0.3;
    degrees %= 360;
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(degrees));
    scale(scaleDeg);
    rect(0, 0, 50, 50);
    scaleDeg += 0.05;
    if(scaleDeg >= 3)
    {
      scaleDeg = -scaleDeg;
    }
    popMatrix();
    
    pushMatrix();
    translate((sin(angle) * 10.0) + xVal, yVal);
    scale(scaleDeg);
    rect(0, 0, 20, 20);
    popMatrix();
    
    yVal--;
    angle += 0.5;
  }
  
  else
  {
    fill(10, 113, 23);
    degrees += 0.3;
    degrees %= 360;
    rectMode(CENTER);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(degrees));
    scale(scaleDeg);
    rect(0, 0, 50, 50);
    scaleDeg += 0.05;
    if(scaleDeg >= 3)
    {
      scaleDeg = -scaleDeg;
    }
    popMatrix();
    
    pushMatrix();
    translate(500, 300);
    scale(scaleDeg);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}


