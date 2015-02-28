
class Form
{
  int xpos; //x-posiiton
  int ypos; //y-position
  boolean follow = false; //to check if this Form has to follow the mouse

  int symbol; //0= image a, 1=image b, 2=image c

  Form(int symbol, int x, int y) 
  {
    this.symbol = symbol;
    this.xpos = x;
    this.ypos = y;
  }

  void display() 
  {
    if(follow)
    {
      xpos = mouseX;
      ypos = mouseY;
    }
    image(pictures[symbol], xpos, ypos);
  }

  void changeSymbol()
  {
    if(symbol<pictures.length-1)
    {
      symbol++;
    }
    else
    {
      symbol = 0;
    }
  }

  void sound() //gives the sound of this symbol if the cursor has the same x-position like the symbol
  {
    if (n==xpos) 
    {
      if(ypos<=200) AudioSamples[symbol][0].trigger();
      else if (ypos<=400) AudioSamples[symbol][1].trigger();
      else if (ypos<=600) AudioSamples[symbol][2].trigger();
    }
  }
}


