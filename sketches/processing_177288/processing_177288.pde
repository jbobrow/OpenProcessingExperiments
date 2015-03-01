
int counter;

 //working with sound in processing
//Import Minim library files
import ddf.minim.*;
//Declare global variables
Minim minim;
AudioSample soundancing;
//Load audio files from HDD to my setup block
void setup(){
  minim=new Minim(this);
 soundancing= minim.loadSample("soundancing.wav");
 }
//Draw code block (anything goes)
void draw(){
  background(0);
}
//Create a key trigger
void keyPressed(){
  if(key=='b')soundancing.trigger();
  if(key=='b')println("sample triggered");
}
  

