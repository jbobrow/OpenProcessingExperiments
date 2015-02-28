
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
  toll();
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

int r3 = 680;

void toll()
{
  for(int x = 0; x <= 2; x = x + 1)
  {
    stroke(255,100);
    strokeWeight(20);
      
    line(0,0,0,height);
    line(40,0,40,height);
    line(-40,0,-40,height);
      
    line(120,0,120,height);
    line(-120,0,-120,height);
      
    line(240,0,240,height);
    line(-240,0,-240,height);
      
    stroke(242,237,213);
    strokeWeight(12);
      
    line(0,0,0,height);
    line(40,0,40,height);
    line(-40,0,-40,height);
      
    line(120,0,120,height);
    line(-120,0,-120,height);
      
    line(240,0,240,height);
    line(-240,0,-240,height);
    
    for(int b = 0, c = 0; c < 27; b = b + 20)
    {
      stroke(242,237,213,50);
      strokeWeight(2);
      fill(250,248,227);
      rect(64,b,32,16);
      
      stroke(242,237,213,50);
      fill(250,248,227);
      rect(-96,b,32,16);
      
      if(b >= 1400)
      {
        c = c + 3;
        b = -20;
      }
      
      float g = random(0,120);
      
      stroke(242,237,213,g);
      strokeWeight(1);
      noFill();
      for(int e = 0; e <= 32 ; e = e + 8)
      {
        ellipse(64 + e,b + 8,16,16);
        ellipse(-96 + e, b + 8,16,16);
      }
    }
    
    for(int d = 0, e = -60; d < height; e = e + 20)
    {    
      stroke(242,237,213,160);
      strokeWeight(1);
      noFill();
      triangle(-220 + e, d, -200 + e, d, -210 + e, d + 20);
      if(e == width)
      {
        d = d + 20;
        e = -80;
      }
    }
    
    for(int f = -6, g = 0; f <= height; f = f + 6)
    {
      stroke(200,80);
      strokeWeight(1);
      noFill();
      arc(g, f, 14, 14, 1, PI-1);
      arc(0 - g, f, 14, 14, 1, PI-1);
      
      if(f >= 594 && g == 0)
      {
        f = -6;
        g = g + 40;
      }
      else if(f >= 594 && g == 40)
      {
        f = -6;
        g = g + 80;
      }
      else if(f >= 594 && g == 120)
      {
        f = -6;
        g = g + 120;
      }
    }
    
    for(int aa = 0; aa < 20; aa = aa + 1)
    {
      stroke(242,237,213,30);
      strokeWeight(2);
      float xa = random(0,700);
      float ya = random(0,1400);
      float xb = random(xa,700);
      float yb = random(xb,1400);
      line(xa,ya,xa-xb,ya-yb);
    }
    
    translate(r3, 0);
  }
}

