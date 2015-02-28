
void setup()
{
  size(200,200);
  background(195);
}
void draw()
{
  {
    if(mouseX<=90&&mouseY;>=110)
    {
      drawFace(10,10);
      colourFace(10,10);
    }
    else if(mouseX>=110&&mouseY;>=110)
    {
      drawFace(10,10);
      colourFace(10,10);
    }
    else if(mouseX<=90&&mouseY;<=90)
    {
      drawFace(10,10);
      colourFace(10,10);
    }
    else if(mouseX>=110&&mouseY;<=90)
    {
      drawFace(10,10);
      colourFace(10,10);
    }
    else
    {
      background(195);
    }
  }
}
void drawFace(int inX,int inY)
{
  rect(inX,inY,inX+170,inY+170);//outline of face
  ellipse(inX+55,inY+60,inX+40,inY+60);//left eye
  ellipse(inX+125,inY+60,inX+40,inY+60);//right eye
  triangle(inX+90,inY+130,inX+30,inY+160,inX+150,inY+160);//mouth
}
void colourFace(int inX,int inY)
{
  if (keyPressed)
  {
    if (key=='r')
    {
      fill (255,0,0);
      rect(inX,inY,inX+170,inY+170);
    }
    else if(key=='g')
    {
      fill (0,255,0);
      ellipse(inX+55,inY+60,inX+40,inY+60);
      ellipse(inX+125,inY+60,inX+40,inY+60);
    }
    else if(key=='b')
    {
      fill(0,0,255);
      triangle(inX+90,inY+130,inX+30,inY+160,inX+150,inY+160);
    }
  }
}
