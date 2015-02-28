
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.opengl.*;

//audio variables
private final String songName = "bring_me_to_life.mp3";
private Minim minim;
private AudioPlayer song;
private FFT fft;
private BeatDetect beat;
private float _beatWindFactor;
private final float _beatScaleFactor = 100.0;

//particles of smoke
private ParticleSystem[] pss;

private int w;

// controlls for the wind force
private float windX, windY;

// controls the scale of the particle
private float pScale;

void setup(){
  size(450, 400, OPENGL);
  colorMode(RGB, 255, 255, 255, 100);
  
  minim = new Minim(this);
  song = minim.loadFile(songName, 1024);
  
  // add a listener for the sogn's beats
  //beat = new BeatDetect();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(100);  

  
  // using for compute the fft with logaritmic frequency scale
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(44,2);
  fft.window(FFT.HAMMING);
  
  //init the particles array
  w=int(width/fft.avgSize());
  
  pss = new ParticleSystem[fft.avgSize()];
  for(int i=0; i<fft.avgSize(); i++){ 
    pss[i] = new ParticleSystem(0, new PVector(i*w,height));
  }
  
  //start playing
  song.play();
}

void draw() {
  background(75);
  
  beat.detect(song.mix); //detect beats
  fft.forward(song.mix); //compute fft
  
  // draw the particles
  for (int i = 0; i < fft.avgSize(); i++) {
    //compute the wind force
    windX = (mouseX - width/2) / 1000.0;
    _beatWindFactor = map(mouseY,0,height,10,1000);
    
    // modify particle properties based on music's hat
    if(beat.isHat()){
      windY = -0.02 - fft.getAvg(i)*fft.indexToFreq(i)/pow(_beatWindFactor,2);
      pScale = 1.2 + fft.getAvg(i)/_beatScaleFactor;
    } else {
      windY = -0.02;
      pScale = 1.2;
    }
    
    // wind vector
    PVector wind = new PVector(windX,windY,0);
    
    // add a particle 
    colorMode(HSB,fft.avgSize());
    // add a particle for the current frequency
    pss[i].addParticle(color(i,constrain(fft.getAvg(i), 0, 360),fft.avgSize()), pScale);
    colorMode(RGB, 255, 255, 255, 100);
      
    // apply the wind force to the particle and then draw it.
    pss[i].add_force(wind);
    pss[i].run();
  }
}


