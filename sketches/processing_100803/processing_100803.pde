
public void setup()
{
    size(480,320) ;
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
  stroke(60/m);
  line(width/s*i,0,width/s*i,height);
 }

   text(s,width/2,height/2);
   

     
}
