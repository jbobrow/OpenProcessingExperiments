
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
  curves();
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

int r2 = 340;

void curves()
{    
  for(int x = 0; x <= 4; x = x + 1)
  {
    stroke(255,100);
    strokeWeight(10);
      
    line(0,0,0,height);
    line(20,0,20,height);
    line(-20,0,-20,height);
      
    line(60,0,60,height);
    line(-60,0,-60,height);
      
    line(120,0,120,height);
    line(-120,0,-120,height);
      
    stroke(242,237,213);
    strokeWeight(6);
      
    line(0,0,0,height);
    line(20,0,20,height);
    line(-20,0,-20,height);
      
    line(60,0,60,height);
    line(-60,0,-60,height);
      
    line(120,0,120,height);
    line(-120,0,-120,height);
    
    for(int b = 0; b < height; b = b + 10)
    {
      stroke(242,237,213,50);
      strokeWeight(1);
      fill(255,100);
      rect(32,b,16,8);
      
      stroke(242,237,213,50);
      fill(255,100);
      rect(-48,b,16,8);
    }
    
    for(int d = 0, e = 0; d < height; e = e + 10)
    {    
      stroke(242,237,213,160);
      strokeWeight(1);
      noFill();
      triangle(-215 + e, d, -205 + e, d, -210 + e, d + 10);
      if(e == width)
      {
        d = d + 10;
        e = -10;
      }
    }
    
    for(int f = -3, g = 0; f <= height; f = f + 3)
    {
      stroke(200,80);
      strokeWeight(1);
      noFill();
      arc(g, f, 6, 6, 1, PI-1);
      arc(0 - g, f, 6, 6, 1, PI-1);
      
      if(f >= 597 && g == 0)
      {
        f = -3;
        g = g + 20;
      }
      else if(f >= 597 && g == 20)
      {
        f = -3;
        g = g + 40;
      }
      else if(f >= 597 && g == 60)
      {
        f = -3;
        g = g + 60;
      }
    }
    
    translate(r2, 0);
  }
}

