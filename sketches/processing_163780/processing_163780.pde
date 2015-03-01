
float[] x = new float[50];

void setup()
{
  size(600,300);
  background(252,245,217);
  frameRate(7);
}

void draw()
{
  background(252,245,217);
  stroke(3,71,255,random(255));
  strokeWeight(random(0,2));
  float t =random(-20,20);
  
    for(int i =0; i<50; i++)
    {
    x[i] = random(600);
    if(key==CODED){
    if (keyCode==DOWN)
     {
       line(x[i]-t,50,x[i]+t,250);
     }
       if (keyCode==RIGHT)
    {
       line(x[i]-t,50,x[i]+t+.50,250);
     }
      if (keyCode==LEFT)
      {
         line(x[i]-t,50,x[i]+t-50,250);
    }       
  }
 }
}

