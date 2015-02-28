
class Web
{
  String txt;
  int fontSize; 
  int x, y;
  int speedX;
  color colorVal;

  boolean screenSize;

  PFont myFont;

  Web(String Txt, int FontSize, int X, int Y, int SpeedX, color ColorVal)
  {
    txt = Txt;
    fontSize = FontSize;
    x = X;
    y = Y;
    speedX = SpeedX;
    colorVal = ColorVal;


      if ( x < 0)
    {
      screenSize = !screenSize;
    }
    
    myFont = loadFont("BlackmoorLetPlain-48.vlw");
   // myFont = createFont("BlackmoorLetPlain-48.vlw", fontSize, true);
  }
  void drawweb() {
    fill(colorVal);
    textFont(myFont);
    text(txt, x, y);
    x += speedX;
    if (screenSize == true && x < -(textWidth(txt)))
    {
      x = width;
    }
    else if (screenSize == false && x >width)
    {
      x =  0 - int(textWidth(txt));
    }
  }
}


