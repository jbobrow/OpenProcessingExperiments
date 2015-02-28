
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object
//Audio values
float freq = 440;
float amp = 0.25;
float samples = 44100;
//drawing values
int cell=5;
int n=0;

void setup(){
  size(400,400,P3D);
  background(255);
  noStroke();
  frameRate(5);
  //output sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);
}

void draw(){
  //color2sound
  color myColor = get(mouseX, mouseY);
  float freq = map(int(floor(brightness(myColor))), 0, 255, 50, 600);
  sine.setFreq(freq);
  float amp = map(int(floor(saturation(myColor))), 0, 255,0.3, 2.00);
  sine.setAmp(amp);
  //visulaize
  translate(width/3,height/3,0);
  for(int y=cell; y <= 399; y+=cell){
   for(int x=cell; x <= 399; x+=cell){
     translate(0,0,cell);
     rotateZ(n*-PI/6*0.05);
     color myFill = color(random(255),random(255),random(255),100);
     fill(myFill);
     rect(x,y,cell,cell);
     n++;
     if(n>1000000){
     noLoop();
     }
    }
  }
}

//mute out
void keyPressed(){
  if ( key == 'm' ){
    if ( out.isMuted() ){
      out.unmute();
    }
    else{
      out.mute();
    }
  }
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

