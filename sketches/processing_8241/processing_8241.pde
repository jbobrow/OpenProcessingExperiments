
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
FFT fftLog;
 
void setup() {
  size(512, 300, P3D);

  minim = new Minim(this);
  jingle = minim.loadFile("Loveliers.mp3", 2048);
  jingle.loop();
  fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());
  fftLog.logAverages(22, 3);
  rectMode(CORNERS);
  colorMode(HSB, 100);
}
 
void draw() {
  background(0);

  fftLog.forward(jingle.mix);
  int w = int(width/fftLog.avgSize());
  for(int i = 0; i < fftLog.avgSize(); i++) {
    float amp = sqrt(sqrt(fftLog.getAvg(i)))*150;
    float h = i * 100/fftLog.avgSize();
    h -= 10;
    h = 100 - h;
    float s = 70;
    float b = amp/3 * 100;
    float a = 100;
    fill(color(h,s,b,a));
    rect(i*w, height-5, i*w + w, height-5-fftLog.getAvg(i));
  }
}
 
void stop() {
  jingle.close();
  minim.stop();
  super.stop();
}

