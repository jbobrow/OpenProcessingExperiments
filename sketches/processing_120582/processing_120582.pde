
void setup()
{
size(500, 500);
background(0);
}

void draw()
{
  background(0);
   for(int i=10; i<480; i+=8)
  {
    stroke(0);
    fill(100, 100, 100);
    rect(i, 10, 8, 15);
  }

  
  for(int i=10; i<470; i+=19)
  
  {
    stroke(0);
    fill(100);
    rect(i, 475, 19, 15);
  }
  
  {
    int sec = second()*8;
    fill(0, 255, 0);
    noStroke();
    rect(10, 50, sec, 60); 
   }


  {
    int min = minute()*8;
    fill(255);
    noStroke();
    rect(10, 200, min, 40);
   }


  {
    int h = hour()*19;
    fill(80, 80, 80);
    noStroke();
    rect(10, 330, h, 120);
   }
   
}

