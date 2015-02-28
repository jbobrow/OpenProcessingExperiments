
/**
Coded by Kof @ 
Composition Fri Apr 26 01:59:09 CEST 2013



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'

*/

import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; // for BandPass


PImage [] illus;

Minim minim;
AudioOutput out;

int timer[] = {15,31,63,127};
boolean tick[];

void setup(){

  size(600,400);
  
  smooth();
  
  frameRate(25);


  illus = new PImage[4];
  for(int i = 1 ; i < 5;i++){
    illus[i-1] = loadImage(i+".png");
  }

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  colorMode(HSB);

  imageMode(CENTER);

  tick = new boolean[illus.length];
}


void draw(){

  boolean any = false;
  for(int t = 0 ; t < tick.length; t++){
    tick[t] = frameCount%timer[t]==0?true:false;
    if(tick[t])
      any = true;
  }


  background(any?255:0);


  for(int t = 0 ; t < tick.length; t++){
    tick[t] = frameCount%timer[t]==0?true:false;


    if(tick[t])
      playInstr(t);

    if(tick[t])
      displayIllus(t);

  }

}

void keyPressed(){

}

void displayIllus(int which){

  float rotations[] = {0,7,90,180,189,270,277,12,133,155,163};
  float rot = radians(rotations[(int)random(rotations.length)]);
  
  pushMatrix();

  translate(width/2,height/2);
  rotate(rot);
  scale(random(0.25,2.0));
  image(illus[which],random(-100,100),random(-100,100));
  popMatrix();
}

void playInstr(int which){

  switch(which){
    case 0:
      out.playNote( 0, 0.5, new Tone( "A" , 0.0225, out , 0) );
      break;
    case 1:
      out.playNote( 0, 0.5, new Tone( "F", 0.0225, out , 1) );
      break;
    case 2:
      out.playNote( 0, 0.5, new Tone( "E" , 0.0225, out , 2) );
      break;
    case 3:
      out.playNote( 0, 0.5, new Tone( "D" , 0.0225, out , 3) );
      break;

  }
}

void stop(){
  minim.stop();
  super.stop();
}

class Tone implements Instrument{
  Oscil osc;
  ADSR adsr;
  Damp damp;
  WaveShaper ws;
  GranulateRandom granulate;
  AudioOutput out;

  Tone(String note, float amp, AudioOutput _out, int _sel){
    float frequency = Frequency.ofPitch( note ).asHz();

    float freq = frequency;
    amp = 0.5;
    out = _out;

    damp = new Damp(random(0.01,0.1));
    Wavetable wav[] = {Waves.SINE,Waves.TRIANGLE,Waves.PHASOR,Waves.SAW,Waves.SQUARE,Waves.QUARTERPULSE};
    Waveform wave = wav[_sel];
    adsr = new ADSR( 1.0, 0.01, 0.2);
    osc = new Oscil(freq,amp,wave);
    granulate = new GranulateRandom(random(0.1,0.5), random(0.1,0.5), random(0.01,1.0), random(0.01,0.9), random(0.1,0.55), random(0.01,0.5)) ;

    ws = new WaveShaper(random(0.8,1.0),0.2,wav[(_sel+1)%wav.length]);

    osc.patch(adsr).patch(ws).patch(granulate).patch(damp);

  }
  void noteOn(float dur){
    adsr.noteOn();
    adsr.patch(out);
  }


  void noteOff(){
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
    damp.unpatchAfterDamp( out );


  }






}

