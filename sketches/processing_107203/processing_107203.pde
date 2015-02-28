
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
FFT fft;
ArrayList<audioBal> groep = new ArrayList();
float count;
int d;

int aantal= 50;

boolean sketchFullScreen() {
  return true;
}
void setup() {
  size(displayWidth, displayHeight);
  smooth();
  frameRate(70);
  colorMode(HSB);
  minim = new Minim(this);
  in = minim. getLineIn(Minim.STEREO, 512);
  fft = new FFT (in.bufferSize(), in.sampleRate());

  for (int i = 0;i<aantal;i++) {
    audioBal a = new audioBal();
    groep.add(a);
  }

  addMouseWheelListener(new java.awt.event.MouseWheelListener() {
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
}

void mouseWheel(int delta) {
  d = delta;
  /// println("Mouse has moved by " + delta + " units.");
  //return delta;
}

void draw() {
  background(count, 120, 120);
  count+=d;
  if (count>255) {
    count = 255;
  }
  if (count<0) {
    count = 0;
  }
  fft.forward(in.mix);

  for (int i = 0;i<groep.size();i++) {
    audioBal a = groep.get(i);
    a.draw();
  }
}
