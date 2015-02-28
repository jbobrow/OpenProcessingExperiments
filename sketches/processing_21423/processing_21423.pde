
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

int num = 15;
int PRand = 1;

float [] TranslateX = new float [num];
float [] TranslateY = new float [num];
float [] TranslateZ = new float [num];

int [] Colors = new color [5];

void setup() {

  background(0);

  noStroke();
  size(1000, 400, P3D);

  Colors[0] = color (220, 63, 71, 3);
  Colors[1] = color (225, 162, 83, 75);
  Colors[2] = color (227, 223, 101);
  Colors[3] = color (100, 196, 169);
  Colors[4] = color (34, 41, 26, 50);


  for (int i = num - 1; i >= 0; i--) {
    TranslateX[i] = random(0, 5);
    TranslateY[i] = random(0, 5);
    TranslateZ[i] =random(0, 5);
  }

  minim = new Minim(this);  
  song = minim.loadFile("PURP.mp3", 2048);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(1);
  bl = new BeatListener(beat, song);  
  song.loop();
}

void draw() {
  fill(0, 1);
  rect (-500, -500, width + 500, height + 500);

  float mixLevel = pow(song.mix.level()*15, 2);

  translate(width/2, height/2);

  blend(0, 0, width, height, 0, 0, width, height, BLEND);

  for (int i = num - 1; i >= 0; i--) {

    TranslateX[i] += random(-PRand, PRand);
    TranslateY[i] += random(-PRand, PRand);
    TranslateZ[i] += random(-PRand, PRand);

    rotateX(frameCount * 0.02);
    rotateY(frameCount * 0.05);
    rotateZ(frameCount * -0.03);

    if (i % 2 == 0) {
      fill(255, 150, 77, 50);
      translate(TranslateX[i], TranslateY[i], TranslateZ[i]);
      sphere(3);
      if ( beat.isKick() ) {
        fill(255, 150, 77, 50);
        translate(TranslateX[i], TranslateY[i], TranslateZ[i]);
        sphere(mixLevel);
      }
    }
    if (i%2!=0) {
      fill(125, 178, 79, 75);
      translate(TranslateX[i], TranslateY[i], TranslateZ[i]);
      sphere(1);

      if ( beat.isHat() ) {

        fill(125, 178, 79, 75);
        translate(TranslateX[i], TranslateY[i], TranslateZ[i]);
        sphere(mixLevel*.75);
      }
    }
  }
}


void stop() {
  song.close();
  minim.stop();
  super.stop();
}

class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps) {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}


