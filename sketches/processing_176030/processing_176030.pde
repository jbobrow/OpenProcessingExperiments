
//Katy Law
//Part of the Final
//I want to use speech recognition in my project to create visuals on the screen
//4.24.2012 currently, it is taking numbers and repeating them back

//source: http://www.instructables.com/id/Animatronic-Talking-Tree-Part-2-Speech-Recogni/step3/Start-Sketching/

//import the libraries
import guru.ttslib.*;
import processing.serial.*;

//give our instances names
Serial lightPort;
TTS tts;

//A string for holding things to say
String message = "Hi";

void setup(){
  //the following initiates the voce library
  voce.SpeechInterface.init("libraries/voce-0.9.1/lib", true, true,"libraries/voce-0.9.1/lib/gram","cat");
  //start our port and also tts
  lightPort = new Serial(this,Serial.list()[0],9600);
  tts = new TTS();
  //the following settings control the voice sound
  tts.setPitch( 180 );
  tts.setPitchRange( 90 );
  //tts.setPitchShift( -10.5 );
  lightPort.write("73");   //send command to turn on the lights and open the eyes
}

void draw(){
 
  if (voce.SpeechInterface.getRecognizerQueueSize()>0){    //if voce recognizes anything being said
      String s = voce.SpeechInterface.popRecognizedString();      //assign the string that voce heard to the variable s
      println("you said: " + s);                          //print what was heard to the debug window.
      respond(s);
    } 
  
}

//This function will split the text up into multiple words, and decide how to animate depending on the length of each word and also pauses which are denoted by "!"
void respond(String input){
  if (input.length() > 0){  //we actually have something to say 
  voce.SpeechInterface.setRecognizerEnabled(false);    //stop listening, otherwise we will hear ourselves and go into a loop
  //this just splits up all the words sends motion
  String[] words = split(input," ");
  int howMany = words.length;
 
  for(int i=0;i<howMany;i++){
    String pieces[] = split(words[i],"!");  //if we see a ! then reading pauses slightly so it is a good time to blink
    if(pieces.length==2){
    lightPort.write("1");
    int pause = int(random(100));
    if(pause>60){
      lightPort.write("5");
    }
    else{
      lightPort.write("7");
//      delay(500);
    }
    }
    else{
      lightPort.write("1");
    }
   
  }
  tts.speak(input);
  voce.SpeechInterface.setRecognizerEnabled(true);
}
}
