
/********************
 *    Guitar Tuner
 *
 *    Cody Geary
 *    21 July 2013
 *
 *   -Displays red and blue waves that align when you play the right note
 *   -Shows a small FFT spectrum plot, peaks are each 4% away from the target note
 *   -The circle plot shrinks down to a point when the target note is hit
 *
 *********************/
 
import ddf.minim.*;  //import audio input library
import ddf.minim.analysis.*;  //import the FFT filter library
Minim minim; AudioInput in; FFT fftLin;

int scale_select = 1; //<-----pick the tuning you want here

float[][] Scales = {
         {6, 61.74,  82.407, 110.00, 146.83, 185.00, 246.94,      0},  //(0) Baritone guitar tuning
         {6, 82.407, 110.00, 146.83, 196.00, 246.94, 329.63,      0},  //(1) Standard guitar tuning
         {6, 73.416, 110.00, 146.83, 196.00, 246.94, 329.63,      0},  //(2) Drop D Tuning
         {4, 392.00, 261.63, 329.63, 440.00,      0,      0,      0},  //(3) Ukelele C6-Tuning
         {7, 61.74,  82.407, 110.00, 146.83, 196.00, 246.94, 329.63}}; //(4) 7-String Guitar
         
String[][] Names = {
         {"Baritone Tuning"       , "B", "E", "A", "D", "F#", "B", " "},
         {"Standard Tuning"       , "E", "A", "D", "G", "B", "E", " " },
         {"Drop D Tuning"         , "D", "A", "D", "G", "B", "E", " " },
         {"Ukelele C6 Tuning"     , "G", "C", "E", "A", " ", " ", " " },
         {"7-String Guitar Tuning", "B", "E", "A", "D", "G", "B", "E" }};

void setup()
{
  size(600, 600, P2D);
  minim = new Minim(this);  
  in = minim.getLineIn(Minim.MONO, 4096, 44100);   //the buffer size (4096) must be a power of 2 for the FFT to work. The sample rate is 44100 as default.
}

void draw()
{
  smooth();
//  fill(10,10,10, 40);  rect(0,0,width,height);  //draws a rectangle with alpha-40 so you get a fade effect
  background(10,10,10);                           //clears the screen, pick either this line or the previous line for the desired effect.
  stroke(255);
  
  int peakmax=0;  float peakvalue=0;  //vars for keeping track of the maximum input level
  
  for(int i = 0; i < in.bufferSize()-1; i++) { //Scan through the input buffer and find the biggest peak
    if ( (in.mix.get(i))>(peakvalue) ) {
      peakvalue=in.mix.get(i);
      if ( abs(in.mix.get(i))<.02 ) {   //if the largest peak is less than a threshhold, then mute the plot so it looks less noisy
        peakvalue=in.mix.get(i)*.02/abs(in.mix.get(i))*2;
      }
      if ( i<in.bufferSize()/3 ) {  // only choose max-peak positions in the first 1/3 of the buffer, since we will plot multiple wavelenths
        peakmax=i;
      }
    }
  }
    
  float freq = 0; int delay=0;   float decay = 1.01; int space = -(height/16); int interval= 1; float viewscale; float wide=2*width/3;
  float point1; float point2; float point3; float point4;
  float wavesize=height/18;  float smallwavesize=wavesize/2; float num_strings = Scales[scale_select][0];
  fill(255,255,255);  textSize(16);
  
  text(Names[scale_select][0], 10,15);                  //<-print the name of scale
  for (int n=0; n<num_strings; n++) {                   //<-this loop cycles through each string
     freq = Scales[scale_select][n+1];                  //<-pick the frequency of the string from the scale array
     space += height/(num_strings+.2); 
     text(Names[scale_select][n+1], 10, space);         //<-pick the name of the string to display on the screen
     delay = round(44100/freq);   interval = delay;   viewscale = wide/interval;
     for (int i = 0; i < interval; i++) {
       point1 = in.mix.get(i+peakmax)/peakvalue; point2 = in.mix.get(i+peakmax+1)/peakvalue;
       point3 = in.mix.get(i+peakmax+delay)/peakvalue; point4 = in.mix.get(i+peakmax+delay+1)/peakvalue;  
       stroke(255,0,0);
       line( i*(viewscale)+30, space + point1*wavesize, (i+1)*(viewscale)+30, space + point2*wavesize );
       stroke(100,100,255);
       line( i*(viewscale)+30, space + point3*wavesize*decay, (i+1)*(viewscale)+30, space + point4*wavesize*decay );
     }
     
     if (freq>200){ fftLin = new FFT( 4096, 44100 ); }  //for higher frequencies use the high frequency spectrum
     else         { fftLin = new FFT( 4096, 22050 ); }  //for frequencies 200Hz or lower use the low frequency spectrum   
     fftLin.forward(in.mix);      //draw the FFT spectrum analysis with bars every 4%
     strokeWeight(4); stroke(150,150,150);
     int startfreq = 2*width/3 + width/10;
     line(startfreq,    space, startfreq,    space-fftLin.getFreq(freq*.84)*.5);
     line(startfreq+5,  space, startfreq+5,  space-fftLin.getFreq(freq*.88)*.5);
     line(startfreq+10, space, startfreq+10, space-fftLin.getFreq(freq*.92)*.5);
     line(startfreq+15, space, startfreq+15, space-fftLin.getFreq(freq*.96)*.5);   
     stroke(255,255,255);   //make the center frequency bright white
     line(startfreq+20, space, startfreq+20, space-fftLin.getFreq(freq)*.5); 
     stroke(150,150,150);
     line(startfreq+25, space, startfreq+25, space-fftLin.getFreq(freq*1.04)*.5);
     line(startfreq+30, space, startfreq+30, space-fftLin.getFreq(freq*1.08)*.5);  
     line(startfreq+35, space, startfreq+35, space-fftLin.getFreq(freq*1.12)*.5); 
     line(startfreq+40, space, startfreq+40, space-fftLin.getFreq(freq*1.16)*.5);
     strokeWeight(1);
  }
  
  int shift = 11*width/12; float circlesize = 3*wavesize/8; space = -height/18;
  
  for (int n=0; n<num_strings; n++) {       //draw circular graph of the difference between the red and blue plots
     freq = Scales[scale_select][n+1];   space += height/(num_strings+.2);
     delay = round(44100/freq);     interval = delay*2;     viewscale = 2*PI/interval;
     for (int i = 0; i < interval; i++) {
       point1 = in.mix.get(i+peakmax)/peakvalue; point2 = in.mix.get(i+peakmax+1)/peakvalue;
       point3 = in.mix.get(i+peakmax+delay)/peakvalue; point4 = in.mix.get(i+peakmax+delay+1)/peakvalue;
       stroke(255,255,255);
       line(shift + (point1-point3)*circlesize*cos(i*viewscale), space + (point1-point3)*circlesize*sin(i*viewscale), shift + (point2-point4)*circlesize*cos(i*viewscale), space + (point2-point4)*circlesize*sin(i*viewscale));
     }
  }
}



