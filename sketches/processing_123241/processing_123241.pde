
//Working with images and sound in processing

/*  i call my sketch " WHY "
In my work here i try to use some images and blended 
them together and use one letter text WHY ! . A question 
i ask about why this is happening in the world which became
as a small village and considered to be civilized. The dirty 
political actions done by some entities to get more money 
and to set some countries below humanity life through
playing with the HUNGER and WAR games. The poor countries
leaders are one of thoseare responsible for what happening. 
The poverty and weapons dealers play important rolein these
games. We see everyday a disaster happen here and their as 
in Somalia , and Afghanistan; etc. These weapons; how they
get there?who are behind that?how could a human being agree 
with these actions? did we lose our humanity? what shall we do?
how we stop HUNGER and WAR games?. My work here show 
the misery of some people, and the death everywhere .
If these people did not die from hunger they died by weapons.
A movie of real life of those may move ourselves to do more to 
them, i know there are many organizations try to do their best
but the snake head is still squirt the poison.I used audio with
crying women ,children and a voice question WHY?

*/

/*
-When key p pressed The word WHY appears in Consol
area of the sketch.
-When key z pressed The word HUNGER GAMES
appears in Consol area of the sketch.
-When the w key pressed the loaded audio file used
in the sketch is start to play.
-When t key pressed it takes a screen shot image in the
saved sketch folder.
-When r key pressed it saves the sketch as pdf file in the
saved sketch folder.

*/
//Import 'Minim' liberary files
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Declare global variables
import processing.pdf.*; 
PImage x;
Minim minim;
AudioSample w;


//load an image and audio files from HHD
void setup() {
  background (0);
 size(950,650); 
 fill(#F70202);
 textSize(30);
x= loadImage("why.png");
  beginRecord(PDF, "file.pdf");

 minim = new Minim (this);
w = minim.loadSample("why.wav");
 //w.play();
}

//Draw the image to the screen
void draw (){
 image(x,25,25); 
}

 //mouse Input
 void mousePressed(){
   if ( mousePressed == true){
     text ("HUNGER",0,25);
     text ("WHY!",875,25);
     text ("WARS",0,650);
     text ("WHY!",875,650);     
   }
  }
  
  //keyboard Input
void keyPressed (){
  if ( key == 'w'|| key=='W') w.trigger();
  if ( key == 'p'|| key=='P') println("WHY");
  if ( key == 'z'|| key=='Z') println ("HUNGER WAR GAMES");
  if ( key == 't'|| key=='T') saveFrame("screenshot.png");
  if ( key == 'r'|| key=='R')  endRecord();      
}

