
// this is a really straightforward effect that just adds a composite sine wave signal to the sound sample
class CustomEffect implements AudioEffect
{
  void process(float[] samp)
  {
    float[] newsamp = new float[samp.length];
    for (int j = 0; j < samp.length ; j++)
    {
      newsamp[j] = samp[j]*0.625+sin(PI*j/64)*0.125+sin(PI*j/128)*0.125+sin(PI*j/256)*0.125;
    }
    // we have to copy the values back into samp for this to work
    arraycopy(newsamp, samp);
  }
  
  void process(float[] left, float[] right)
  {
    process(left);
    process(right);
  }
}
  

