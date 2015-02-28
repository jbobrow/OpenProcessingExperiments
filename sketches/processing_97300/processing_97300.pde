
import ddf.minim.*;
Minim minim;
AudioInput in;


void setup() {
  size(600,600);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
background(in.mix.level()*2500);
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
