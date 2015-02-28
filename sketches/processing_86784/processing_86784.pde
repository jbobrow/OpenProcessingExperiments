
/*
Homework 3
copyright 2013 Sahana Kumar
*/

float x, y, wd, ht;
PImage img;

void setup()
{
    size( 400, 400 );  // window size
    smooth( );
  
   x = width;
   y = height;
   wd = width * .1;
   ht = height *.1;
   img = loadImage("doggy.png");
   
}
void draw( )

{
  float one = map( mouseX, 0, height, 0, 200);
 float two = map((mouseY-10), 0,  width, 0, 400);
 rect( 1,1, width, height);
 fill (random(255),random(255),random (255));
 x=random(width);
 y= random(height);
 image ( img, two, one, mouseX, mouseY);
   

 
  
}



