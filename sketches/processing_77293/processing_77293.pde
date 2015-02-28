

class Button
{
  PFont font;
  String title;
  color bg,word;
  int posx,posy;
  int butWidth,butHeight;
  boolean pressed=false;
  boolean mouseOver=false;
  Button(String _title, color _bg, color _word)
  {
    setting();
    title=_title;
    word=_word;
    bg=_bg;   
  }
  
  Button(String _title, color _bg)
  {
    setting();
    title=_title;
    bg=_bg;   
    word=color(250,250,250);
  }
  
  Button(String _title)
  {
    setting();
    title=_title;
    bg=color(100,10,10);
    word=color(250,250,250);
  }
  
  void setting()
  {
    butWidth=100;
    butHeight=30;
    font=createFont("Helvetica", 12, true);
    textFont(font);
  }
  
  public void Position(int x, int y)
  {
    posx=x;
    posy=y;
  }
  
  public void Display()
  {
    MouseLeaveWithoutReleasedChecking();
    int fontsize;
    if(!pressed)
    {
      fill(bg);
      fontsize=20;
    }
    else
    {
      fill(50);
      fontsize=15;
    }
    noStroke();
    ellipse(posx,posy,butWidth,butHeight);
    fill(word);
    textAlign(CENTER);
    textSize(fontsize);
    text(title,posx,posy+butHeight/4);
    
    //println(bg);
  }
  
  public void Pressed()
  {
    pressed=true;
    println(title+" button pressed");
  }
  
  public void Released()
  {
    pressed=false;
    println(title+" button released");
  }
  
  public void MouseLeaveWithoutReleasedChecking()
  {
    if(pressed && !mouseOver) Released();
    
  }
  
  public void CheckArea(int x, int y)
  {
    if(y>posy-butHeight/2 && y<posy+butHeight/2 && x>posx-butWidth/2 && x<posx+butWidth/2) 
    {
        mouseOver=true;
        word=color(250,250,0);
    }
    else 
    {
      mouseOver=false;
      word=color(250,250,250);
    }
  }
  
  public boolean CheckMouseOver()
  {
    return mouseOver;
  }
}

