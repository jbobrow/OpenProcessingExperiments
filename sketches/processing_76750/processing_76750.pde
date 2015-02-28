
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
 import ddf.minim.*;
AudioPlayer player;
Minim minim;

int transparency1;
int transparency2;
int transparency3;
int transparency4;
int fedspeed = 5;
 
void setup(){
   minim = new Minim(this);
  
  size(640,480);
  transparency1 = 255;
  transparency2 = 0;
  transparency3 = 0;
  transparency4 = 0;
  img = loadImage("1a.jpg");
  img1 = loadImage("2a.jpg");
  img2 = loadImage("3a.jpg");
  img3 = loadImage("a.jpg");
  img4 = loadImage("4a.jpg");
    player = minim.loadFile("music.mp3");
  player.play();
}
 
void draw(){
 
  
  background(255);
  tint(255,255,255,transparency1);
  image(img, 0, 0, width, height);
  if(transparency1 > 0){
    transparency1--;
  }
  tint(255,255,255,255-transparency1);
  image(img1, 0, 0, width, height);
   
  
  tint(255,255,255,transparency2);
  image(img2, 0, 0, width, height);
  if((transparency1 == 0) && (transparency2 < 255)){
    transparency2+= fedspeed;
  }
   
    tint(255,255,255,transparency3);
  image(img3, 0, 0, width, height);
  if((transparency2 > 0)&&(transparency3 < 255)){
    transparency3+= fedspeed;

  }
  tint(255,255,255,transparency4);
  image(img4, 0, 0, width, height);
  if((transparency3 > 0)&&(transparency3==255)){
    transparency4+= fedspeed;
  }
 
}



