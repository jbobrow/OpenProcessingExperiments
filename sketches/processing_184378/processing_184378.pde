
/*-----------------------------
Changing Box
Depending on where your mouse is on the box it will switch the colors

Created February 4, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 5, 2015

project URL
-----------------------------*/


//Setting up the Sketch
void setup()
{
  //Size of the page
  size(900,600);
}

int a=255;
int b=220;

//drawing of the rectangle
void draw()
{
  background(0);  
  rectMode(CORNER); 
  float X = width/1.5;
  float Y = height/1.6;
  float x = -1*width/3;
  float y = -1*height/4; 
  fill(a,0,0); 
  rect(X,Y,x,y);
  fill(0,b,a);
  rect(X,Y,x/2,y);
  
  if (((width/1.5 > mouseX) && ( mouseX > width/2)) && ((height/1.6 > mouseY) && (mouseY > height/2.7))) 
    {
      fill(a,0,0);   
      rect(X,Y,x/2,y);
      fill(0,b,a);
      rect(X/1.334,Y,x/2,y);
    }

}

