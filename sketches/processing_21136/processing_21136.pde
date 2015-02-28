
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object


//******************************//

int freq = 440;
float amp = 0.25;
int samples = 44100;
int x=0;
int y= 200;
//******************************//


void setup(){
 
  size(300,300);
  frameRate(3);
  background(0);
  //output sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);    // make an output object, set the buffer to 512 samples
  sine = new SineWave(freq, amp, samples);  	// start the sine wave with this default tone
  out.addSignal(sine);                          // add the wave to the output object so we can hear it
  }
  
  
  
void draw(){
  noStroke();
    color myColor = get(mouseX, mouseY);
   float freq = map(int(floor(brightness(myColor))), 0, 255, 200, 900);
  sine.setFreq(freq);
   float amp = map(int(floor(saturation(myColor))), 0, 255, .2, 2.00);
  sine.setAmp(amp);
  color myFill = color(random(255),random(255),random(255),100);
fill(myFill);
     ellipse(x,y-50,random(30,100),random(50,250));
     ellipseMode(CENTER);
  x++;
  if(x>300){
    noLoop();
    
  
    //rect(120+out.mix.get(i)*100, i, 75 + out.mix.get(i+1)*100, i+5);//left buffer
  }
}


// here we provide a way to mute out
void keyPressed(){
  if ( key == 'm' ){
    if ( out.isMuted() )
     {
      out.unmute();
    } else{
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


