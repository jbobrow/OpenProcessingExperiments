
import ddf.minim.*;

Minim minim;
AudioPlayer song;


void setup() {
  size (displayWidth, displayHeight);
  smooth();

  minim = new Minim (this);
  song = minim.loadFile("gloomy.mp3");
  song.play ();
}

void draw() {
  background(0);
  for (int i=5; i<width; i=i+30) {
    for (int j=10; j<height; j=j+60) {
      fill(#8BBEDE);
      float dimension = song.mix.level() * 250;
      rect(i, j, 20, 40+dimension, 5);
    }
  }
  for (int a=5; a<width/2; a=a+30) {
    for (int b=10; b<height; b=b+60) {
      fill(#6D95B4);
      float dimension = song.mix.level() * 250;
      rect(a, b, 20, 40+dimension, 5);
    }
  }
}
