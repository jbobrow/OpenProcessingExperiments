
class Controler
{
  boolean doDraw = true;
  ArrayList <GUIELEMENT> g;
  PFont font;
  int fontSize;
  int ActiveID = -1;
  int ax, ay, aw, ah;

  Controler (String fontName, int fontSize, color c)
  {
    font = createFont (fontName, fontSize);
    this.fontSize = fontSize;
    g = new ArrayList();
    ax = ay = 0;
    aw = ah = 20;
  }

  void setActiveArea (int x, int y, int w, int h)
  {
    ax = x;
    ay = y;
    aw = w;
    ah = h;
  }
  
  void setValueAtID (int id, int value)
  {
    g.get (id).setValue (value);
  }

  void addGUIElement (SimpleButton btn)
  {
    g.add (btn);
  }

  void addGUIElement (SimpleSlider sli)
  {
    g.add (sli);
  }

  int activateWhileHover (int mx, int my, boolean mouseIsPressed)
  {
    int value = -1;
    ActiveID = -1;

    for (int i = 0; i < g.size(); i++) g.get(i).setNotHover();

    if (doDraw)
    {
      for (int i = 0; i < g.size(); i++) 
      { 
        if (g.get(i).checkHover (mx, my))
        {
          ActiveID = i;
          g.get (i).setHover();
          value = g.get(i).activate(mx, my, mouseIsPressed);
          break;
        }
      }
    }
    return value;
  }
  
  void checkHover (int mx, int my, boolean mouseIsPressed)
  {
    if (mx >= ax && mx <= ax+aw && my >= ay && my <= ay+ah) doDraw = !doDraw;
  }

  void checkHover (int mx, int my)
  {
    ActiveID = -1;

    for (int i = 0; i < g.size(); i++) g.get(i).setNotHover();

    if (doDraw)
    {
      for (int i = 0; i < g.size(); i++) 
      { 
        if (g.get(i).checkHover (mx, my))
        {
          ActiveID = i;
          g.get (i).setHover();
          break;
        }
      }
    }
  }

  void draw ()
  {
    noStroke();
    fill (180);
    rect (ax, ay, aw, ah);
    if (doDraw)
    {
      textFont (font, fontSize);
      for (int i = 0; i < g.size(); i++) g.get(i).draw();
    }
  }
}

class GUIELEMENT
{
  boolean isHover = false;
  color c1, c2, c3;
  int x, y, w, h;
  String txt;

  GUIELEMENT (int x, int y, int w, int h, String txt, color c1, color c2, color c3)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.txt = txt;
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
  }
  
  void setValue (int value)
  {
  }

  void setNotHover ()
  {
    isHover = false;
  }

  void setHover ()
  {
    isHover = true;
  }

  boolean checkHover (int mx, int my)
  {
    if (mx >= x && mx <= x+w && my >= y && my <= y+h) return true;
    else return false;
  }

  int activate (int mx, int my, boolean mouseIsPressed)
  {
    return -1;
  }

  void draw ()
  {
  }
}

class SimpleSlider extends GUIELEMENT
{
  int minVal, maxVal, cVal;

  SimpleSlider (int x, int y, int w, int h, String txt, color c1, color c2, color c3, int minVal, int maxVal, int cVal)
  {
    super (x, y, w, h, txt, c1, c2, c3);
    this.minVal = minVal;
    this.maxVal = maxVal;
    this.cVal = cVal;
  }
  
  void setValue (int value)
  {
    cVal =value;
  }

  boolean checkHover (int mx, int my)
  {
    return super.checkHover(mx, my);
  }

  int activate (int mx, int my, boolean mouseIsPressed)
  {
    if (mouseIsPressed)
    {
      cVal = (int) map (mx, x, x+w, minVal, maxVal);
    }

    return cVal;
  }

  void draw ()
  {
    fill (c1);
    noStroke ();
    rect (x, y, w, h);

    if (!isHover) fill (c2);
    else fill (c3, 100);

    rect (x, y, map (cVal, minVal, maxVal, 0, w), h);

    textAlign (LEFT, CENTER);
    fill (c3);
    text (txt + ": " + str (cVal), x+10, y+h/2.5);
  }
}

class SimpleButton extends GUIELEMENT
{
  SimpleButton (int x, int y, int w, int h, String txt, color c1, color c2, color c3)
  {
    super (x, y, w, h, txt, c1, c2, c3);
  }

  boolean checkHover (int mx, int my)
  {
    return super.checkHover(mx, my);
  }

  void draw ()
  {
    if (!isHover) fill (c1);
    else fill (c2);
    noStroke ();
    rect (x, y, w, h);

    textAlign (LEFT, CENTER);
    fill (c3);
    text (txt, x+10, y+h/2.5);
  }
}


