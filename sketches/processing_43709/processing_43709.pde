
int rectsize = 0;

//positions of the rectangles
int pos = 0;
int pos2 =0;

void setup ()
{
  size(600,400);
  //my preference to work with this colour mode-it's juste easier
  colorMode(HSB,100);
  background(0,0,0);
}

void draw ()
{
  
  rectsize = mouseX-mouseY;
  
  //calculating the color in dependence of the mouse position
  int h= int (map(mouseX,0,width,0,100));
  int h2= int (map(mouseY,0,height,0,100));
  fill(h,100,100);
  //draw the firs two rectangles
  rect(width/2,0,rectsize,15);
  rect(0,15,abs(rectsize),25);
  
  //loop function to draw the reminding rectangles
  for(int ctr=0;ctr<height;ctr=ctr+30)
   {
  pos =ctr +30;
  pos2 =ctr+40;  
  rect(width/2,pos,rectsize,15);
  rect(0,pos2,abs(rectsize),25);
  fill(h2,100,100);
  rect(pos,0,15,rectsize);
  rect(pos2,height/2,20,rectsize);
 
}


}

