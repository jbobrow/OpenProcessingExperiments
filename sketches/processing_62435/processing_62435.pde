

class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;

  WaveformRenderer()
  {
    left = null; 
    right = null;
  }

  synchronized void samples(float[] samp)
  {
    left = samp;
  }

  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }

  synchronized void draw()
  {
    if ( left != null && right != null )
    {
      noFill();
      stroke(255);
      {
        for ( int i = 0; i < left.length; i+=20)
          point(i, height/4+left[i]*50);
      }
    }
  }
}


