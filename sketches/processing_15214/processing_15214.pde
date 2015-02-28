
//use the minim library to play a sine wave
import ddf.minim.*;        //import minim(audio) library
import ddf.minim.signals.*;

Minim minim;          //minim object
AudioOutput output;   //setup to allow output
SineWave sine;        //create sine wave
//SquareWave square;        //create square wave


void setup(){
  size(800,600);
  
  minim = new Minim(this);                  //initialise Minim
  output = minim.getLineOut(Minim.MONO);    //setup output - mono
  sine = new SineWave(440,0.8, output.sampleRate());  //initial sine values
  
  sine.portamento(200);        //portamento for smooth pitch changing
  output.addSignal(sine);      //add sine to output - constantly plays
 
 // square = new SquareWave(440, 0.8, output.sampleRate());
  //output.addSignal(square);
}

void draw(){
  
}



