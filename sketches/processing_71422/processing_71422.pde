
//Eric T. Computer Programming 1 Mods 4 -5
void setup()
{
  size(1000,1000);
  background(255);
}
void draw()
{
}
int wid = 20;
int leng = 20;
int col1 = 20;
int col2 = 20;
int col3 = 20;
void mouseDragged()
{
  fill(col1-2,col2+3,col3+1);
  if(keyPressed == true && key == 'l')
  {
  stroke(255);
  line(mouseX,mouseY, wid,leng);
  line(500-mouseX,mouseY, wid,leng);
  }
  if(keyPressed == true && key == 't')
  {
    stroke(0);
    triangle(mouseX,mouseY, wid,leng,col1,col2);
  }
  stroke(col1-2,col2+3,col3+1);
  ellipse(mouseX-40,mouseY, 60,30);
  if(keyPressed == true && key == 's')
  {
  ellipse(1000-mouseX,mouseY, 60,30);
  }
  wid = wid + 2;
  leng = leng + 2;
  col1 = col1 + 4;
  col2 = col2 + 2;
  col3 = col3 + 5;
  if(col1 > 200)
  {
    col1 = 0;
  }
  if(col3 > 200)
  {
    col3 = 0;
  }
  if(col2 > 200)
  {
    col2 = 0;
  }
  if(wid > 250)
  {
    wid = 0;
  }
  if(leng > 250)
  {
    leng = 0;
  }
}
