
/*
This is a program that draws audio wave forms and plays
a sound with the volume corresponding to the amplitude.

Tyler Sinclair, Exercise 4
*/

//setup audio
import ddf.minim.spi.*; 
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
AudioPlayer player;

//measure distance of top line to be reflected
float d; //(makes the negative amplitude of the sound wave)

void setup() {
  size(1200, 400);
  background(255);
 
  Minim minim = new Minim(this); //load player
  player = minim.loadFile("250.wav");
  
}

void draw() {
  
  if (mousePressed) {  
    strokeWeight(5);
    stroke(255, 100, 255);
    line(0, height/2, width, height/2);
    strokeWeight(2);
    line(mouseX, 200, mouseX, mouseY);
    d = dist(mouseX, 200, mouseX, mouseY);
    println(d);
    line(mouseX, 200, mouseX, mouseY + d*2);
     
    //println(d);
    //player.setVolume(d); // apparently volume is not supposrted by processing?????
    //println(d);
    player.unmute(); 
    player.play(int(d));
    

  } else {
    background(153, 0, 76); //reset background
    player.mute(); //mutes sound
    
  }
  
}



