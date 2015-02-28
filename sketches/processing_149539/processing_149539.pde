
int j=1, k=40;
color c;
int x;
float h,s,b,y;
PImage imagen;


void setup()
{
  background(255);
  size (400, 440);
  imagen = loadImage("https://dl.dropboxusercontent.com/u/20674936/coloresVECTOR.gif");
  colorMode (HSB, 255, 255,255);
  frameRate(5);
}

void draw()
{
  
  for(int i=0; i<11; i++)
  {
    c = imagen.get(20,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(0,i*40,k,k);
    
    
    c = imagen.get(60,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(40,i*40,k,k);
    
    
    c = imagen.get(100,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(80,i*40,k,k);
    
    
    c = imagen.get(140,20+(i*40));
    float h = hue(c);
    float s = saturation(c);
    float b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(120,i*40,k,k);
    
    
    c = imagen.get(180,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(160,i*40,k,k);
    
    
    c = imagen.get(220,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(200,i*40,k,k);
    
    
    c = imagen.get(260,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(240,i*40,k,k);
    
    
    c = imagen.get(300,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(280,i*40,k,k);
    
    
    c = imagen.get(340,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(320,i*40,k,k);
    
    
    c = imagen.get(380,20+(i*40));
    h = hue(c);
    s = saturation(c);
    b = brightness(c);
    if (h+x>255)
    {
      y = h-(255-x);
    }
    else
    {
      y = h+x;
    }
    fill(y,s,b);
    rect(360,i*40,k,k);
  }
  
  x++;
  if(x>255)
  {
    x=0;
  }
}
