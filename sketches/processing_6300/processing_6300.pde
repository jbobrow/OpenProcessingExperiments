
/**
Kindergarden Boad weeeeee! :D
My creativty is beter than yours.
 */
 
int x= pmouseX; 
int y= mouseY; 
int x1= pmouseX; 
int y2= mouseY; 
int r=255;
int g=0;
int b=0;


void setup() 
{
  size(800, 400);
  background(255,165,0);
  stroke(102);
  smooth();
  strokeWeight(10);
}

void draw() {
  stroke(r,g,b);
  
  //line
  if(mousePressed) {
  rect(mouseX, mouseY, pmouseX, pmouseY);
  }

  //color
  if ( r== 255 )
  {
    r=0;
    g=255;
  }
  else if (g == 255)
  {
    g=0;
    b= 255;
  }
    else if (b == 255)
  {
    b=0;
    r=255;
  }


}

