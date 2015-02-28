
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer ressac;

  BeatListener(BeatDetect beat, AudioPlayer ressac)
  {
    this.ressac = ressac;
    this.ressac.addListener(this);
    this.beat = beat;    
  }
  
  void samples(float[] samps)
  {
    beat.detect(ressac.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(ressac.mix);
  }
}

