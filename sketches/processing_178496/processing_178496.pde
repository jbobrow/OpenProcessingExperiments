
import processing.video.*;
import ddf.minim.*;

AudioPlayer song;
Minim minim;

Capture cam;


void setup(){
  size(1280,720);
  
  minim = new Minim(this);
  
  song = minim.loadFile("4.mp3");
  song.play();

  
  
  
  cam = new Capture(this,1280,720,15);
  println(Capture.list());
  cam.start();
}

void draw(){
  if(cam.available()){
    cam.read();
  }
  
 // img.add();
  
  image(cam,0,0);
  if(mousePressed){
    saveFrame("data/####.jpg"); 
  }

}



