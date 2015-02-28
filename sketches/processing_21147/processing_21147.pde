
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object

//******************************//
//** PLAY WITH THESE SETTINGS **//

float freq = 440;
float amp = 0.25;
float samples = 44100;

//******************************//

void setup(){
  size(300,300);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);    
  sine = new SineWave(freq, amp, samples);  	
  out.addSignal(sine);                          

}



void draw(){
  //translate(0,300);
  freq = map(mouseY-300, 0, -300, 0, -440);
  sine.setFreq(freq);
  background(5,11,130);
  fill(255);
  ellipse(0,0,75,75);
  fill(0);
  rect(0,225,60,height);
  rect(60,200,45,height);
  rect(105,245,60,height);
  rect(165,160,35,height);
  rect(200,240,60,height);
  rect(260,130,40,height);
  fill(77,46,6);
  rect(0,280,width,20);
  fill(195);
  ellipse(mouseX,mouseY,100,25);
  fill(76,234,80);
  rect(mouseX-50,mouseY,100,5);
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


