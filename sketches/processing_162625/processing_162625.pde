
int w = 850;
int h = 850;
int r = 5;
int xVal = 5;
int yVal = 5;
void setup()
{
size(w,h);
background(120,50,180);
noStroke();
frameRate (30);
}
 
void draw()
{
  
for(int y = -250; y < h+250; y = y+50) 
{
  fill(250,200,50);
  for (int x = -250; x < w+250; x = x+50)
{ 
  rect (x+xVal, y+yVal, r, r);
}
}

}


void keyPressed()
{

   if(key=='=')
   {
      r = r + 1;
      background(120,50,180);
   }
    if(key=='-')
   {
      r = r - 1;
      background(120,50,180);
   }
    if(key=='a')
   {
      xVal = xVal - 10;
      //background(120,50,180);
   }
    if(key=='d')
   {
      xVal = xVal + 10;
     // background(120,50,180);
   }
     if(key=='w')
   {
      yVal = yVal - 10;
      //background(120,50,180);
   }
     if(key=='s')
   {
      yVal = yVal + 10;
      //background(120,50,180);
   }
   if(key=='z')
   {
     background(120,50,180);
   }


}

