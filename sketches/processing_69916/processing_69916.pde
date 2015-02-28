
//Stanley L, programing1,6
//www.cupnoodles.webs.com
int x=0;
int y=5;
void setup()
{
  size(1000, 1000);
  frameRate(50);
  
}

void draw()
{
  noFill();
  drawPattern();
  if(x>5000){
  x=-5;}
}
void drawPattern()
{
  stroke(x+y,x+y,x+y,50);
  
  ellipse(500,500,x,y);
  
  translate(500,500);
  ellipse(x, 500-x, 20, 20);
  ellipse(x, x, 20, 20);
  line(x, 0, 0, 500-x);
  line(x-5, 495-x, 0, 0);
  line(x, 500, 500, 500-x);
  line(x+5, 505-x, 500, 500); 
  
  rotate(PI/2);
  ellipse(x, 500-x, 20, 20);
  ellipse(x, x, 20, 20);
  line(x, 0, 0, 500-x);
  line(x-5, 495-x, 0, 0);
  line(x, 500, 500, 500-x);
  line(x+5, 505-x, 500, 500);
 
  
    rotate(PI/2);
  ellipse(x, 500-x, 20, 20);
  ellipse(x, x, 20, 20);
  line(x, 0, 0, 500-x);
  line(x-5, 495-x, 0, 0);
  line(x, 500, 500, 500-x);
  line(x+5, 505-x, 500, 500);
  
    rotate(PI/2);
  ellipse(x, 500-x, 20, 20);
  ellipse(x, x, 20, 20);
  line(x, 0, 0, 500-x);
  line(x-5, 495-x, 0, 0);
  line(x, 500, 500, 500-x);
  line(x+5, 505-x, 500, 500);
  x=x+y;
 
  if(x>500)
  {
    y=y-5;
  }
   if(x<0)
  {
    y=y+5;
  }
}
