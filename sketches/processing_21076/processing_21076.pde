
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object

//******************************//
//** PLAY WITH THESE SETTINGS **//
float freq=600;
float amp = 1;
float samples = 44000;

//******************************//
void setup(){
  size(500,500);
  rectMode(CENTER);
  background(255);
  noStroke();
  smooth();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);    // make an output object, set the buffer to 512 samples
  sine = new SineWave(freq, amp, samples);  	// start the sine wave with this default tone
  out.addSignal(sine);     // add the wave to the output object so we can hear it

}

void draw(){
for(int j=50;j<height;j+=50){
 for(int i = 50; i <width; i+=50){
   fill(random(155,255),random(150,255),100);
   ellipse(i,j,50,50);   
}
}
noLoop(); 
}

void mouseMoved(){  
color myColor=get(mouseX,mouseY);
float freq=red(myColor)*4; 
sine.setFreq(freq);


}


// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() )
    {
      out.unmute();
    }
    else
    {
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


