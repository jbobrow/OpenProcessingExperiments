
import ddf.minim.*;//declare
PImage img;
AudioPlayer player;
Minim minim;
 
void setup(){
  img=loadImage("record_player_istock.jpg");
  image(img,0,0);
  size(640,480,P2D);
  minim=new Minim(this);
 player=minim.loadFile("Weirddough - Remedy.mp3");//locate file
 player.play();//when opened play this
}
 
void draw(){
   if (mousePressed==true){// click to stop music
  player.close();
  minim.stop();
  super.stop();
   }}
   






