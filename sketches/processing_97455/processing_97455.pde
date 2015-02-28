
float xoff = 0.0;

int val, valInc = 10;

float[] tab1;

void setup()
{
 size(500,500, P2D); 
 smooth();
 
 tab1 = new float[width/5];
 
 frameRate(15);
 
 val = 150;

}

void draw() 
{
  background(30);
  
  strokeWeight(1);
  stroke(255, 150);
  
 if ((val>380) ||  (val <150))
   valInc = -valInc;
 
 val += valInc;
   
  for (int xn = 100; xn < width-100; xn+=5)
  {
    xoff = xoff + .01;
    float n = noise(xn+xoff)* val;
    
    tab1[int(xn/5)] = n;
    
  }
  
   for (int xn = 100; xn < width-100; xn+=5)
  {
    stroke(0, 120, 180);
    line(xn, height/2-20-tab1[int(width/5-1-xn/5)]/2, xn, 20+tab1[int(width/5-1-xn/5)]/2);
    line(xn, height/2+20+tab1[int(xn/5)]/2, xn, height-20-tab1[int(xn/5)]/2);
    
    stroke(0, 180, 120);
    line(xn, 0+tab1[int(width/5-1-xn/5)]/8, xn, tab1[int(width/5-1-xn/5)]/2);
    line(xn, height-tab1[int(xn/5)]/8, xn, height-tab1[int(xn/5)]/2);
    
    
  }
  
}
