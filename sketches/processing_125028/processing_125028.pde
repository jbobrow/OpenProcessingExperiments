
// A little eLearning for Piano
// Simulate a piano with real pictures and sound from the instrument
// Use the keys from 1 to 7 to play notes from C to B.

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables

//Variables for images
PImage off;
PImage doNote;
PImage reNote;
PImage miNote;
PImage faNote;
PImage solNote;
PImage laNote;
PImage siNote;
PImage instructions;

//Position for the piano images
int xPiano =112;
int yPiano =0;

// Variables for audio
Minim minim;
AudioSample audDoNote;
AudioSample audReNote;
AudioSample audMiNote;
AudioSample audFaNote;
AudioSample audSolNote;
AudioSample audLaNote;
AudioSample audSiNote;

void setup(){
  size(1024, 768);
  background(0);

  //Load images
  off = loadImage("NoNote.jpg");
  doNote = loadImage("DoNote.jpg");
  reNote = loadImage("ReNote.jpg");
  miNote = loadImage("MiNote.jpg");
  faNote = loadImage("FaNote.jpg");
  solNote = loadImage("SolNote.jpg");
  laNote = loadImage("LaNote.jpg");
  siNote = loadImage("SiNote.jpg");
  instructions = loadImage("Instructions.jpg");
  image(instructions, -250, 600);
  playOff();

  //Load audios  
  minim = new Minim(this);
  audDoNote = minim.loadSample("DoNote.wav");
  audReNote = minim.loadSample("ReNote.wav");
  audMiNote = minim.loadSample("MiNote.wav");  
  audFaNote = minim.loadSample("FaNote.wav");
  audSolNote = minim.loadSample("SolNote.wav");
  audLaNote = minim.loadSample("LaNote.wav");
  audSiNote = minim.loadSample("SiNote.wav");
}

void playOff() {
  image(off, xPiano, yPiano); 
}

void playDo() {
  image(doNote, xPiano, yPiano);
  audDoNote.trigger();
}

void playRe() {
  image(reNote, xPiano, yPiano);
  audReNote.trigger();
}

void playMi() {
  image(miNote, xPiano, yPiano);
  audMiNote.trigger();
}

void playFa() {
  image(faNote, xPiano, yPiano);
  audFaNote.trigger();
}

void playSol() {
  image(solNote, xPiano, yPiano);
  audSolNote.trigger();
}

void playLa() {
  image(laNote, xPiano, yPiano);
  audLaNote.trigger();
}

void playSi() {
  image(siNote, xPiano, yPiano);
  audSiNote.trigger();
}



void draw(){

}


void keyPressed(){

  switch(key){
  case '1':
    playDo();
    break;  
  case '2':
    playRe();
    break;  
  case '3':
    playMi();
    break;  
  case '4':
    playFa();
    break;  
  case '5':
    playSol();
    break;  
  case '6':
    playLa();
    break;  
  case '7':
    playSi();
    break;  
  };
}


