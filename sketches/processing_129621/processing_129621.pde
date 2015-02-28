
float timer = 0.0;
float myscale = 1.0;
float myscaleSpeed = 0.1;
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
  
  if (timer >= 2.0  && timer < 4.0)
  {
    myscale = myscale + myscaleSpeed;
    pushMatrix();
    translate(250, 250);
    rectMode(CENTER);
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }
   
  else if(timer > 6.0  && timer < 8.0)
  {
    myscale = myscale - myscaleSpeed;
    pushMatrix();
    translate(250, 250);
    rectMode(CENTER);
    scale(myscale);
    rect(0,0,100,100);
    popMatrix();
  }           
   
  else if (timer >= 8.0 && timer < 11.0)
  {
    rad = rad +0.1;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    rect(0,0,100,100);
    rectMode(CENTER);
    popMatrix();
     
  }
  else if (timer > 11.0 && timer < 12.0)
  {
    triangle(250,100,150,50,350,50);
  }
  else if (timer > 12.0 && timer < 13.0)
  {
    triangle(250,200,150,150,350,150);
  }
  else
  {
    background(0,0,50);
  }
}



