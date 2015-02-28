
float rad = 0.0;
float s = 0.1;
float timer = 0.0;
float scalespeed = 0.1;
float myscale = 1.0;
void setup()
{
  size(400,400);
  background(0);
  frameRate(30);
}

void draw()
{
  rad = rad +0.1;
  s = s + 0.01;
  myscale = myscale + scalespeed;
  timer = timer + (1.0/30.0);
  
  if(timer>0.0 && timer<9.0)
    {
    pushMatrix();
    fill(random(100), random(200), random(0));
    translate(width/2, height/2);
    rotate(rad);
    scale(s);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
  }
    else if( timer>9.0 && timer<14.0)
    {     
    pushMatrix();    
    translate(width/2,height/2);
    rotate(rad);
    scale(s-1);
    rect(0,0,100,100);
    fill(255,255,255);
    popMatrix();
    }
      else if (timer>14.0)
      {
      pushMatrix();
      fill(random(200), random(0), random(100));
      translate(width/2, height/2);
      rotate(rad-1);
      triangle(100,50, 50,100, 100,100);
      popMatrix();
      }
}



