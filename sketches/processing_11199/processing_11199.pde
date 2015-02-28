
class CustomEffect implements AudioEffect
{
  void process(float[] samp)
  {
    float[] newsamp = new float[samp.length];
    for (int j = 0; j < samp.length ; j++)
    {
      newsamp[j] = samp[j]; //newsamp[j] = samp[j]*0.625+sin(PI*j/64)*0.125+sin(PI*j/128)*0.125+sin(PI*j/256)*0.125;
    }
 
    arraycopy(newsamp, samp); // we have to copy the values back into samp for this to work
  }
  
  void process(float[] left, float[] right)
  {
    process(left);
    process(right);
  }
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

