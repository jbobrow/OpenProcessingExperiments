
//import fullscreen.*;
import japplemenubar.*;
//FullScreen fs;

import ddf.minim.*;
PImage[] images;
AudioPlayer[] sounds;
Minim minim;



void setup(){
  size(1440,900);
  background(#99ffcc);
// fs = new FullScreen(this); 
// fs.enter(); 

  minim = new Minim(this);

images = new PImage[6];
sounds = new AudioPlayer [6];

sounds[0]= minim.loadFile("clip1.mp3");
sounds[1]= minim.loadFile("clip2.mp3");
sounds[2]= minim.loadFile("clip3.mp3");
sounds[3]= minim.loadFile("clip4.mp3");
sounds[4]= minim.loadFile("clip5.mp3");
 
 for ( int i = 0; i< images.length; i++ )
  {
    images[i] = loadImage( i + ".png" );
  }

  for(int i=1; i < images.length; i++) {
    image(images[i],200*i+20,400);
  }
}




void draw(){
  if(mouseX > 220 && mouseX < 300) { 
    if(mouseY>400 && mouseY<480){
    sounds[0].play();
   // sounds[0].loop(1); 
   // minim.stop();
  }
  }

  if(mouseX > 420 && mouseX < 500) { 
    if(mouseY>400 && mouseY<480){
    sounds[1].play();
 //   sounds[1].loop(1); 
 //   sounds[1].close();
  }
  }

  if(mouseX > 620 && mouseX < 700) { 
    if(mouseY>400 && mouseY<480){
    sounds[2].play();
    //sounds[2].loop(); 
  }
  }

    if(mouseX > 820 && mouseX < 900) { 
    if(mouseY>400 && mouseY<480){
    sounds[3].play();
    //sounds[3].loop(); 
  }
  }

if(mouseX > 1020 && mouseX < 1100) { 
    if(mouseY>400 && mouseY<480){
    sounds[4].play();
    //sounds[4].loop(); 
  }
  }

}



//void stop() // this is a function required by minim
//{
//  sounds[1].close(); // you have to close all your files at the end
//  sounds[2].close();
//  sounds[3].close();
//  sounds[0].close();
//  minim.stop(); // stop the minim player
//  super.stop(); // stop all the sounds
//}

