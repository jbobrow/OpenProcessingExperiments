
class Tone {
  AudioSample atone;
  
  Tone(int a) {
    String tn = "tone"+a+".wav";
    atone = minim.loadSample(tn,2048);
  }
  
  void playTone() {
    atone.trigger();
  }
  
  void closeTone() {
    atone.close();
  }
}


