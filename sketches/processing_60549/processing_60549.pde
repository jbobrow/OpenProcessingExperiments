
void setup()
 
{size(400, 400);
  smooth();
  rectMode(CENTER);
  background(16,57,12);}
  
 
void draw()
 
{if(mousePressed)
 
{stroke(250,66);
    fill(20,98,14);
 ellipse(width/2, height/2, mouseX, mouseY);}
   
 else
  
 {stroke(#FFFFFF,15);
noFill ();
    ellipse(width/2, height/2,mouseX,mouseY);}}
