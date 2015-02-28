
import ddf.minim.*;

Minim minim;

AudioPlayer background;
AudioSample music;

PImage img1 ,img2;

void setup()
{
  size(600,600);
  img1 = loadImage("n3.jpg");
  img2 = loadImage("cartoon2.png");
  minim =new Minim (this);
  
  music=minim.loadSample("comedy.mp3");

   
   background = minim.loadFile("cowboy.mp3");
  background.loop();

}
void draw(){
image(img1,0,0);


image(img2,mouseX,mouseX,120,120);

if (mousePressed)
music.trigger();

}






