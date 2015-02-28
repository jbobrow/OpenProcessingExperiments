
/*
 * PluckedString
 * calculates/generates plucked string sound thru digital waveguides
 * 
 * (plucking algorithm adapted from here, credit to dan ellis:                             ) 
 * (http://www.ee.columbia.edu/~dpwe/resources/Processing/plucked_string.pde               )
 */
 
class PluckedString implements AudioSignal
{
  int wg_length;
  float[] y_plus;
  float[] y_minus;
  float[] y;

  float[] reflec_filt  = {.25, .49, .25};
  int ref_hlen;
  boolean active;
  
  PluckedString(float freq, float ampl)
  {
    wg_length = Math.round(out.sampleRate()/freq/2);
    ref_hlen = (reflec_filt.length-1)/2;
    y_plus = new float[wg_length+ref_hlen];
    y_minus = new float[wg_length+ref_hlen];
    y = new float[wg_length];
    out.addSignal(this);
  }
  
  void pluck(float pluck_point, float sharpness)
  {
    active = false;
        
    float exponent = (float)Math.pow(2.0, 6*sharpness);
    float pluck_amp = 1.0;
    for (int i = 0; i < wg_length; ++i) {
      if (i < Math.round(pluck_point * (float)wg_length)) {
        y_minus[i] = y_plus[i] = (float)Math.pow(pluck_amp*(float)i/(pluck_point*(float)wg_length), exponent);
      } else {
        y_minus[i] = y_plus[i] = (float)Math.pow(pluck_amp*(float)(wg_length-i)/((1-pluck_point)*(float)wg_length), exponent);
      }
    }
  }
  
  void release() {
    active = true;
  }
  
  void generate(float[] samps)
  {
    for(int i = 0; i < samps.length; ++i) 
    {
      float y_reflec = 0;
      if (active == true)
      {
        for (int j = y_plus.length-1; j > 0; --j)  {
          y_plus[j] = y_plus[j-1];
        }
        for (int j = 0; j < y_plus.length-1; ++j) 
        {
          y_minus[j] = y_minus[j+1];
        }
        y_plus[0] = -y_minus[0];
        for (int k=0; k < reflec_filt.length; ++k)
        {
          y_reflec += reflec_filt[k] * y_plus[wg_length - 1 - ref_hlen + k];
        }
        y_minus[wg_length - 1] = -y_reflec;
      }
      samps[i] = y_reflec;
    }
  }
  
  void generate(float [] sampL, float [] sampR)
  {
    generate(sampL);
    System.arraycopy(sampL, 0, sampR, 0, sampR.length);
  }
}


