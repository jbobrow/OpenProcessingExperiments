
// Copyroght by Diana Lange
// www.diana-lange.de

// Inspired by Vera Molnar's 144 Trapezes
// http://www.dam.org/artists/phase-one/vera-molnar/artworks-bodies-of-work/144-trap-zes

int RESX = 12, RESY = RESX;
int PADD = 20, MAR = 50;
int RANDOMSEEDNUM = 1;
float randomnessX = 1.0, randomnessY = 0.0;
Controler c;

void setup ()
{
  size (600, 700);
  smooth();
  c = new Controler ("Arial", 16, color (150));
  c.setActiveArea(0, height-20, 20, 20);
  c.addGUIElement (new SimpleSlider (20, 620, 180, 20, "Randomness X", color (220), color (121, 195, 229), color (5), 0, 6, randomnessX));
  c.addGUIElement (new SimpleSlider (20, 660, 180, 20, "Randomness Y", color (220), color (121, 195, 229), color (5), 0, 6, randomnessY));
  c.addGUIElement (new SimpleSlider (220, 620, 180, 20, "Margin", color (220), color (121, 195, 229), color (5), 0, width/3, MAR));
  c.addGUIElement (new SimpleSlider (220, 660, 180, 20, "Padding", color (220), color (121, 195, 229), color (5), 0, 80, PADD));
    c.addGUIElement (new SimpleSlider (420, 620, 180, 20, "X Resolution", color (220), color (121, 195, 229), color (5), 1, 50, RESX));
  c.addGUIElement (new SimpleSlider (420, 660, 180, 20, "Y Resolution", color (220), color (121, 195, 229), color (5), 1, 50, RESX));
  c.addGUIElement (new SimpleButton (200, height-20, 20, 20, "<", color (220), color (121, 195, 229), color (5)));
  c.addGUIElement (new SimpleButton (400, height-20, 20, 20, ">", color (220), color (121, 195, 229), color (5)));
}

void draw ()
{
  background (255);
  noFill();
  stroke (0);
  drawTrapezes(600, 600);
  stroke (0);
  line (0, 600, width, 600);
  c.draw();
}

void drawTrapezes (int W, int H)
{
  float w = (float) (W -(PADD*(RESX-1))-2*MAR) / (float) RESX;
  float h = (float) (H -(PADD*(RESY-1))-2*MAR) / (float) RESY;

  float x, y;

  randomSeed (RANDOMSEEDNUM);
  for (int i = 0; i < RESY; i++)
  {

    y = MAR + h*i + PADD*i; 
    for (int j = 0; j < RESX;j++)
    {
      x = MAR + w*j + PADD*j;

      beginShape();
      vertex (x+random (-W/20.0*randomnessX, W/20.0*randomnessX), y + random (-H/20*randomnessY, H/20*randomnessY));
      vertex (x+w+random (-W/20.0*randomnessX, W/20.0*randomnessX), y + random (-H/20*randomnessY, H/20*randomnessY));
      vertex (x+w+random (-W/20.0*randomnessX, W/20.0*randomnessX), y+h+ random (-H/20*randomnessY, H/20*randomnessY));
      vertex (x+random (-W/20.0*randomnessX, W/20.0*randomnessX), y+h+ random (-H/20*randomnessY, H/20*randomnessY));
      endShape(CLOSE);
    }
  }
}

void mousePressed ()
{
  switch (c.ActiveID)
  {
  case 0: 
    randomnessX = c.activateWhileHover (mouseX, mouseY, true);
    break;
  case 1: 
    randomnessY = c.activateWhileHover (mouseX, mouseY, true);
    break;
  case 2: 
    MAR = (int) c.activateWhileHover (mouseX, mouseY, true);
    break;
  case 3: 
    PADD = (int) c.activateWhileHover (mouseX, mouseY, true);
    break;
  case 4: 
    RESX = (int) c.activateWhileHover (mouseX, mouseY, true);
    break;
  case 5: 
    RESY = (int) c.activateWhileHover (mouseX, mouseY, true);
    break;    
      case 6: 
    RANDOMSEEDNUM--;
    break;
          case 7: 
    RANDOMSEEDNUM++;
    break;

  default:
    c.checkHover(mouseX, mouseY, true);
    break;
  }
}

void mouseMoved ()
{
  c.checkHover (mouseX, mouseY);
}


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
 
  float activateWhileHover (int mx, int my, boolean mouseIsPressed)
  {
    float value = -1;
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
  /*
  int activate (int mx, int my, boolean mouseIsPressed)
  {
    return -1;
  }*/
  
  float activate (int mx, int my, boolean mouseIsPressed)
  {
    return -1;
  }
 
  void draw ()
  {
  }
}
 
class SimpleSlider extends GUIELEMENT
{
  float minVal, maxVal, cVal;
 
  SimpleSlider (int x, int y, int w, int h, String txt, color c1, color c2, color c3, float minVal, float maxVal, float cVal)
  {
    super (x, y, w, h, txt, c1, c2, c3);
    this.minVal = minVal;
    this.maxVal = maxVal;
    this.cVal = cVal;
  }
   
  void setValue (float value)
  {
    cVal =value;
  }
 
  boolean checkHover (int mx, int my)
  {
    return super.checkHover(mx, my);
  }
 
  float activate (int mx, int my, boolean mouseIsPressed)
  {
    if (mouseIsPressed)
    {
      cVal = map (mx, x, x+w, minVal, maxVal);
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
    text (txt + ": " + nf (cVal, 1, 2), x+10, y+h/2.5);
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
    text (txt, x+5, y+h/2.5);
  }
}
