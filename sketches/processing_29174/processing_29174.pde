
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim billybob;
AudioPlayer song;
FFT fft;

void setup() {
  size (1024, 800);
  billybob = new Minim(this);
  song = billybob.loadFile("NoCars.mp3");
  song.loop();
  fft = new FFT(song.mix.size(), 44100);
}

void draw() {
  background(150);
  fft.forward(song.mix);
  for(int i = 475; i < 500; i++) {
    if (fft.getBand(i) > .1) {
      ellipse(300, 400, 50, 50);
    }
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  song.close();
  billybob.stop();
  super.stop();
}


