
//HW 8a: For Loop
//(c) Sunny Li 2013

//****CAUTION: This may cause visual discomfort!***\\

int i;

void setup()
{
  background(255);
  size(400, 400);
}

void draw()
{
  forLoop();
}

void forLoop()
{
  
  for (int i = 0; i < height; i = i + 1)
  {
    strokeWeight(random(10));
    stroke(random(255), random(255), random(255));
    line(0, i, width, i);
  }
}
