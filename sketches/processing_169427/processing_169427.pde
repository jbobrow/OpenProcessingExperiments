
void setup()
{
size(500,500);
background(#148E0A);
}
void draw()
{
  if (mousePressed)
  {
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if (keyPressed){
if(key=='a')
{
    stroke(#0A698E);
  }
  if(key=='b')
  {
    stroke(#E82305);
} 
if(key=='c')
{
    stroke(#05E8D3);
  }
  if(key=='d')
{
    stroke(#AA05E8);
  }
  if(key=='e')
{
    stroke(#E8058D);
  }
  if(key=='f')
{
    stroke(#4E689B);
  }
  if(key=='g')
{
    stroke(#909B4E);
  }
  if(key=='h')
{
    stroke(#5CC19B);
  }
  if(key=='i')
{
    stroke(#0A5693);
  }
  if(key=='j')
{
    stroke(#E82C87);
  }
  }
}
