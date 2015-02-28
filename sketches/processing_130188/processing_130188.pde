
float timer = 0.0;
float myscale = 0.0;
float myscaleSpeed = 0.02;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
}

void draw()
{
  //background(0);
  timer = timer + (1.0 / 60.0);
  println(timer, myscale);
  
  if (timer >= 0.0 && timer < 6.0)
  {
    myscale = 0;
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    fill(random(255), random(255), random(255));
    rotate(radians(timer * 775));
    rect(0, 0, 300, 300);
    fill(random(255), random(255));
    rotate(radians(timer * 1225));
    rect(0, 0, 200, 200);
    fill(random(255));
    rotate(radians(timer * 1775));
    rect(0, 0, 100, 100);
    popMatrix();
  }
  
  else if (timer >= 6.0 && timer < 10.0)
  {
    strokeWeight(random(10));
    stroke(random(300),random(300),random(300));
    line(0,random(500),500,random(500));
  }
  
  else if (timer >= 10.0 && timer < 15.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    strokeWeight(1);
    fill(random(300), random(300), random(300));
    rotate(radians(timer * 775));
    rect(-150, -150, 150, 150);
    rect(0, 0, 150, 150);
    popMatrix();
  }
  
  else if (timer >= 15.0 && timer < 19.0)
  {
    myscale = myscale + myscaleSpeed;
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    strokeWeight(1);
    fill(random(100), random(100), random(100));
    rotate(radians(timer * 200));
    scale(myscale);
    rect(-150, -150, 150, 150);
    rect(0, 0, 150, 150);
    popMatrix();
  }
  
  else
  {
    timer = 0;
  }
}


