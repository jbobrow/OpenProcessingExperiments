



void setup()
{
 size(640,480);
 background(255255255);
 smooth();
  
}
 
  void draw()
{
  float w = ceil(0);
   float q = ceil(200);
    float e = ceil(10);
    float r = ceil(1);
    float t = ceil(1);
  if (key== 'k')
  {
    fill(q,w,e);
  stroke(q,w,e);
  }
  
   
  if (mousePressed==true){
  ellipse(pmouseX,pmouseY,r,t);
  line(width-pmouseX,pmouseY,r,t);
  
  }
     
     
     
}


