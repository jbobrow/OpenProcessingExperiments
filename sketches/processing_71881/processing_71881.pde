
//Matt Dawson
//HW 4
//Copyright Matt Dawson Carnegie Mellon University 9/10/12

//press any key to make graphic display negative

float x,y,c,c2;
void setup()
{
  size(1200,600);
  smooth();
  background(0,0,0);
  x=100;
  y=100;
 
 stroke(255,255,255);
}

void draw()
{ 
  background(0);
    fill(0,random(256),random(256));
   stroke(255); 
   ellipse(mouseX,mouseY,random(2,100),random(2,100));
   
   line(mouseX,mouseY,random(0,width),random(0,height));
   if( keyPressed)
{  
   c=random(256);
   c2=random(256);
   background(255,255,255);
   fill(c,c2,0);
   ellipse(mouseX,mouseY,random(2,100),random(2,100));
   stroke(0,0,0);
   line(mouseX,mouseY,random(0,width),random(0,height));
} 
  
}


