
/*
Pitch Detector
a delightfully imperfect zero-crossing counter easily f'ed up by hf,
// Might be good for making your guitar into a bass, tho
// !!!   bonus amplitude follower  !!!
 by Chris Ball 2010
 
 /// /// ///  ^^  YO  BE SURE TO ADD  pitchDetector.pde to your sketch folder
 
 */

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput in;
AudioOutput out;
AudioPlayer player;
pitchDetector pitchdetect;                        /// /// /// /// /// /// /// ///  YO
TriangleWave osc;
boolean switched=false;
void setup(){
  size(400,500,P2D);
  minim = new Minim(this); 
  player = minim.loadFile("chillout song    zefrank.com.mp3");
  in = minim.getLineIn(Minim.STEREO, 512);  
  player.loop(0);
  pitchdetect = new pitchDetector();              /// /// /// /// /// /// /// ///  YO
player.addEffect(pitchdetect);                   /// /// /// /// /// /// /// ///  YO
//in.addEffect(pitchdetect);
  out = minim.getLineOut(Minim.STEREO, 512);
  osc = new TriangleWave(100, 0.5, out.sampleRate());
  out.addSignal(osc);

}

void draw(){
  background(0);
  stroke(255);
  osc.setAmp(pitchdetect.getAmplitude()*2.0); /// /// /// /// /// /// /// ///  YO
  osc.setFreq(pitchdetect.getPitch());        /// /// /// /// /// /// /// ///  CHECK IT, YO
  if(switched==false && millis()/1000>38){
    player.close();
    in.addEffect(pitchdetect);
    switched=true;
  }
  if(switched){
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  } 
//  line(0,50,400,50);
  }else{
stroke(0,255,255);
    for(int i = 0; i < player.left.size()-1; i++)
  {
    line(i, 55 + player.left.get(i)*90, i+1, 55 + player.left.get(i+1)*90);
    line(i, 155 + player.right.get(i)*90, i+1, 155 + player.right.get(i+1)*90);
  }

  }

  stroke(0,255,0);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line(i, 250 + out.left.get(i)*90, i+1, 250 + out.left.get(i+1)*90);
    line(i, 350 + out.right.get(i)*90, i+1, 350 + out.right.get(i+1)*90);
  } 

}


