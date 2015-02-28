
//Hanson T., Animations, Cp1 16/17
//http://hansonscp.comoj.com/Animations.html
int w=10;
int changew=1;
int x=0;
float white=0;
void setup()
{
  size(300,300);
  background(0,0,0);
  frameRate(1000);
}
void draw()
{
  ellipse(225,225,w,w);
  w=w+changew; 
  if (w>150)
  {
    changew=-1;
  }
  if(w<0)
  {
   changew=1;
  }
  ellipse(75,75,w,w);
  if(w>150)
  {
   changew=-2;
  }
  if(w<1)
  {
    changew=2;
  } 
  ellipse(75,225,w,w);
  if(w>150)
   {
   changew=-2;
  }
  if(w<1)
  {
    changew=2;
  }
  ellipse(225,75,w,w);
  if(w>150)
   {
   changew=-2;
  }
  if(w<1)
  {
    changew=2;
  } 
}
