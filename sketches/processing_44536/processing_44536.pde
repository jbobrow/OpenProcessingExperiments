
import ddf.minim.*;//declare
PImage img;
AudioPlayer player;
Minim minim;

void setup(){
  img=loadImage("clock.jpg");//load img
  image(img,0,0);//image location
  size(800,600,P2D);//image size p2d(is sound involved)
  minim=new Minim(this);//start sound library
 player=minim.loadFile("buzz.mp3");//locate file
 player.play();//when opened play this
}

void draw(){
   if (keyPressed==true){//if key is pressed then player/sound will stop
   //like a snooze or off button on real alarms
  player.close();
  minim.stop();
  super.stop();
   }
}


