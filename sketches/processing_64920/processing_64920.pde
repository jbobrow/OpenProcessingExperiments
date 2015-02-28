

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


static final float MAX_TILE_ROTATION_DELTA = 0.1;
static final float MAX_ROTATION_DELTA = 0.09;

int q,l;
float z;
float tileRotation;
float rotation;
float tileRotationDelta;
float rotationDelta;
 
boolean ruota;

Minim minim;
AudioPlayer song;
FFT fft;

void setup()
{
  size(600, 600, P3D);
  textMode(SCREEN);
  frameRate(30);
  minim = new Minim(this);
  song = minim.loadFile("Dubstep Violin - Lindsey Stirling - Crystallize.mp3", 1024);
  song.loop();

  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(80);
  
  ruota=false;
    tileRotationDelta = 0;
    rotationDelta = 0;
    
  q=0;
  l=0;
  z=0.0;
}

//se premo il mouse, l'insieme dei rettangoli ruota, oppure (se già sta ruotando) inverte la rotazione.
void mousePressed() {
  if(ruota==false){
    tileRotationDelta = random(-MAX_TILE_ROTATION_DELTA, MAX_TILE_ROTATION_DELTA);
    rotationDelta = random(-MAX_ROTATION_DELTA, MAX_ROTATION_DELTA);
    ruota=true;
  }
  else{
    tileRotationDelta *= -1;
    rotationDelta *= -1;
  }
}
 
//se premo un tasto della tastiera si ferma la rotazione 
void keyPressed() {
  if(key=='s' || key=='S'){
    ruota=false;
    tileRotationDelta = 0;
    rotationDelta = 0;
  }
}

void draw()
{
  fill(0,40);                //al posto di background(0); utilizzo un rettangolo di dimensioni dell'intera schermata di setup con riempimento nero (0) e trasparenza [alpha] (40)
  rect(-1,-1,width,height);
  stroke(255);
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);
  println(fft.specSize());

  int w = int(500/fft.avgSize());
  q = 550-height;
  l=(int) fft.getFreq(z);  

  rectMode(CORNERS);
  translate(300,300);
  
  tileRotation = (tileRotation + tileRotationDelta + TWO_PI) % TWO_PI;
  rotation = (rotation + rotationDelta + TWO_PI) % TWO_PI;
    
  for (int i = 0; i < fft.avgSize(); i++) {
    
    fill(random(map(mouseY,0,600,0,255)),random(map(mouseX,0,600,0,255)),random(255));

    rotate(i);
    rotate(rotation);


    rect(w, q-l, w+w, q-l - fft.getAvg(i)*40);

  }

  fill(255);
}

void stop()
{
  song.close();
  minim.stop();

  super.stop();
}

