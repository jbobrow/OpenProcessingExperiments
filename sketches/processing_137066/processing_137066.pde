
import ddf.minim.*;


//Working with images and sound

//Import library for sound

//Declare PImage
PImage fotito;
Minim minim;
AudioPlayer blackAngel;
//load the image and audio
void setup(){
  size(1000,500);
  fotito = loadImage("lou-reed.jpg");
  minim=new Minim(this);
  blackAngel = minim.loadFile("blackangel.mp3");
  blackAngel.play();
}

//Draw the image
void draw(){
  image(fotito,0,0,1000,500);
}

