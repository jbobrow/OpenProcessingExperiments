
//import the two libraries
import guru.ttslib.*;
import processing.serial.*;
//give our instances names
Serial treePort;
TTS tts;

//a default message
String message = "Ho Ho Ho";
String articulation = "111546";

void setup() {
  //start our port and also tts
  treePort = new Serial(this,Serial.list()[0],9600);
  tts = new TTS();
  //the following settings control the voice sound
  tts.setPitch( 200 );
  tts.setPitchRange( 20 );
  tts.setPitchShift( -10.5 );

}

void draw() {
  //this just blinks the lights to make it look like a regular tree
  treePort.write("7");
  delay(1000);
  treePort.write("6");
  delay(1000);
}

void mousePressed() {
  //open the robots eyes and stop blinking, lights on if they were off
  treePort.write("73");
  delay(900);  //delay to allow eyes to open
  treePort.write(articulation);  //write the current articulation to the port, i.e. send commands
  tts.speak(message);  //speak the message string
 
}

void keyPressed(){
  //the following changes the message and the articulation when we press the number keys
if(key=='1'){
   articulation = "111546";
   message = "Ho Ho Ho";
}
if(key=='2'){
   articulation = "225546";
  message = "Merry Christmas!!";
}
if(key=='3'){
   articulation = "1112546";
  message = "Have you been naughty";
}
if(key=='4'){
   articulation = "225546";
  message = "Bah humbug!";
}
if(key=='5'){
   articulation = "2246";
  message = "What do you want?";
}
if(key=='6'){
   articulation = "26157262756373564";
  message = "I wanna wish you! a Merrrrrry Christmas!";
}
if(key=='7'){
   articulation = "215363736373546";
  message = "Jingle Bells!";
}

}
