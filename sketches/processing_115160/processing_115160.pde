
int x;
int y;
void setup()
{
size(600,600);
smooth();
}
void draw()
{ 
  x=0;
  y=0;
  
  for(x=0;x<width;x+=100)
  {
    for (y=0;y<height;y+=110)
    {
       noStroke();
  fill(255,30,40);
    quad(x+50,y+50,x+100,y+75,x+50,y+100,x+0,y+75);
    fill(255,80,90);
    quad(x+100,y+75,x+100,y+135,x+50,y+160,x+50,y+100);
    fill(255,130,140);
    quad (x+0,y+75,x+50,y+100,x+50,y+160,x+0,y+135);
    
    
   
}
  }
}
