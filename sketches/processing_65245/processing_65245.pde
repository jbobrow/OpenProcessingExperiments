
import netscape.javascript.*;
import ddf.minim.*;
AudioPlayer player ;
Minim minim;
 
PImage lupin1;
PImage lupin2;
PImage lupin3;
PImage lupin4;
PImage ataud3;
  
float xpos;
float ypos;
float drag = 30;
  
void setup () {
  size (400,419);
   minim = new Minim (this);
  lupin1 = loadImage ("lupin6.jpg");
  lupin2 = loadImage ("lupin7.jpg");
   player = minim. loadFile ("lestat.mp3",2500);
   player.play ();
}
void draw() {
   if (mousePressed == true) {
  image (lupin2,xpos, ypos);
}else {
  image (lupin1, xpos, ypos);
}
}

