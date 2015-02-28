
void setup()
{
  size(600,600);
}

void draw()
{
  for(int i=0;i<width;i+=80)
  {
   
   if(i%10==0)
   {
     fill(255,255,255,1);
     ellipse(mouseX,mouseY,random(600),random(600));
   }
   
   ellipse(random(600),random(600),20,20);
}
}




