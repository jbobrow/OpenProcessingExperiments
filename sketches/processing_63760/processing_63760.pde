
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
Ball balls[] = new Ball[0];
FFT fft;
BandPass bandpass;
HighPassSP highpass;
LowPassSP lowpass;
int frequency = 0;
char mode;
void setup() {
  size(960, 700);
  minim = new Minim(this);
  smooth();
  song = minim.loadFile("04 - Epic Soul Factory - POLTERGEIST ATTACK.mp3", 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(256);
  bandpass = new BandPass(200, 50, song.sampleRate());
  highpass = new HighPassSP(100, song.sampleRate());
  lowpass = new LowPassSP(200, song.sampleRate());
  song.loop();
  for (int i = 0; i < 16 ; i++) {
    for (int y = 0 ; y < 16 ; y++) {
      Ball b = new Ball(56*(y+1), i*40+40);
      balls = (Ball[]) append(balls, b);
    }
  }
  textSize(14);
}

void draw() {
  fft.forward(song.mix);
  fill( 255, 45 );
  rect(0, 0, width, height);
  println(fft.specSize());
  for (int i = 0 ; i< fft.avgSize(); i++) {
    balls[i].setRadius(fft.getAvg(i)*50);
    balls[i].display();
  }
  fill(0, 146, 178);
  rect(0, height-32, width, 32);
  fill(0);
  if (mode == 'B') {
    text("Band Pass:\t Frequency (x) = "+ int(bandpass.frequency()) + "\t Bandwidth (y)= "+int(bandpass.getBandWidth()), 10, height-12);
  } 
  else if (mode == 'H') {
    text("High Pass:\t Frequency (x) = "+ int(highpass.frequency()), 10, height-12);
  }
  else if (mode == 'L') {
    text("Low Pass:\t Frequency (x) = "+ int(lowpass.frequency()), 10, height-12);
  }
  text("Band Pass(B) - High Pass(H) - Low Pass(L)", 660, height-12);
}
void mouseClicked() {
  if (mode == 'B') {
    bandpass.setFreq( map(pmouseX, 0, width, 50, 1000));
    bandpass.setBandWidth(map(pmouseY, 0, height, 50, 100));
  } 
  else if (mode == 'H') {
    highpass.setFreq( map(pmouseX, 0, width, 20, 10000));
  }
  else if (mode == 'L') {
    lowpass.setFreq( map(pmouseX, 0, width, 20, 10000));
  }
}

void keyPressed() {
  key = Character.toUpperCase(key);
  if (key == 'B') {
    if (mode != 'B') {
      song.removeEffect(lowpass);
      song.removeEffect(highpass);
      mode = 'B';
      song.addEffect(bandpass);
    } else {
       bandpass.setFreq(200);
       bandpass.setBandWidth(50);
    }
  } 
  else if ( key == 'H') {
    if (mode != 'H') {
      song.removeEffect(bandpass);
      song.removeEffect(lowpass);
      mode = 'H';
      song.addEffect(highpass);
    } else {
      highpass.setFreq(100);
    }}
  else if ( key == 'L') {
    if (mode != 'L') {
      song.removeEffect(bandpass);
      song.removeEffect(highpass);
      mode = 'L';
      song.addEffect(lowpass);
    } else {
      lowpass.setFreq(200);      
    }
  }
}
void stop() {
  song.close();
  minim.stop();
  super.stop();
}


