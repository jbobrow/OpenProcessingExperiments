
// this signal uses the mouseX and mouseY position to build a signal
class MouseSaw implements AudioSignal
{
  
  int mx, my;
  
  void setMx( int x )
  {
    mx = x;
  }
  
  void setMy( int y )
  {
    my = y;  
  }
  
  void generate(float[] samp)
  {
    float range = map(mx, 0, width, 0, 1);
    float peaks = map(my, 0, height, 1, 20);
    float inter = float(samp.length) / peaks;
    for ( int i = 0; i < samp.length; i += inter )
    {
      for ( int j = 0; j < inter && (i+j) < samp.length; j++ )
      {
        samp[i + j] = map(j, 0, inter, -range, range);
      }
    }
  }
 
  // this is a stricly mono signal
  void generate(float[] left, float[] right)
  {
    generate(left);
    generate(right);
  }
}

