
import ddf.minim.*;

AudioOutput out;
SongIterator songIterator;

float[] chromatic = new float[]{
  440, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61};

float[] fifth = new float[] {
  440, 659.26};
  
float[] maj3 = new float[] {
  440, 554.37, 659.26};
  
float[] majm7 = new float[] {
  440, 554.37, 659.26, 783.99};
  
float[] mm7 = new float[] {
  440, 523.25, 659.26, 783.99};

float[] notes;

float[][] scales = {chromatic, fifth, maj3, majm7, mm7};

PFont font;

int border = 5;

void setup() {
  size(640, 360, P2D);
  frameRate(30);
  
  notes = chromatic;
  
  font = loadFont("04b24-32.vlw");
  textFont(font, 32);
  textAlign(RIGHT, BOTTOM);
  textMode(SCREEN);
}

boolean audio = false;
void draw() {
  background(255);
  if(!audio) {
    startAudio();
  } else {
    float ws = width / (float) (1 + ((songIterator.current.bitLength() - 1) / notes.length));
    float hs = height / (float) notes.length;
  
    fill(0);
    for(int i = 0; i < songIterator.current.bitLength(); i++)
      if(songIterator.current.testBit(i))
        rect((i / notes.length) * ws, (i % notes.length) * hs, ws, hs);
  
    fill(255, 0, 0);
    text(songIterator.current.toString(), width - border, height - border); 
  }
}

Minim minim;
void startAudio() {
  minim = new Minim(this);
  out = minim.getLineOut(minim.MONO, 1024);
  songIterator = new SongIterator(44100, notes, 32);
  out.addSignal(songIterator);
  audio = true;
}

void stop() {
  out.close();
  super.stop();
}

