
void setup()
{
  
 size(400,400);
 background(255);
 smooth();
}
void draw()
{

if (mousePressed)
{

line(pmouseX,pmouseY,mouseX,mouseY);
}

if (keyPressed)
{
  if (key=='d')
  {
    stroke(#FFEB00);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='o')
  {
    stroke(#FF0000);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  

 if (key=='n')
  {
    stroke(#B600FF);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='a')
  {
    stroke(#FFA400);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='t')
  {
    stroke(#00FF15);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='o')
  {
    stroke(#F569FF);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='p')
  {
    stroke(#0009FF);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='e')
  {
    stroke(#653300);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='z')
  {
    stroke(#00FBFF);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
  if (key=='i')
  {
    stroke(#00FFAB);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
}

}
