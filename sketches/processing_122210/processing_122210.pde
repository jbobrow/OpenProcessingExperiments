
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/5488*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput in;
FFT fft;

float loudestFreqAmp = 0;
float loudestFreq = 0;
int timerCounter = 0;

/* @pjs preload="picture.jpg"; */
PImage img;
PImage noise;

void setup()
{
 size(640, 1136, P2D);
 frameRate(1);
 
 img = loadImage("DD.jpg");

 

 minim = new Minim(this);
 minim.debugOn();
 background(img);
 

 noStroke();
 // get a line in from Minim, default bit depth is 16
 in = minim.getLineIn(Minim.STEREO, 1024);
 fft = new FFT(in.bufferSize(), in.sampleRate());

}


void draw()
{
  

 fft.window(FFT.HAMMING);
 
 println();
 for(int i = 0; i < fft.specSize(); i++)
 {
 
   // draw the line for frequency band i, scaling it by 4 so we can
   //see it a bit better
   //line(i, height, i, height - fft.getBand(i)*4);
   
   // hvis fft.getBand(i) større end loudestFregAmp og fft.getBand(i) større end 10)
   if (fft.getBand(i) > loudestFreqAmp && fft.getBand(i) > 2)
   {
     //println(loudestFreqAmp);
     loudestFreqAmp = fft.getBand(i);
     
     //println(fft.getBand(i));
     
   
     loudestFreq = i * 4;
     
    println(i);
     //sine.setFreq(loudestFreq);
     
   
     //fill(loudestFreq * 1, 30 - loudestFreq, loudestFreq * 20, 30 );
     if(loudestFreq < 10)
     {
       rect(random(0,width), random(0,height), loudestFreqAmp, loudestFreqAmp);   
     }
     else
     {
         fill(0);
      ellipse(random(0,width), random(0,height),1,1);
        fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
        
           fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
     fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
        
           fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
        
           fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
     fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
        
           fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    
      fill(0);
      ellipse(random(0,width), random(0,height),1,1);
      
      fill(3);
    ellipse(random(0,width), random(0,height),2,2);
    
          
      fill(6);
    ellipse(random(0,width), random(0,height),2,2);
    //ellipse(loudestFreqAmp, loudestFreqAmp, random(1,width), random(1,height) );
   
           
   
 
 }
 

     timerCounter = 0;
   }
 }
 loudestFreqAmp = 0;

 // draw the waveforms
 /*  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
  line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
  line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }*/

 fft.forward(in.mix);
 timerCounter++;
 if(timerCounter >= 90)
 {
   //println("Clr screen");
   fill(255, 255, 255, (timerCounter - 90) * 2);
   rect(0, 0, width, height);
  // point(width, height);
 }

}



void stop()
{
 // always close Minim audio classes when you are done with them
 in.close();
 minim.stop();

 super.stop();
}


