


//working with images and sound in processing
//Import Minim Library files
import ddf.minim.*;
//Declare global variables type
PImage rythme;
int count;
Minim minim;
AudioSample soundancing;
//Load audio file from my HDD to my setup block

//load an image file from HDD to my setup code
/*Not forget to add the file to my sketch data folder*/
void setup(){
  size(1280,720,P3D);
  rythme=loadImage("rythme.jpg");
  frameRate(60);
  fill(width ,height);
  rythme=loadImage("rythme.jpg");
 count = 0;
minim=new Minim(this);
soundancing=minim.loadSample("soundancing.wav");

 }
 //Create a key press
 void keyPressed(){
   if(key=='b')soundancing.trigger();
   if(key=='b')println("sample triggered");
 }

//Draw the image to the screen at (width,height)
void draw(){
  count=count +200;
  image(rythme, 0, 0, width, height);
  translate(width/2,height/2);
  rotate(radians(count));
  rythme=loadImage("rythme.jpg");
  stroke(255, 0, 0);
  strokeWeight(10);
  sphere(450);
}





