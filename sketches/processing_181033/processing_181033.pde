

import ddf.minim.*;


// Import 'Minim' library files

 
//Declare global variables
Minim minim;
AudioSample Butterfly;

 PImage Misha;



 
void setup () {
  minim = new Minim(this);
  Misha = loadImage("Misha.png");
  //Load audio file from HDD
  Butterfly = minim.loadSample("Butterfly.mp3"); /* key */
 

//Load an image from HDD


 size(1106, 700);
background(#FFFFFF);
}
 
//Draw code block 
void draw () {
image (Misha, 600, 50);

   if ( mousePressed ) drawPic();
  }
 
void drawPic () {
//switch(key){
  //case 'c':
    image(Misha, mouseX, mouseY);
    Butterfly.trigger();
     //}
} 



