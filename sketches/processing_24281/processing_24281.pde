
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
  fare();
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

int r4 = 210;

void fare()
{
    translate(r4,0);
  
    stroke(255,100);
    strokeWeight(40);
      
    line(0,0,0,height);
    line(80,0,80,height);
    line(-80,0,-80,height);
      
    line(240,0,240,height);
    line(-240,0,-240,height);
      
    line(480,0,480,height);
    line(-480,0,-480,height);
      
    stroke(242,237,213);
    strokeWeight(24);
      
    line(0,0,0,height);
    line(80,0,80,height);
    line(-80,0,-80,height);
      
    line(240,0,240,height);
    line(-240,0,-240,height);
      
    line(480,0,480,height);
    line(-480,0,-480,height);
    
    for(int b = 0, c = 0; c < 54; b = b + 40)
    {
      stroke(242,237,213,50);
      strokeWeight(2);
      fill(250,248,227);
      rect(128,b,64,32);
      
      stroke(242,237,213,50);
      fill(250,248,227);
      rect(-192,b,64,32);
      
      if(b >= 1400)
      {
        c = c + 6;
        b = -40;
      }
      
      float g = random(0,120);
      
      stroke(242,237,213,g);
      strokeWeight(1);
      noFill();
      for(int e = 0; e <= 64 ; e = e + 16)
      {
        ellipse(128 + e,b + 16,32,32);
        ellipse(-192 + e, b + 16,32,32);
      }
    }
    
    for(int d = 0, e = -80; d < height; e = e + 40)
    {    
      stroke(242,237,213,160);
      strokeWeight(1);
      noFill();
      triangle(-220 + e, d, -180 + e, d, -200 + e, d + 40);
      if(e == 680)
      {
        d = d + 40;
        e = -80;
      }
    }
    
    for(int f = -4, g = 0, h = -12; f <= height; f = f + 4)
    {
      stroke(200,40);
      strokeWeight(1);
      noFill();
      arc(g, f, 30, 30, 1, PI-1);
      arc(0 - g, f, 30, 30, 1, PI-1);
      
      stroke(200,80);
      strokeWeight(1);
      arc(g, h, 30, 30, 1, PI-1);
      arc(0 - g, h, 30, 30, 1, PI-1);
      
      h = h + 12;
      
      if(f >= 588 && g == 0)
      {
        f = -12;
        g = g + 80;
        h = -12;
      }
      else if(f >= 588 && g == 80)
      {
        f = -12;
        g = g + 160;
        h = -12;
      }
      else if(f >= 588 && g == 240)
      {
        f = -12;
        g = g + 240;
        h = -12;
      }
    }
    
    for(int aa = 0; aa < 40; aa = aa + 1)
    {
      stroke(242,237,213,30);
      strokeWeight(2);
      float xa = random(0,700);
      float ya = random(0,1400);
      float xb = random(xa,700);
      float yb = random(xb,1400);
      line(xa,ya,xa-xb,ya-yb);
    }   
}

