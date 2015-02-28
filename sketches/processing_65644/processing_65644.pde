
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
LowPassSP lowpass;
HighPassSP highpass;  

int controllo1=0, controllo2=0;

void setup() {  
  smooth();
  size(512, 512);
  minim = new Minim(this);
  song = minim.loadFile("Requiem for a Dream.mp3", 1024);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(60, 7);
  fft.window(FFT.HAMMING);
}

void mousePressed() {
  if (mouseX>420 && mouseX<497) {
    if (mouseY>50 && mouseY<75 && controllo1==0) {
      highpass = new HighPassSP(1000, 44100);
      song.addEffect(highpass);
      controllo1=1;
    }
    if (mouseY>150 && mouseY<175 && controllo2==0) {
      lowpass = new LowPassSP(200, 44100);
      song.addEffect(lowpass);
      controllo2=1;
    }

    if (mouseY>250 && mouseY<275) {
      song.removeEffect(lowpass); 
      song.removeEffect(highpass);
      controllo1=0;
      controllo2=0;
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  rect(420, 50, 497, 75);
  rect(420, 150, 497, 175);
  rect(420, 250, 497, 275);
  fill(255);
  text("Passa Alto", 427, 68);
  text("Passa Basso", 422, 168);
  text("Normalizza ", 427, 268);

  fft.forward(song.mix);
  println(fft.specSize());
  int z = int((width)/fft.avgSize()); 
  rectMode(CORNERS);
  stroke(0);
  for (int i = 0; i < fft.avgSize(); i++)
  {
    fill( map( i, 0, fft.avgSize(), 0, 100), map(fft.getAvg(i), 0, 10, 60, 100), 100);
    rect((i*z), height, i*z+z, height - fft.getAvg(i)*20);
  }
}
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


