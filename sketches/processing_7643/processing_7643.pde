
/*kyeehrlich
feb 15 2010
drawing app that makes mutlicolor mirror images*/

void setup()
{
  smooth();
  size(1000,1000);
}

  void draw()
{
  float w = ceil( random(0,255));
   float q = ceil(random(0,255));
    float e = ceil(random(0,255));
    float r = ceil(random(0,10));
    float t = ceil(random(0,10));
  if (key== 'k')
  {
    fill(q,w,e);
  stroke(q,w,e);
  }
 
  if (key== 'x')
{background (random(0,255),random(0,255),random(0,255));
  }
  
  if (mousePressed==true){
  ellipse(pmouseX,pmouseY,r,t);
  ellipse(width-pmouseX,pmouseY,r,t);
 
  }
    
}

