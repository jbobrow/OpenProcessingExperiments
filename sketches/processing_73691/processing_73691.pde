
class Button
{
  int x;
  int y;
  String txt;
  int xAdd;
  int yAdd;
  String dbl;
  int h;
  int w;
  
  int l;
  int t;
  int r;
  int b;
    
  Button(int xIn, int yIn, int wIn, int hIn, String txtIn, int xAddIn, int yAddIn)
  {
    x = xIn;
    y = yIn;
    txt = txtIn;
    w = wIn;
    h = hIn;
    xAdd = xAddIn;
    yAdd = yAddIn;
    
    l=x;
    t=y;
    r=x+w;
    b=y+h;
  }
  
  void d()
  {
    if(mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b)
      if(mousePressed)
        fill(175);
      else
        fill(225);
    else
      fill(200);
    rect(x,y,w,h);
    if(mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b)
    {
      if(mousePressed)
      {
        fill(0);
        line(x,y+2,x+(w-2),y+2);
        line(x+(w-2),y+2,x+(w-2),y+h);
        line(x+(w-2),y+2,x+w,y);
        fill(0);
        if(txt.equals("Enter"))
          for(int i = 1; i <= txt.length(); i++)
          {
            text(txt.substring(i-1,i),x+19+xAdd, y+24+yAdd + (i*20));
          }
        else
          text(txt,x+19+xAdd,y+44+yAdd);
      }  
      else
      {
        fill(100);
        if(txt.equals("Enter"))
          for(int i = 1; i <= txt.length(); i++)
          {
            text(txt.substring(i-1,i),x+21+xAdd, y+22+yAdd + (i*20));
          }
        else
          text(txt,x+21+xAdd,y+42+yAdd);
      }
    }
    else
    {
      fill(0);
      if(txt.equals("Enter"))
        for(int i = 1; i <= txt.length(); i++)
        {
          text(txt.substring(i-1,i),x+21+xAdd, y+22+yAdd + (i*20));
        }
      else
        text(txt,x+21+xAdd,y+42+yAdd);
    }
    fill(0);
  }
  
  int getL()
  {
    return l;
  }
  int getT()
  {
    return t;
  }
  int getR()
  {
    return r;
  }
  int getB()
  {
    return b;
  }
  
  boolean isOver()
  {
    if(mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b)
      return true;
    return false;
  }
  
  String getVal()
  {
    return txt;
  }
}

