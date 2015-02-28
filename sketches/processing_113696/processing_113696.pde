
import ddf.minim.*;
Minim minim;
AudioSample event;
AudioPlayer background;

PImage image;
void setup(){
  size(168,168);
  image = loadImage("man.jpg");// load the image
  minim = new Minim(this);
  event = minim.loadSample("es.mp3");//load the event sound
  background = minim.loadFile("bg.mp3");//load the bg music
  background.loop();//play the bg music
}

void draw(){
  image(image,0,0);//display the bg image
}

void mouseClicked(){
  event.trigger();
}//play the game, when you click the mouse ,the man will
//get shot and shout

