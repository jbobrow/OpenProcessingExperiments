
/*
 * Daniel "weseven" Simionato, 2011.
 * weseven@gmail.com
 *  
 * **musicGrid, v0.3**
 *  a Tenori-on like sketch made in Processing.
 * 
 *
 *
 * v0.3: code cleanup, use only one signal per note (as opposed to one signal per dot in v0.2).
 *
 */



import ddf.minim.*;
import ddf.minim.signals.*;

static Minim minim;
static AudioOutput out;

static final int WIDTH = 402;
static final int HEIGHT = 402;
static final int CSIZE = 30;
static final int SPACING = 6;
static final int DOTSPERROW = (WIDTH/(CSIZE+SPACING));
static final int DOTSPERCOLUMN = (HEIGHT/(CSIZE+SPACING));
static final int BPM = 180;
static final int NOTESNUMBER = 5;
static final float TEMPO = (60.0f/BPM)*1000;

static SineWave[] SINES = new SineWave[DOTSPERCOLUMN];


WootDot [][] dots = new WootDot[DOTSPERROW][DOTSPERCOLUMN];

static int currentcolumn = 0;
static int previouscolumn = -1;
static int clock = 0;


//static final float[] seven_notes = {261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88};

//seven_notes[0] = 261.63; //C4
//seven_notes[1] = 293.66; //D4
//seven_notes[2] = 329.63; //E4
//seven_notes[3] = 349.23; //F4
//seven_notes[4] = 392.00; //G4
//seven_notes[5] = 440.00; //A4
//seven_notes[6] = 493.88; //B4

//pentatonic scale
static final float[] five_notes = {
  261.63, 293.66, 329.63, 392.00, 440.00
};




void getSinesArray(){
  for(int i=0;i<DOTSPERCOLUMN;i++) {

    //fr/NOTESNUMBER in which octave to play the note
    //fr%NOTESNUMBER which note to play (array index)  
    float fr = 4*five_notes[NOTESNUMBER-((i%NOTESNUMBER)+1)]/pow(2, (1+(i/NOTESNUMBER)));

    // create a sine wave Oscillator, set to desired frequency, at 0.5 amplitude, sample rate from line out
    SINES[i]= new SineWave(fr, 0.5, out.sampleRate());

    SINES[i].noPortamento();
    // add the oscillator to the line out
    out.addSignal(SINES[i]);
    // immediately mute line out
    out.disableSignal(SINES[i]);
  }
}


void makeGrid() {
  for(int i=0;i<(DOTSPERROW);i++) {
    for(int j=0;j<(DOTSPERCOLUMN);j++) {
      dots[i][j] = new WootDot((SPACING+ i*(CSIZE+SPACING)),(SPACING+ j*(CSIZE+SPACING)), j);
      if(i==j)
        dots[i][j].toggle();
      dots[i][j].display();      
    }
  }
}




class WootDot {
  final int xpos;
  final int ypos;
  final int freq;

  int colorvalue = 90;

  boolean toggled = false;
  boolean sounding = false;


  WootDot(int x, int y, int fr) {
    xpos = x;
    ypos = y;

    freq = fr;
  }

  final void display() {
    fill(colorvalue);
    rect(xpos, ypos, CSIZE, CSIZE);
  }

  final void toggle() {
    toggled = (!toggled);
    if(toggled)
      colorvalue = 200;
    else
      colorvalue = 60;

    this.display();
  }

  final void soundStart() {
    sounding = true;
    if(toggled) {
      colorvalue = 255;
      out.enableSignal(SINES[freq]);
    }
    else
      colorvalue = 140;
  }

  final void soundStop() {
    sounding = false;
    out.disableSignal(SINES[freq]);
    if(toggled) {
      colorvalue = 200;
    }
    else
      colorvalue = 60;
  }
}  

void setup() {
  size(WIDTH, HEIGHT, P2D);
  noStroke();
  noSmooth();
  background(0.0f,0.0f,0.0f);

  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 1024, 44100, 16);
  
  getSinesArray();

  makeGrid();
  clock = millis();
}



void draw() {
  if(millis()>clock+TEMPO) {
    clock = millis();
    previouscolumn = currentcolumn;
    currentcolumn = (currentcolumn+1)%DOTSPERROW;

    for(int j=0;j<DOTSPERCOLUMN;j++) {
      dots[previouscolumn][j].soundStop();
      dots[previouscolumn][j].display();
      dots[currentcolumn][j].soundStart();
      dots[currentcolumn][j].display();
    }
  }
}


void mouseReleased() {
  dots[(int)(mouseX/(WIDTH/DOTSPERROW))][(int)(mouseY/(HEIGHT/DOTSPERCOLUMN))].toggle();
}

void stop() {
  out.close();
  minim.stop();

  super.stop();
}


