
/********************
 *    Music Visualizer
 *
 *    Cody Geary
 *
 *********************/

import ddf.minim.*;  //import audio input library
import ddf.minim.analysis.*;  //import the FFT filter library
Minim minim; FFT fftLin;
AudioPlayer in;



float[][] Scales = {
{12,55,58.27,61.74,65.41,69.3,73.42,77.78,82.41,87.31,92.5,98,103.83},
{12,110,116.54,123.47,130.81,138.59,146.83,155.56,164.81,174.61,185,196,207.65},
{12,220,233.08,246.94,261.63,277.18,293.66,311.13,329.63,349.23,369.99,392,415.3},
{12,440,466.16,493.88,523.25,554.37,587.33,622.25,659.26,698.46,739.99,783.99,830.61},
{12,880,932.33,987.77,1046.5,1108.73,1174.66,1244.51,1318.51,1396.91,1479.98,1567.98,1661.22},
{12,1760,1864.66,1975.53,2093,2217.46,2349.32,2489.02,2637.02,2793.83,2959.96,3135.96,3322.44}};
   
String[][] Names = {
{"1","A1","A#1/Bb1","B1","C2","C#2/Db2","D2","D#2/Eb2","E2","F2","F#2/Gb2","G2","G#2/Ab2"},
{"2","A2","A#2/Bb2","B2","C3","C#3/Db3","D3","D#3/Eb3","E3","F3","F#3/Gb3","G3","G#3/Ab3"},
{"3","A3","A#3/Bb3","B3","C4","C#4/Db4","D4","D#4/Eb4","E4","F4","F#4/Gb4","G4","G#4/Ab4"},
{"4","A4","A#4/Bb4","B4","C5","C#5/Db5","D5","D#5/Eb5","E5","F5","F#5/Gb5","G5","G#5/Ab5"},
{"5","A5","A#5/Bb5","B5","C6","C#6/Db6","D6","D#6/Eb6","E6","F6","F#6/Gb6","G6","G#6/Ab6"},
{"6","A6","A#6/Bb6","B6","C7","C#7/Db7","D7","D#7/Eb7","E7","F7","F#7/Gb7","G7","G#7/Ab7"}};

float peakvalue=0;

void setup()
{
  size(800,600, P2D);
  
  minim = new Minim(this);
  in = minim.loadFile("music.mp3", 4096) ;
  in.loop(); 
//  
//  minim = new Minim(this);  
//  in = minim.in(Minim.MONO, 4096, 44100);   //the buffer size (4096) must be a power of 2 for the FFT to work. The sample rate is 44100 as default.
  frameRate(44100/4096);
}

