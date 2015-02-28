
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beat;

Circle[] vett = new Circle[0];
int val=1;

void setup() { 
  size(300, 300);
  noStroke(); 
  smooth();

  minim = new Minim(this);
  song = minim.loadFile("Requiem for a Dream.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(1);
}

void mousePressed() {
  if (mouseY<60) {
    if ( mouseX>0 && mouseX<100) { 
      val=1;
    }
    if (mouseX>100 && mouseX<200) { 
      val=2;
    }
    if (mouseX>200 && mouseX<300) { 
      val=3;
    }
  }   
  else {
    Circle cerchio = new Circle(mouseX, mouseY, val);
    vett = (Circle[]) append(vett, cerchio);
  }
}



void draw() { 
  background(0);
  fill(170,170, 50);
  text("KickBeat", 20, 20);
  fill(100, 200, 80);
  text("SnareBeat", 120, 20);
  fill(200, 100, 80);
  text("hatBeat", 220, 20);

  fill(0, 10);
  ellipse(150, 150, 20+30, 20+30);
  beat.detect(song.mix);
  for (int i=0;i<vett.length;i++) {
    vett[i].elabora();
    vett[i].disegna();
  }
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}














