
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
  //lupin3 = loadImage ("lupin3.gif");
  //lupin4 = loadImage ("lupin4.gif");
  //ataud3 = loadImage ("ataud3.jpg");
   player = minim. loadFile ("lestat.mp3",2500);
   player.play ();
}
void draw() {
  //background (ataud3);
  //if (mousePressed == true) {
    //image(lupin4, xpos, ypos);   //aca poner imagen 1
  //} else {
    //image(lupin3,xpos,ypos);  //aca poner imagen 2
  //} else {
   // image(lupin2, xpos,ypos);
  //} else {
    //image {lupin1, xpos,ypos);
    //}
   //rect(25, 25, 50, 50);
 
   if (mousePressed == true) {
  image (lupin2,xpos, ypos);
}else {
  image (lupin1, xpos, ypos);
}
}
  //}  else {
    //lupin3 = loadImage ("lupin3.gif");
  //} else {
    //lupin4 = loadImage ("lupin4.gif");
  //}
 

