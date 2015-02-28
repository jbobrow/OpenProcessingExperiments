
float rad = 0.0;
float s = 1.0;
float timer = 0.0;
float myscaleSpeed = 0.001;
float myscale = 1.0;
 
void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB, 200, 100, 50);
  frameRate(30);
}
 
void draw()
{
  rad = rad + 0.1;
  s = s + 0.01;
  timer = timer + (1.0/30.0);
  myscale = myscale + myscaleSpeed;
   
  if(timer >= 0.0 && timer < 16.0)
  {
    pushMatrix();
    noStroke();
    fill(random(255),random(200),random(50,100),random(50,100));  
    translate(width/2, height/2);
    rotate(rad);
    scale(s);
    rectMode(CORNER);
    rect(0, 0, 100, 100);
    rectMode(CENTER);
    rect(0, 0, 50, 50);
    popMatrix();

  }
else if (timer > 16.1 && timer < 35.0)
  {
    myscale = myscale - myscaleSpeed*2;
    pushMatrix();
    stroke(2);
    translate(width/2,height/2);
    rotate(rad);
    scale(myscale);
    triangle(35, 80, 63, 25, 91, 80);
    fill(random(255),random(200),random(50,100),random(50,100));
    popMatrix();
  }
  else if (timer > 35.1 && timer < 45.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    fill(random(255),random(200),random(50,100),random(50,100)); 
    popMatrix();
  }
  else if (timer > 45.1)
  {
    pushMatrix();
    noStroke();
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    rect(0, 0, 75, 75);
    fill(random(255),random(200),random(50,100),random(50,100)); 
    popMatrix();
  }
}


