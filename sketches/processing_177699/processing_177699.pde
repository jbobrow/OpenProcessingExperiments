
// Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
//AudioPlayer bond; /* automatic */
AudioSample catherine_sound;
AudioSample jennifer_sound;
AudioSample margaret_sound;
AudioSample timothy_sound;  

PImage canvas_back;

PImage catherine_pic;
PImage jennifer_pic;
PImage margaret_pic;
PImage timothy_pic;


void setup () {
  minim = new Minim(this);
  //Load audio file from HDD
  catherine_sound = minim.loadSample("catherine.wav"); /* key */
  jennifer_sound = minim.loadSample("jennifer.wav"); /* key */
  margaret_sound = minim.loadSample("margaret.wav"); /* key */
  timothy_sound = minim.loadSample("timothy.wav"); /* key */

//Load an image from HDD
size ( 1106  , 621) ;
canvas_back = loadImage("canvas.png");
catherine_pic = loadImage("catherine.png");
jennifer_pic = loadImage("jennifer.png");
margaret_pic = loadImage("margaret.png");
timothy_pic = loadImage("timothy.png");

background(canvas_back);
}

//Draw code block 
void draw () {
  if ( mousePressed )
      drawPic () ;
  }

void drawPic () {
switch(key){
  case 'c':
    image(catherine_pic, mouseX, mouseY) ;
    catherine_sound.trigger();
    break;
  case 'j':
    image(jennifer_pic, mouseX, mouseY) ;
    jennifer_sound.trigger();
    break;
  case 'm':
    image(margaret_pic, mouseX, mouseY) ;
    margaret_sound.trigger();
    break;
  case 't':
    image(timothy_pic, mouseX, mouseY) ;
    timothy_sound.trigger();
    break;
  default :
    image(margaret_pic, mouseX, mouseY) ;
    margaret_sound.trigger();
   }
 } 


