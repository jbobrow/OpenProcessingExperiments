
int shapesize = 1000;
int xval = 250;
int yval = 250;
int xval2 = 250;
int yval2 = 250;
int square = 0;
int size2 = 250;
int size3 = 250;
int Maxlines = 0;

void setup()
{
  size(500,500);
  frameRate(60);
}

void draw()
{
  
  if (square == 0){
  
 stroke(random(0,255),random(0,255),random(0,255));
 fill(175);
 ellipse (xval,yval,shapesize,shapesize);
 ellipse (xval - 250, yval - 250, shapesize ,shapesize);
 ellipse (xval +250, yval +250, shapesize ,shapesize);
 ellipse (xval - 250, yval +250, shapesize ,shapesize);
  ellipse (xval + 250, yval -250, shapesize ,shapesize);
 shapesize -=2;
 
 if (shapesize <= 0 )
 {
   shapesize +=2;
   square = 1;
 }
  }
if (square == 1)
 {
  stroke(random(0,255),random(0,255),random(0,255));
  rect (xval2,yval2,size2,size2);
  rect (0,0,size2,size2);
  rect(250,0,size2,size2);
  rect(0,250,size2,size2);
  size2 -=2;
  
  if(size2 <= 0)
  {
    size2+=2;
    square = 2;
  }
 }
 
 
 if (square == 2)
 {
   if (Maxlines <= 2000)
   {
   strokeWeight(4);
   stroke(random(0,255),random(0,255),random(0,255));
   line(250,250,random(0,500),random(0,500));
   Maxlines += 1;
   }
 }
}

