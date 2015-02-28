
float rad = -0.0;
float rad2 = 0.0;
float s = 1.0;
float timer = 0.0;
float myscaleSpeed = 0.01;
float myscale = 1.0;

void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB, 160, 200, 50);
  
}

void draw()
{
  timer = timer + (1.0 / 30.0);
  
  if (timer >= 0.0 && timer < 10.0)
  {
 
  rad = rad + -0.1;
  s = s + 0.001;
 
  fill(random(255), random(255), random(255), random(255));
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  rectMode(CORNER);
  rect(0, 0, 150, 150);
 
  
  popMatrix();
  
  pushMatrix();
  
  translate(100, 100);
  rotate(radians(45));
  scale(2);

  
  popMatrix();  
  }
  else if (timer >= 10.00 && timer < 20.00)
  {
   rad = rad + -0.1;
  s = s + 0.01;
 
  fill(random(255), random(255), random(255), random(255));
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  rectMode(CENTER);
  rect(0, 0, 150, 150);
 
  
  popMatrix();
  
  pushMatrix();
  
  translate(100, 100);
  rotate(radians(45));
  scale(2);

  
  popMatrix();
  }
  else if(timer >= 20.0 && timer < 30.0)
  {
    myscale = myscale - myscaleSpeed;
    rad = rad + -0.1;
  s = s + 0.01;
 
  fill(random(255), random(255), random(255), random(255));
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rad);
  scale(myscale);
  
  rectMode(CENTER);
  rect(0, 0, 150, 150);
 
  
  popMatrix();
  
  pushMatrix();
  
  translate(100, 100);
  rotate(radians(45));
  scale(2);

  
  popMatrix();
  }
}


