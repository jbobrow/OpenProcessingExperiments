

import ddf.minim.*;

Minim minim;
AudioPlayer player;

float s_volume;
float volume;

void setupVolume() {
  minim = new Minim(this);
  player = minim.loadFile(fileName, 2048);
  player.play();
}

void getVolume() {

  s_volume = player.right.level() * volumeScalar;
  // println(s_volume);

  float d_volume = s_volume - volume;
  if (abs(d_volume) > 1) {
    volume += d_volume * easing;
  }
  
  v = volume;
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}


