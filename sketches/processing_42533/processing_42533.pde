
float preMillis;
float thresh=1000;
float x=0;
float lastS;

void setup()
{
size(500,500);
background(0);
smooth();
noStroke();
fill(255,30);
}
void draw()
{
//  translate(33,66);
//  
if(millis() - preMillis>=thresh)
{
  scale(x);
  x+=0.5;
  ellipse(4,2,20,20);
    
    preMillis=millis();
    
  if(second() - lastS>0)
  {
  println(hour()+":"+minute()+":"+second());  }
  lastS=second();
  }
  }




