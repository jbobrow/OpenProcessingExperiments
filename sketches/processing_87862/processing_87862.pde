
import ddf.minim.*;

Minim minim;
AudioInput in;

float s_volume;
float volume;

void setupVolume() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void getVolume() {
  
  
  s_volume = in.right.level() * volumeScalar;
  // println(s_volume);

  float d_volume = s_volume - volume;
  if (abs(d_volume) > 1) {
    volume += d_volume * easing;
  }

  v = volume;
}


void stop() {
  in.close();
  minim.stop();
  super.stop();
}