void draw()
{
  smooth();
  background(10,10,10);                    
  stroke(255);
  
  int peakmax=0; float peakvalueold=peakvalue; peakvalue=0;//vars for keeping track of the maximum input level
  
  for(int i = 0; i < in.bufferSize(); i++) { //Scan through the input buffer and find the biggest peak
    if ( (in.mix.get(i))>(peakvalue) && (in.mix.get(i) > 0) ) {
      peakvalue=in.mix.get(i);
      peakmax=i;
      }
    }
 // println (peakmax);  //debug the peakmax finder
  
  float freq=0; int delay=0;   float decay = 1.0; int space =(height/20); int interval= 1; float viewscale; float wide=width;
  float point1; float point2; float point3; float point4; int scale_select = 1; float adjpeakvalue=.1;
  float wavesize=height/20;  float smallwavesize=wavesize/2; float num_notes = Scales[scale_select][0];
  float circlesize = height/30; float shift; int adjpeakmax=peakmax;
  float colorx; float colory; float colorz;
  float freqmax = 0; int [] freqhit = {0,0};
  
  fill(255,255,255);  textSize(16);
  int startfreq =  -width/12;
  
for (int k=0; k<6; k++) { 
  scale_select = k;
  space += height/(10+.2);
  startfreq = -width/12;
  for (int n=0; n<num_notes; n++) {                  
     freq = Scales[scale_select][n+1];                 
     startfreq += width/num_notes;
     
     if (freq>200){ fftLin = new FFT( in.bufferSize(), 44100 ); }  //for higher frequencies use the high frequency spectrum
     else         { fftLin = new FFT( in.bufferSize(), 22050 ); }  //for frequencies 200Hz or lower use the low frequency spectrum   
     fftLin.forward(in.mix);     
     
     colorx = 30*fftLin.getFreq(freq) % 255;
     colory = (30*fftLin.getFreq(freq)%512)/2;
     colorz = 255 - (30*fftLin.getFreq(freq)%255);
     
     adjpeakvalue = ( 2/(fftLin.getFreq(freq)) + peakvalue )/0.8;
     if (peakvalueold<2*adjpeakvalue) { adjpeakvalue = (3*adjpeakvalue+peakvalueold)/4;}  //damper effect
     
     delay = round(44100/freq);     interval = delay*2;     viewscale = 2*PI/interval;
     
     for (int count=1; count<5; count++) {
     if (adjpeakmax>in.bufferSize()/3) { adjpeakmax += -delay;}  //fix the peakmax value to be within the first 1/3 of the buffer
     }
          
     shift = startfreq+2*circlesize; space+=2*circlesize;     
     for (int i = 0; i < interval; i+=1 ) {
       point1 = in.mix.get(i+adjpeakmax)/adjpeakvalue; point2 = in.mix.get(i+adjpeakmax+1)/adjpeakvalue;
       point3 = in.mix.get(i+adjpeakmax+delay)/adjpeakvalue; point4 = in.mix.get(i+adjpeakmax+delay+1)/adjpeakvalue;
       stroke(colorx,colory,colorz);
       line(shift + (point1-point3)*circlesize*cos(i*viewscale), space + (point1-point3)*circlesize*sin(i*viewscale), shift + (point2-point4)*circlesize*cos((i+1)*viewscale), space + (point2-point4)*circlesize*sin((i+1)*viewscale));
     }
     space+=-2*circlesize;
     
     if ( ( fftLin.getFreq(freq) > freqmax) && (freq>140) && (freq<1662) ) {
       freqmax = fftLin.getFreq(freq);
       freqhit [0]= scale_select;
       freqhit [1]= n+1;
     }    
  }  
}
    
     freq = Scales[freqhit[0]][freqhit[1]];
     fill(70,80,150);
     text (Names[freqhit[0]][freqhit[1]], 5,15);
     delay = round(44100/freq);  interval=delay*3;  viewscale = wide/interval; 
     adjpeakmax = peakmax;
     for (int count=1; count<5; count++) {
     if (adjpeakmax>in.bufferSize()/3) { adjpeakmax += -delay;}  //fix the peakmax value to be within the first 1/3 of the buffer
     }
     
     for (int x = 0; x < interval; x++) {
       if (in.mix.get(x+adjpeakmax)/peakvalue>1.5) {peakvalue=in.mix.get(x+adjpeakmax);}
       if (in.mix.get(x+adjpeakmax+delay)/peakvalue>1.5) {peakvalue=in.mix.get(x+adjpeakmax+delay);}
       point1 = in.mix.get(x+adjpeakmax)/peakvalue; point2 = in.mix.get(x+adjpeakmax+1)/peakvalue;
       point3 = in.mix.get(x+adjpeakmax+delay)/peakvalue; point4 = in.mix.get(x+adjpeakmax+delay+1)/peakvalue;  
       stroke(120,120,255);
       line( x*(viewscale), 4*height/5 + wavesize + point1*wavesize, (x+1)*(viewscale), 4*height/5 + point2*wavesize + wavesize );
       stroke(100,180,200);
       line( x*(viewscale), 4*height/5 + wavesize + point3*wavesize*decay, (x+1)*(viewscale), 4*height/5 + point4*wavesize*decay + wavesize );
     }
     
     //Uncomment this line to turn on note hilighting
//     stroke(50,50,50); fill(0,0,0,0); ellipseMode(CENTER); ellipse(freqhit[1]*(width/12)+circlesize*2, (freqhit[0]+1)*(height/10.2) + height/20 + circlesize*2,60,60);
}

void stop()
{
  // close Minim audio classes when you are done with them
  in.close();
  minim.stop();  
  super.stop();
}

