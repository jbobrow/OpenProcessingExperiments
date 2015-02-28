
//Homework 8
//Tyler Porten (tporten) copyright 2012


void setup()
{
  size(400, 400);
  rectMode(CENTER);
  
  
  
}

void draw()
{
  float x = 0, y = 0, w = 0;
  background(255);
  
  while(y < height)
  {
    stroke(((mouseX)*x%255), (.5*x%255), ((mouseX)*.1*x%255));
   noFill();
   strokeWeight(5 + w);
    if (keyCode == UP){
   w = w + 1;
 }
 else if (keyCode == DOWN){
   w = w - 1;
   if (w <= 0){
     w = 0;
   }
 }
   rect(x, y, 0, height);
    x = x + 10;
    y = y + 10;
  }

  
}

