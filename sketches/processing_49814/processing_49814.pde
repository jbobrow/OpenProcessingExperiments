
class LSystem
{
  private RuleLib rl;
  private String s;
  LSystem (RuleLib rl, int it)
  {
    this.rl = rl;
    iterate (it);
  }

  public String getLSystem ()
  {
    return s;
  }

  private void iterate (int num)
  {
    String ts = rl.start;
    s = ts;
    for (int i = 0; i < num; i++)
    {
      int j = 0;
      while (j < ts.length ())
      {
        char c = ts.charAt (j);

        if (c != '[' && c != ']' && c != '-' && c!= '+')
        {
          String sc = str (c);
          for (int k = 0; k < rl.getRulz().length; k++)
          {
            if (sc.equals (rl.getRulz() [k].l))
            {
              if (ts.length() > 1)
              {
                String subbef = ts.substring (0, j);
                String subaft = ts.substring (j+1, ts.length());
                ts = subbef + rl.getRulz() [k].r + subaft;
                j+= rl.getRulz() [k].r.length()+1;
                k = rl.getRulz().length;
              }
              else 
              {
                ts = rl.getRulz() [k].r;
                j = ts.length();
                k = rl.getRulz().length;
              }
            }
          }
        }
        j++;
      }
      s = ts;
    }
  }
}


