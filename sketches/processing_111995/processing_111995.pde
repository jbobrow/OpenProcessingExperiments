
float angle = 0.0;
float a = 0.0;
float b = 0.0;
float c = 0.0;
float timer = 0;
float s = 1;
float sa = 0.05;

void setup()
{
  size(500,500);
}

void draw()
{
  angle += 0.1;
  //if (timer >=3)
  //{
   // timer = 0.0;
  //}
  
  if (timer < 4)
  {
    background(0);
    
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    rotate(angle);
    rect(0,0,100,100);
    popMatrix();
    
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    rotate(angle);
    fill(0);
    rect(0,0,80,80);
    popMatrix();
    
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    rotate(angle);
    fill(#FFFFFF);
    rect(0,0,60,60);
    popMatrix();
    
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    rotate(angle);
    fill(0);
    rect(0,0,40,40);
    popMatrix();
    
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    rotate(angle);
    fill(#FFFFFF);
    rect(0,0,20,20);
    popMatrix();
  }
  else
  {
    background(255, 0, 0);
  }
  if (timer > 2 && timer < 5)
  {
    fill(0,0,0,20);
    rect(250,250,width,height);
    fill(255);
  }
  if (timer > 4 && timer < 6)
  {
    pushMatrix();
    float angle = radians(a/2);
    a += 10;
    b = 320 + sin(angle)*100;
    rotate(radians(5));
    ellipse(a,b,100,100);
    popMatrix();
    
   float c = radians(a*2);
    a += 10;
    b = 100 + cos(c)*50;
    rotate(radians(5));
    ellipse(a,b,100,100);
  }
  if (timer > 6 && timer < 10)
  {
    s += sa;
    if (s > 5)
    {
      sa = -.05;
    }
    if (s < 0)
    {
      sa = 0.5;
    }
   background(0);
    rectMode(CENTER);
    pushMatrix();
    translate(250,250);
    scale(s);
    rect(0,0,100,100);
    popMatrix();
  }
  
  if (timer < width)

  timer = timer + 0.0167;
}


