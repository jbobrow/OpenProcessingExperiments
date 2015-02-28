
//3A:Boundaries assign

float xpos;
float ypos;
 
void setup()
{
size(600,300);
background(0);
strokeWeight(1);


}
 
void draw()
{
xpos = width/2;
ypos = height/2;
 
//ellipse
stroke(100);

fill(0);
  if (mouseX>=100)
   
    fill(255,0,0);
  {
  }
//movie
rect(xpos-140,ypos-200, xpos-20, ypos+40);
  if(mouseY>=200)
  {
    fill(70,489,18);
  }
  rect(xpos-140,ypos-10, xpos-20, ypos+40);
  if(mouseY>=50)
  {
    fill(0);
    
  }
  {
  ellipse(xpos,ypos+20, 40,40);
  
  }
    {
  ellipse(xpos,ypos+40, 40,40);
  }  {
  ellipse(xpos,ypos+60, 40,40);
  }
   {
  ellipse(xpos,ypos-20, 40,40);
  }
    {
  ellipse(xpos,ypos-40, 40,40);
  }  {
  ellipse(xpos,ypos-60, 40,40);
  }
}




