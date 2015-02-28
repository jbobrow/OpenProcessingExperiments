

PImage bg,pic1;//http://www.michadel.net/blog/%E6%B8%85%E5%A2%83%E4%BA%94%EF%BC%9A%E5%82%B3%E7%B5%B1%E5%BA%95%E7%89%87%E7%9A%84%E6%84%9F%E8%A6%BA%E5%B0%B1%E6%98%AF%E4%B8%8D%E4%B8%80%E6%A8%A3/

import ddf.minim.*;
 
Minim minim;
AudioSample yeah;
AudioPlayer banana;// 'Banana'is the bg-music
 

void setup() { 
size(1000,800);//resize the background n load the background
  bg = loadImage("BG.jpg");
  bg.resize(1000,800);
  pic1= loadImage("ChipnDal.png");


  minim = new Minim(this);//load the bg-music n sound effect
  yeah = minim.loadSample("Ohyeah.wav");
  banana = minim.loadFile("Banana.wav");
  banana.loop();
}
 
 
void draw() {
background(bg);
if (mousePressed) 
 yeah.trigger();
 background(bg);
 image(pic1,mouseX,mouseY,200,200);// Chip n Dale will follow the mouse
 
}

