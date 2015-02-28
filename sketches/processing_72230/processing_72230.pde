
int x=150;
int y=150;
int moveX=150;
int moveX2=175;
int x2=175;
int x3=200;
int y2=150;
int y3=150;
int textX=25;
int textY=0;
int fade=250;
void setup()
{
  size(300, 300);
  strokeWeight(5);
}
void draw()
{ 
  back();
  keytyped();
}
void back()
{
  fill(0, 0, 0, fade);
  rect(0, 0, 300, 300);
}
void keytyped()
{ 
  fill(x, y, 0);
  if (key=='s')
  {
    fade=25;
    line(x, 100+y, x, y);
    ellipse(x, y, 50, 50);
    line(50+x2, 50+y2, 50+x2, 150+y2);
    ellipse(50+x2, 50+y2, 50, 50);
    line(100+x3, 100+y, 100+x3, 175+y);
    ellipse(100+x3, 100+y, 50, 50);
    stroke(255);
    x=x+int(random(-6, 5));
    y=y+int(random(-10, 5));
    x2=x2+int(random(-6, 5));
    y2=y2+int(random(-10, 5));
    x3=x3+int(random(-6, 6));
    if (x>300)
    {
      x=0;
    }
    if (x<0)
    {
      x=300;
    }
    if (y<0)
    {
      y=250;
    }
    if (y>300)
    {
      y=0;
    }
  }
  else
  {
      fade=fade;
      textSize(35);
      textAlign(CENTER);
      fill(textX, 255, textY);
      text("press s to start", 150+textX, 150+textY);
    if (textX<150 && textX >-150)
    {
      textX=textX+int(random(-6, 5));
    }
    else
    {
      textX=0;
    }
    if (textY<150 && textY>-150)
    {
      textY=textY+int(random(-6, 5));
    }
    else
    {
      textY=0;
    }
    
  }
}

