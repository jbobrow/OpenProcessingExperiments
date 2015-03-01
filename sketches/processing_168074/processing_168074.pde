
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioInput input;
FFT fft;
String note;// name of the note
int n;//int value midi note
color c;//color
// float hertz;//frequency in hertz
//float midi;//float midi note
//int noteNumber;//variable for the midi note
 
 
int sampleRate= 44100;//sapleRate of 44100
 
float [] max= new float [sampleRate/2];//array that contains the half of the sampleRate size, because FFT only reads the half of the sampleRate frequency. This array will be filled with amplitude values.
float maximum;//the maximum amplitude of the max array
float frequency;//the frequency in hertz
 
void setup()
{
  size(800, 400);
 
  minim = new Minim(this);
  minim.debugOn();
  input = minim.getLineIn(Minim.MONO, 4096*8, sampleRate);
  fft = new FFT(input.left.size(), sampleRate);
}
 
void draw()
{
 
  background(0);//black BG
 
  findNote(); //find note function
 
  textSize(50); //size of the text
 
  text (frequency+" hz", 50, 80);//display the frequency in hertz
  pushStyle();
  fill(c);
  text (""+note, 50, 150);//display the note name
  popStyle();
}
 
void findNote() {
 
  fft.forward(input.left);
  for (int f=0;f<sampleRate/2;f++) { //analyses the amplitude of each frequency analysed, between 0 and 22050 hertz
    max[f]=fft.getFreq(float(f)); //each index is correspondent to a frequency and contains the amplitude value 
  }
  maximum=max(max);//get the maximum value of the max array in order to find the peak of volume
 
  for (int i=0; i<max.length; i++) {// read each frequency in order to compare with the peak of volume
    if (max[i] == maximum) {//if the value is equal to the amplitude of the peak, get the index of the array, which corresponds to the frequency
      frequency= i;
    }
  }
 
 frequency = 
//  midi= 69+12*(log((frequency)/440));// formula that transform frequency to midi numbers
  n= int (frequency);//cast to int

// Em 
if (n==984) //and 985
  {
    note = "Em";
    c = color (255, 0, 0);
  } else if (n==985) {
    note = "Em";
    c = color (255, 0, 0);
  }

// Am
if (n==782) // 220
  {
    note = "Am";
    c = color (255, 150, 0);
  } else if (n==1565) {
    note = "Am";
    c = color (255, 150, 0);
  }
  
// G
if (n==786) //264, 131
  {
    note = "G";
    c = color (255, 255, 0);
  }

// C
if (n==261)
  {
    note = "C";
    c = color (100, 150, 190);
  }
  
// F
if (n==1049) // 1050
  {
    note = "F";
    c = color (50, 50, 255);
  }

// Dm
if (n==878) // 350, 294
  {
    note = "Dm";
    c = color (0, 150, 250);
  }
  
  
}

void stop()
{
  // always close Minim audio classes when you are done with them
  input.close();
  minim.stop();
 
  super.stop();
}

