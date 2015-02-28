
void setup()
{
  size(400, 400);
  background(0);
  //rectMode(CENTER);

}

void draw()
{
  int count = frameCount;

  noFill();
  stroke(255);
  rect(200, 200, 200, 20);  
  fill(255);
  if(count < 300)
  {
  rect(100, 200, count, 20);
  }
  if(count > 300);
  {
    rect(100, 200, 200, 20);
  }
} 
                                
