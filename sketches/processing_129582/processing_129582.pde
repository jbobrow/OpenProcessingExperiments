
float timer = 0.0;
float myscale = 1.5;
float myscaleSpeed = 0.01;
float myrotationSpeed = 0.05;
float myrotation = radians(45);
float radius = 70;
float x, x2;
float angle = 0;
float frequency = 4;
float py = 50 + sin(radians(angle)) * (radius);

void setup()
{
  size(500, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  myscale = myscale + myscaleSpeed;
  myrotation = myrotation + myrotationSpeed;
  
  if (timer >= 2.0 && timer < 3.0)
  {
    rect(150,150,100,100);
  }
  else if (timer >= 3.0 && timer < 3.5)
  {
    ellipse(300, 300, 200, 200);
  }
  else if (timer > 3.0 && timer < 4.0)
  {
    triangle(170, 100, 150, 50, 100, 0);
  }
  else
  {
    background(50, 0, 0);
  }
  
  if (timer >= 1.0 && timer <= 15.0)
  {
    pushMatrix();
    translate(50,75);
    scale(myscale);
    rect(0, 0, 75, 75);
    popMatrix();
  }
  if (myscale > 2.5)
  {
    myscaleSpeed = -0.04;
  }
  else if (myscale <= 0.5)
  {
    myscaleSpeed = 0.04;
  }
  
  if (timer >= 6.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(myrotation);
    fill(100);
    rectMode(CENTER);
    rect(0,0,80,80);
    popMatrix();
    noFill();
  }
  
  ellipse(width/7 + radius + x, py, 100, 100);
  angle -= frequency;
  x += 1;
  
}


