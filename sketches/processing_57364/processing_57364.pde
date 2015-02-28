
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
float barheight[] = new float[25];


void setup() {
  size(700, 400);

  minim = new Minim(this);

  song = minim.loadFile("bitbit.mp3");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(10); 

  song.play();
}

void draw() {

  fill(0, 10);
  rect(0, 0, width, height);

  fill(255);
  stroke(255);

  beat.detect(song.mix);


  pushMatrix();
  translate(width/2, height/2);


  for ( int i = 0; i < 25; i++) {
    if (beat.isOnset(i)) {
      barheight[i] = height;
    }
  }

  for ( int i = 0; i < 25; i++) {
    pushMatrix();
    translate(  ((width/25.0) * i) - width/2, barheight[i]/2 );
    rect( 0, 0, (width/25.0), -barheight[i] );
    popMatrix(); 
    barheight[i] *= 0.9f;
  }

  popMatrix();

  for ( int i = 0; i < song.bufferSize() - 1; i++ )
  {
    float r= song.left.get(i)*255;
    float g= song.right.get(i)*255;
    float b= song.mix.get(i)*255;

    stroke(r, g, b);
    float x1 = map(i, 0, song.bufferSize(), 0, width);
    float x2 = map(i+1, 0, song.bufferSize(), 0, width);
    line(x1, 0.5*height/4 - song.left.get(i)*50, x2, 0.5*height/4 - song.left.get(i+1)*50);
    line(x1, 3.5*height/4 - song.right.get(i)*50, x2, 3.5*height/4 - song.right.get(i+1)*50);
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}



