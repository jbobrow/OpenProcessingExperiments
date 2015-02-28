
class BandPassEffect implements AudioEffect
{
  BandPass bandpass;
  
  void process(float[] samp)
  {
    
  }
  
  void process(float[] left, float[] right)
  {
    process(left);
    process(right);
  }
}

