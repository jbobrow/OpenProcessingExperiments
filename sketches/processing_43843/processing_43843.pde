
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
    
void setup()
{
  size(500, 409);
PImage pot = loadImage("tumblr_ls5pzjtfoy1qzekdio1_500.jpeg");
 image(pot,0,0);
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("lm.aif");
  song.play();
}
 
void draw()
{

}
 
void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}

