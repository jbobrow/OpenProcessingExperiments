
//Ascoltatore per la classe BeatDetect
class AscoltatoreBeat implements AudioListener{
  private BeatDetect beat;
  private AudioPlayer source;
  
  AscoltatoreBeat(BeatDetect beat, AudioPlayer source){
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps){
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR){
    beat.detect(source.mix);
  }
}

