
//09/10/2013
//MOK Ka Yee Amanda
//SID 52622241

import ddf.minim.*;

Minim minim;
AudioSample effect1;
AudioSample effect2;
AudioPlayer music;
PImage img1, img2, img3;

void setup() {
  size(600, 400);
  imageMode(CENTER);
  noCursor();

  img1 = loadImage("start.png");
  img2 = loadImage("superman.png");
  img3 = loadImage("badman.png");
  
  minim = new Minim(this);
  music = minim.loadFile("bgm.mp3"); 
  effect1 = minim.loadSample("good.mp3");
  effect2 = minim.loadSample("bad.mp3");
  music.loop(); 

}



void draw()
{
  music.play();
  image(img1, 300, 200);
  
  if(keyPressed) {
   if(key == 'g')
        image(img2, 300,200); 
        effect1.trigger();
 }  

  if(keyPressed) {
   if(key == 'b')
        image(img3, 300,200); 
        effect2.trigger();

}  
}




