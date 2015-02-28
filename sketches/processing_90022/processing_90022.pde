
int p=255, q=0;
String userIn = "";
void setup()
{
  size(400,200);
  background(255);
  fill(0);
}
void draw()
{
  drawLines();
}

void drawLines()
{ for(int i = 0; i < width/20; i++)
  {if(i%2==0)
   {stroke(p, 0, 0);
   line(i*20, height/2, i*20+10, height/2);}
   if (i%2 == 1)
   {stroke(q, 0 , 0);
   line(i*20, height/2, i*20+10, height/2);}
   if (mousePressed==true)
  { p=0; q=255;}
   if (mousePressed != true)
   {p=255; q =0;}
   }  
}
