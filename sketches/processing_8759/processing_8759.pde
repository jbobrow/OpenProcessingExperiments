

 
import ddf.minim.analysis.*;
import ddf.minim.*;
import controlP5.*; 

Minim minim;
AudioInput in;
FFT fft;
ControlP5 controlP5;

int colmax = 100;
int rowmax = 25;
int[][] sgram = new int[30][colmax];
float[] sgram2 =new float[256];

int col;
int leftedge;
int b;
float currMaxVal;
int maxValPos;
int mydelay;
int milidif;
int time  ;
int runtime;
int timeold;
int Speed=0;

void setup()
{
  frameRate(61);
  size(510, 125);
  time = 0;
  controlP5 = new ControlP5(this);
  controlP5.addSlider("rowmax",0,30,25,500,0,10,125);
 // set colormode
 colorMode(HSB, 255,255,255,255);
 
 // get the audio
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,2048);
 fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.window(FFT.HAMMING);
}
 
void draw()
{
  background(0);
  time = millis();
  milidif=time-mydelay;
  // perform a forward FFT on the samples in the input buffer
  fft.forward(in.mix);
  // fill array with spectrum
  for(int i = 0; i<256 ; i++)
  {
    sgram2[i] = (fft.getBand(i));
    if ((fft.getBand(i)) > (currMaxVal)){currMaxVal=((fft.getBand(i)));
    maxValPos = i;
    }
    }
    //set the color by: highest value and the freq-band
    color a = color(maxValPos,255 ,currMaxVal );
    // set values to zero
    currMaxVal =0;
    maxValPos = 0;
  //fill the last column of the array with the color
    sgram[b][99] = (a);
    // count up the rows
    b=b+1;
    // when row is full, shift array 1 step left
  if (b==rowmax){b=0;
  mydelay=time;
  println(60000/milidif);
  for(int z = 0; z < 99 ; z++){
    for(int y = 0;y < 25; y++){
    sgram[y][z]=sgram[y][z+1];
 }
  }
  // count up the column
  //col = col + 1; 
  // wrap back to the first column when we get to the end
  //if (col == colmax) { col = 0; }
  // draw the array ;)
}
for (int i = 0; i < colmax; i++) {
    for (int j = 0; j < 25; j++) {
      stroke(0);
      fill(sgram[j][i]);
      rect(i*5,height-(j*5),5,5);
      noStroke();
    }
  }
}
 
 
void stop()
{
  // always close Minim audio classes when you finish with them
  in.close();
  minim.stop();
 
  super.stop();
}
 



