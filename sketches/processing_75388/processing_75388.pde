
//Jordan Leung 4,5 Computer Programing 
PImage img;
PImage imgg;
int x= 0;
int y= 0;
void setup()
{
  size(420,500);
  img=loadImage("piggy.jpg");
}

void draw()
{

}

void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    
  fill(126,243,255);
  rect(0,0,550,550);
    image(img,x,y);
   int move= int (random(0,4));
    if(move==0)
    {
      x=x+10;
    }
   else if(move==1)
    {
      x=x-10;
    }
  else if(move==2)
  {
    y=y+10;
  }
  else
  {
    y=y-10;
  }
  
  }  
 if (x>300 || y>300 ||y<-100) 
  {
   imgg=loadImage("YOUUU.jpg");
  image(imgg,0,0); 
}


}
