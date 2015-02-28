
//import processing.pdf.*;

void setup()
{
  size(300,600);
  background(255);
  noLoop();
  //beginRecord(PDF, "Wall4.pdf"); 
}

void draw()
{
  wall();
  lines();
  //endRecord();
}

void wall()
{
  for(int x = 0, y = 0; y <= height; x = x + 1)
  {
    color c = color(242,random(220,240),random(150,200),140);
    stroke(c);
    point(x,y);
    if(x == width)
    {
      y = y + 1;
      x = 0;
    }
  }
}

int r1 = 170;

void lines()
{
  for(int x = 0; x <= 5; x = x + 1)
  {
    stroke(255,100);
    strokeWeight(5);
      
    line(0,0,0,height);
    line(10,0,10,height);
    line(-10,0,-10,height);
      
    line(30,0,30,height);
    line(-30,0,-30,height);
      
    line(60,0,60,height);
    line(-60,0,-60,height);
      
    stroke(242,237,213);
    strokeWeight(3);
      
    line(0,0,0,height);
    line(10,0,10,height);
    line(-10,0,-10,height);
      
    line(30,0,30,height);
    line(-30,0,-30,height);
      
    line(60,0,60,height);
    line(-60,0,-60,height);
    
    for(int b = 0; b < height; b = b + 5)
    {
      stroke(242,237,213,50);
      strokeWeight(1);
      fill(255,100);
      rect(16,b,8,4);
      
      stroke(242,237,213,50);
      fill(255,100);
      rect(-24,b,8,4);
    }
    
    translate(r1, 0);
  }
}

