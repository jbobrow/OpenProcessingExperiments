
import ddf.minim.*;


// Import 'Minim' library files

 
//Declare global variables
Minim minim;
AudioSample Butterfly;

 PImage Arthem;



 
void setup () {
  minim = new Minim(this);
  Arthem = loadImage("Arthem.png");
  //Load audio file from HDD
  Butterfly = minim.loadSample("Butterfly.mp3"); /* key */
 

//Load an image from HDD


 size(1106, 700);
background(#FFFFFF);
}
 
//Draw code block 
void draw () {


   if ( mousePressed ) drawPic();
  }
 
void drawPic () {
//switch(key){
  //case 'c':
    image (Arthem, mouseX, mouseY);
    Butterfly.trigger();
     //}
} 



