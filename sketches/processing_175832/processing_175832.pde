
//import minim library
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample chord;
AudioSample root;
AudioSample flat7;
AudioSample minor3rd;
AudioSample chord2;

PImage b7;
PImage tonic;
PImage m3rd;
PImage tonicFlip;
PImage b7Flip;
PImage m3rdFlip;
PImage Instructions;
PImage Header;

//Load audio file from HD
void setup( ) {
  //canvas size
  size (1280,720);
  minim = new Minim(this);
  chord=minim.loadSample("chord.mp3",512);
  root = minim.loadSample("tonic.mp3",512);
  flat7 = minim.loadSample("b7th.mp3",512);
  minor3rd = minim.loadSample("m3rd.mp3",512);

  
  //load images
  b7 = loadImage ("b7.png");
  tonic = loadImage ("tonic.png");
  m3rd = loadImage ("m3rd.png");
  tonicFlip = loadImage("TonicFlip.png");
  b7Flip = loadImage("b7Flip.png");
  m3rdFlip = loadImage("m3rdFlip.png");
  Instructions = loadImage("Instructions.png");
  Header = loadImage("Header.png");
}
//Draw code block
void draw ( ){
  background (0);
  image(m3rd,850,250);
  image(b7,250,250);
  image(tonic,550,250);
  image(Instructions,250,500);
  image(Header,250,65);
}
//key trigger
void keyPressed ( ) {
  if (key == 'g') root.trigger( );
  if (key == 'f') flat7.trigger( );
  if (key == 'h') minor3rd.trigger( );
  if (key == 'g') image(tonicFlip,550,250);
  if (key == 'f') image(b7Flip,250,250);
  if (key == 'h') image(m3rdFlip,850,250);
  if (key == 'p') {chord.stop();
                   chord.trigger();
  }
  if (key == 's') chord.stop();

}



