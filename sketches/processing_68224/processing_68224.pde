
int y=0;
int x=20;
int w;
void setup()
{
   size(600,400);
   smooth();
}
void draw()
{
  frameRate(4);
  background(0);
  if(x<600)
  {
   if(y==0)
   {
     fill(0,0,0);
     arc(x,200,70,70,0,TWO_PI);
     fill(255,255,0);
     arc(x,200,70,70,0.31,5.81);
     fill(255,255,255);
     ellipse(x-10,190,20,20);
     fill(0,0,0);
     ellipse(x-10,195,15,15);
     y=1;
   }
   else
   {
     fill(255,255,0);  
     arc(x,200,70,70,0,TWO_PI);
     fill(255,255,255);
     ellipse(x-10,190,20,12);
     fill(0,0,0);
     ellipse(x-10,195,15,7);
     y=0;
   }
   x+=20;
   w=x;
  }//aqui funciona
  else
  {
      if(w>0)
      {
         if(y==0)
         {
           fill(0,0,0);
           arc(w,200,70,70,0,TWO_PI);
           fill(255,255,0);
           arc(w,200,70,70,0.31,5.81);
           fill(255,255,255);
           ellipse(w-10,190,20,20);
           fill(0,0,0);
           ellipse(w-10,195,15,15);
           y=1;
         }
         else
         {
           fill(255,255,0);  
           arc(w,200,70,70,0,TWO_PI);
           fill(255,255,255);
           ellipse(w-10,190,20,12);
           fill(0,0,0);
           ellipse(w-10,195,15,7);
           y=0;
         }
         w=w-20;
  }
  else
  {
    w=0;
    x=w;
  }
  }
}
