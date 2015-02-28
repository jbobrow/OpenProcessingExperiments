
float xpos;
float ypos;

void setup()
{
size(500,500);
background(0);
}

void draw()
{
xpos = width/2;
ypos = height/2;

/*outside circ*/
stroke(255);
strokeWeight(2);
fill(0);
  if (mouseX>=300)
  
    fill(255,255,0);
  {
    ellipse(xpos,ypos, 250,250);
  }
/*inner "p"*/
line(xpos-30,ypos-40, xpos-30, ypos+40);
  if(mouseY>=300)
  {
    fill(255,0,0);
  }
  {
  ellipse(xpos,ypos-20, 40,40);
  }
 

}

