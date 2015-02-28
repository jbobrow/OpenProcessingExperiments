
float rad = 0.0;
float s = 1.0;
float timer = 0.0;
float myscaleSpeed = 0.01;
float myscale = 1.0;

void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB, 360,100,100);
  frameRate(30);
}

void draw()
{
  rad = rad + 0.1;
  s = s + 0.01;
  timer = timer+(1.0/30.0);
  println (timer);
  myscale = myscale + myscaleSpeed;
  
  if (timer >= 0.0 && timer <7.5)
  {
    pushMatrix();
    fill(random(255), random(200), random(50,100), random(50,100));
    
    translate(width/2, height/2);
    rotate(rad);
    scale(myscale*2);
    rectMode(CENTER);
    rect(0,0,100,100);
    popMatrix();
  }
  
  else if (timer >7.5 && timer <18.0)
  {
    myscale = myscale - myscaleSpeed*2;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    scale(myscale*2);
    ellipse(0,0,100,100);
    fill(random(255), random(200,360), random(50,100), random(10,60));
    popMatrix();
  }
  
  else if(timer > 18.0 && timer < 30.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    scale(myscale);
    rect(0,0,100,100);
    rectMode(CENTER);
    popMatrix();
  }
  
  else if (timer> 30.0 &&  timer < 41.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    scale(myscale*2);
    triangle(0,0,100,100,50,50);
    popMatrix();
  }
  
  
}


