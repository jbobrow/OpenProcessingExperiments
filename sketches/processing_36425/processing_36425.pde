
float a=150;
float b=150;
float c=255;

void setup()
{
  
  size(700,400);
  background(255);
  stroke(0);
  
  }

void draw()
{
  background(0);
  stroke(0);
fill(c);
   if(dist(a,b,mouseX,mouseY)>105)
  c=255;
  ellipse(a,b,20,20);
  
  
if(dist(a,b,mouseX,mouseY)<100) {
  {  a=a-(mouseX-a)/15;
      b=b-(mouseY-b)/15;
  
  
  
}
if(dist(a,b,mouseX,mouseY)<100){
  c=0;
  
}
}
}

