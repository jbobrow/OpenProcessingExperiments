
//Import 'Minim' libray files
import ddf.minim.*;
//Declare global variables
Minim minim;
AudioPlayer bells;
PImage wallpaper;
PImage stars;
PImage winter1;
PImage winter2;
PImage winter3;
PImage winter4;
PImage winter5;
PImage winter6;
PImage winter7;
//Load audio file from HDD
//Load wallpaper desktop
void setup(){
  size (665, 500);
  minim = new Minim (this);//find a new minim
  bells = minim.loadFile("bell.mp3");//add file frrom sketch
  bells.play();//playback the audio
  wallpaper = loadImage("wallpaper.jpg"); 
}

//Draw code block 
void draw () {
image (wallpaper, 0, 0);
//input keyboard
if (key == '1')
   {
    stars = loadImage("stars.png");
    image(stars,0, 0);}
    
if (key == '2'){
  winter1 = loadImage("winter1.jpg");
  image(winter1,10,10);}
if (key == '3'){
  winter3 = loadImage("winter3.jpg");
  image(winter3,10,10);}
 if (key == '4'){
  winter4 = loadImage("winter41.jpg");
  image(winter4,10,10);}
 if (key == '5'){
  winter5 = loadImage("winter5.jpg");
  image(winter5,10,10);}
 if (key == '6'){
  winter6 = loadImage("winter6.jpg");
  image(winter6,10,10);}
 if (key == '7'){
  winter7 = loadImage("winter71.jpg");
  image(winter7,10,10);}
//Text
String hw = "Winter Magic";
//Pfont and loadind external font
PFont lucidahandwritingitalic = loadFont("lucidahandwritingitalic.vlw");
textFont(lucidahandwritingitalic);
fill(#FFFAF5);
textSize(42);
textAlign(RIGHT);
text(hw, 340, 330);
//second row
String f = "Press 1-7";
textFont(lucidahandwritingitalic);
fill(#FFFAF5);
textSize(28);
textAlign(CENTER);
text(f, 140, 380);
}

   


