
class Keyboard implements KeyEventDispatcher
{
  String txt;

  Keyboard()
  {
    txt = "";
  }

  public boolean dispatchKeyEvent( KeyEvent ke )
  {
    String[] s = split(ke.paramString(), ',' );
    String temp = "";
    for( int i = 0; i < s.length; i++ )
    {
      temp = temp + s[i] + "\n"; 
    }
    txt = temp;
    ke.consume();
    redraw();
    return true;
  }

  void display()
  {
    text( txt, 10, height/3 );
  }
}






