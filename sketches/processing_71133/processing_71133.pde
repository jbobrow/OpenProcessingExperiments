
float spin = 0;
float q = 20;
float n = .5;
float m = 20;
float p =10;
float u;
float w;
float x;
float y;
float yy;
float pointrotateX;
float condense;

float pop = 0.0;
float out = 0.0;

void setup()
{
  size(500,500);
}

void draw()
{
  colorMode(RGB);
   background(20);
  frameRate(20);
  smooth();
  stroke(245, 90, 70, 10);
  translate(250, 250);
  
  for(float i = 0; i < 100; i++) //red ring
  {
    strokeWeight(i);
    rotate(3);
    line(0,y,55, y);
    y = y + .06; //each time it loops, y increases
  }
  
      if(y > 300)
      {
        y = 0; //resets loop
      }  /// CIRCLE EXPANSION
      
      
stroke(110,180, 240, 15); //BLUE RECTANGLE
   for(float a = 0; a < 100; a++)
   {
     fill(255);
     rect(0,0, w, w);
     rotate(3);
     w = w +.03;
   }
     if(w>200)
     {
       w=0;
     } 
     
strokeWeight(.2);  
fill(255);
noFill();
stroke(251, 210, 33); //RED CIRCLE
 for(float c = 0; c < 100; c++)
 {
   ellipse(0, 0, u, 30);
   rotate(3);
   u = u +.2;
 }
  if(u>300)
   {
    u=0;
   } 
   //CIRCLE MOTION
    noStroke();
    
       for(float r = 2; r <200; r++) // White blast
    {
      fill(q/2, q, q/1, 10);
      rotate(4);
      ellipse(p-100,p-100, 100, 100);
      p = p +.05;
      q = q +20;
    }
    if(p >300)
    {
      p = 0;
    }
    
     for(float g = 2; g <200; g++) //FLASH
    {
      fill(n/2, n, n/12, 20);
      rotate(4);
      ellipse(m-50,m-50, 100, 100);
      m = m +.20; //circles amont
      n = n +20;
    }
    if(m >300)
    {
      m = 0;
      n= 20;
    }
    
    stroke(60, 70, 70, 110);
    for(float condense = 200; condense > 0; condense--) //Black line vortex
    {
      rotate(.5);
      line(x,0, x, 55);
      x = x -.08;
    }
      if( x < 35)
      {
        x=300;
      }
      
      noStroke();
      colorMode(HSB);
      for(float k = 0; k <100; k ++)
      {
      rotate(.5);
      pop = pop+.04;
      out = sin(pop)*2;
      scale(out);
       fill(k*1.3,k*1.1, k*.5, k*3);
      rect( spin, spin, .1, .1);
      spin = spin +.012;
      }
      if(spin <200)
      {
        spin = 0;
      }
}

