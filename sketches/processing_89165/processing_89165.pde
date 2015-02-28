
import netscape.javascript.*;

void setup()
{
  size(200,200);//size of sketch
}
void  draw()
{
  if((mouseX> width/2 + 10) || (mouseX<=width/2-10)) //animates shape and allows the user to move it around the screen with the cursor
  {
    background(0); //black background
    fill(255,255,0);//colors shape yellow
    stroke(0);//outline to shape
    rect(mouseX-10,mouseY-10,30,30);//size of rectngle
    fill(255,0,0);//colors shapes red
    stroke(0);//outline to shape
    ellipse(mouseX-0,mouseY-0,5,5);//size of ellipse 1
    ellipse(mouseX+10,mouseY+0,5,5);//size of ellipse 2
    fill(0,0,255);//colors triangle blue
    stroke(0);//outline
    triangle(mouseX-1,mouseY+5,mouseX+5,mouseY-0,mouseX+10,mouseY+5);//sizes of triangle
    
  }
  else
  {
    background(0);//when the cursor is in the middle of the screen no shape appears and the window is black
  }
}
  
  

