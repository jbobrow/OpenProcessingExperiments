
float timer = 0.0;
float myscale = 1.0;
float myscaleSpeed = 0.02;
float rad = 0.0;


void setup()
{
  size(500,500);
  frameRate(30);
  

}

void draw()
{
  background(0);
  
  
  timer = timer + (1.0 / 30.0);
  println(timer);
  
  if (timer >= 2.0  && timer < 6.0)
  {
    myscale = myscale + myscaleSpeed;
    pushMatrix();
    translate(100, 200);
    rectMode(CENTER);
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }
  
  else if(timer > 6.0  && timer < 12.0)
  {
    myscale = myscale - myscaleSpeed;
    pushMatrix();
    translate(100, 200);
    rectMode(CENTER);
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }
    
    
    
  
  else if (timer >= 12.0 && timer < 14.0)
  {
    rad = rad +0.1;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    rect(0,0,100,100);
    rectMode(CENTER);
    popMatrix();
    
  }
  else if (timer > 14.0 && timer < 16.0)
  {
    triangle(77,100,150,50,100,50);
  }
  else
  {
    background(255,0,0);
  }
}



