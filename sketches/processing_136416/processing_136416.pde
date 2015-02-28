
/**
  * This sketch demonstrates how to monitor the currently active audio input 
  * of the computer using an <code>AudioInput</code>. What you will actually 
  * be monitoring depends on the current settings of the machine the sketch is running on. 
  * Typically, you will be monitoring the built-in microphone, but if running on a desktop
  * its feasible that the user may have the actual audio output of the computer 
  * as the active audio input, or something else entirely.
  * <p>
  * When you run your sketch as an applet you will need to sign it in order to get an input. 
  */
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int buffer_size = 1024*4;  // also sets FFT size (frequency resolution)
float sample_rate = 44100;
float rectVal=0;

// how wide each 'peak' band is, in fft bins
int binsperband = 10;
int peaksize; // how many individual peak bands we have (dep. binsperband)
float gain = 40; // in dB
float dB_scale = 2.0;  // pixels per dB

int spectrum_height = 200; // determines range of dB shown
int legend_height = 20;
int spectrum_width = 512; // determines how much of spectrum we see
int legend_width = 40;

float testVal = 0;

void setup()
{
  size(1300, 800, P3D);
 
 // blendMode(EXCLUSION);
 colorMode(HSB,100);
 
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,buffer_size,sample_rate); 
  
  fft = new FFT(in.bufferSize(), in.sampleRate()); 
  fft.linAverages(70);

}

void draw()
{
  background(85);
  fft.forward(in.mix);
  
  //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
ambientLight(51, 102, 126);
  for(int i = 0; i < (in.bufferSize() - 1); i++)
  {
      stroke(0, 0, 215);   
      noFill();  
      line( i,in.left.get(i)*300, i+1, 500 + in.left.get(i+1)*300);
      
      stroke(105, 205, 255); 
      noFill();
      line( i, in.right.get(i)*300, i+1, 500 + in.right.get(i+1)*300);
      
      stroke(144, 101, 27); 
      noFill();
      line( i, 500-in.left.get(i)*300, i+1, 900 + in.left.get(i+1)*300);
            
      //stroke(155, 255, 55);

      noFill();
      rectVal = fft.getBand(i);
      if(rectVal > 0){
        rectVal =  rectVal;
      if (rectVal > 200){
      //stroke(0,255,0);
      //line( i, 300, i+i, 900);
      } else{
      stroke(37,230,63);//"Grass"
      //stroke(255,0,0);//"Grass"
      //fill(37,230,63);
      line( i, 500 - rectVal*4, i+i, 800 - rectVal);
              stroke(255, 255, 0); //"Sun"
      //rect( 1450 - rectVal, 0, 0 - rectVal, 500);
      //rect( 750 - rectVal, 500, 100 - rectVal, 800 - rectVal);
      //rect( 100 - rectVal, 500, 100 - rectVal, 800 - rectVal);
      //line( 1500 - rectVal, 1100, 800 - rectVal, 800 - rectVal);
      stroke(215,101,101);//"Lava"
      fill(215,101,101);
      line( i, 500 - rectVal*4, i-1, 1000 - rectVal);
      if(i < 256){
        stroke(255, 255, 0); //"Sun"
        noFill();
        ellipse( 1125, 145 , i+rectVal*25, i+rectVal*2);
        }
      }
      }

      
      stroke(0, 255, 0);  

      //line( i, 500 + rectVal, i+1, 900 + rectVal);  
      i++;
      i++;
  }

      stroke(255, 0, 0);  
      noFill(); 
  if(rectVal > 0){
      rectVal =  rectVal*100;
      if (rectVal > 300){  

//        translate(900, 200, -150);
//        sphere(450);
//        stroke(0,255,0);
//        translate(900, 200, -150);
//        sphere(450);
      }
  }
  



}
