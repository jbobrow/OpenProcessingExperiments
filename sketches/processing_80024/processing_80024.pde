
public void setup()
{
    size(320,480) ;
    frameRate(2);
}

public void draw()
{
   
   int s = second();
   int m = minute();
   int h = hour();
   background(255-200*h/24);
   
for(int i=0;i<s;i++)
 {
  stroke(60/s);
  line(width/s*i,0,width/s*i,height);
 }

   
for(int i=0;i<m;i++)
 {
  stroke(1);
  line(0,height/m*i,width,height/m*i);
 }
     
}
