
float percent = 0;
float milliSec = 0;
float dif = 0;

void setup()
{
  size(300, 300);
  background(0);
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  //rectMode(CENTER);
  
  rect(50, 130, 200, 20);
  fill(255);
  milliSec = map(millis()-dif, 0, 5000, 0, 200);
  if(millis()-dif <= 5000)  
  {
  if(milliSec < 200)
  {
    rect(50, 130, milliSec, 20);
  }
    else
    {
      rect(50, 130, 200, 20);
    }   
  }
  percent = 100;
  text("LOADING" + int(percent) + "%", 50, 120);
}

void mousePressed()
{
  if(milliSec >= 200)
    {
      dif = millis();
    }
}

