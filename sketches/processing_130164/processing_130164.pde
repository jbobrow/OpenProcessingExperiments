
float rad = 0.0;
float s = 0.1;
float timer = 0.0;
float scalespeed = 0.1;
float myscale = 1.0;
void setup()
{
  size(400,400);
  background(0);
  colorMode(HSB, 360,100,100);
  frameRate(30);
}

void draw()
{
  rad = rad +0.1;
  s = s + 0.01;
  myscale = myscale + scalespeed;
  timer = timer + (1.0/30.0);
  if(timer > 0.0 && timer < 15.0)
  { 
  pushMatrix();
  fill(random(255), random(255), random(255), random(255)); 
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  }
  else if( timer >15.0 && timer < 20.0)
  {
    
    pushMatrix();
    
    translate(width/2,height/2);
    rotate(rad);
    scale(s-1);
    ellipse(0,0,100,100);
    fill(HSB, 255,0,255);
    popMatrix();
  }
  else if (timer > 20.1)
  {
    rad = rad - .01;
    noStroke();
    fill(random(255), random(255), random(255));
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    rect(0,0,250,250);
  }
}


