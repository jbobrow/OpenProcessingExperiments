
//Declare image and string to put some order in the images uploaded
import ddf.minim.*;
Minim minim;
AudioSample Click;
PImage img;
int index = 0;
String pics[] =
{
  "img-1.jpg",
  "img-2.jpg",
  "img-3.jpg",
  "img-4.jpg",
  "img-5.jpg",
  "img-6.jpg",
  "img-7.jpg",
  "img-8.jpg",
  "img-9.jpg",
  "img-10.jpg",
  "img-11.jpg",
};
//Loading images and sound effect
void setup(){
 //I chose this heigh and width of image, because is the larger allowed within the instructions
 //Without the images deforming.
  size(1100, 716);
  img = loadImage(pics[index]);
  minim = new Minim(this);
  Click = minim.loadSample("paper.wav");
 
 
}
void draw(){
  image(img, 0, 0, width, height);
}

//key commands, same key to move on the slider, and same key to play the sound effect
void keyReleased(){
  if( key == ' '){
    tint(255,255,255,(255.0/width)*mouseX);
    Click.trigger();
    index++;
    if(index >= pics.length ) index = 0;
    img = loadImage(pics[index]);  
    }
}


