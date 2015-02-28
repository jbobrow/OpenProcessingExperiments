
//Code Modified from Roya Ramezani
 
 import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
AudioPlayer aSound;
AudioPlayer theSound;
 PImage img;
PImage img0;
PImage img1;
         stars a, b, c, d;
          float s, h;

 
 void setup(){
  size(700,509);
  noStroke();
  minim = new Minim(this);
  aSound = minim.loadFile("drive.mp3");
  aSound.play();
  aSound.loop();
    minim = new Minim(this);
  theSound = minim.loadFile("goodlife.mp3");

  
  img = loadImage("three1.jpg");
 img0 = loadImage("speech.png");
 img1 = loadImage("music.gif");
  a = new stars(700);
  a.show();
 
  b = new stars(500);
  b.show();
 
  c = new stars(300);
  c.show();
 
  d = new stars(100);
  d.show();
 
}


 
 void draw(){
background(img);

  fill(255);
 
   fill(random(255,200),random(255,200),random(255,200),random(255,200));
 
 
  a.stars(2, 1);
 
  b.stars(4, 2);
 
  c.stars(6, 5);
 
  d.stars(8, 10);

   
}

 
 class stars
{
  int starAmount = 1000;
  Star[] star = new Star[starAmount];
 
  stars(int a)
  {
    starAmount = a;
  }
 
  void show()
  {
 
    for (int i=0; i<starAmount; i++)
    {
      star[i]= new Star(random(0, width), random(0, height));
    }
  }
 
 
  void stars(int b, float c)
  {
    for (int d=0; d<starAmount; d=d+5)
    {
      star[d].move(b, c);
    }
  }
 
 
  class Star
  {
 
    float x, y, z, p, p2;
 
 
    Star(float r, float t  )
 
    {
      p = r;
      y = t;
    }
 
 
    void move(int j, float k)
    {
      float p2 = p + x;
      y +=x;
       
      ellipse(p2, y, 1.5*j, 1.5*j);
 
       
       
      if (y < 0)
      {
        y = y + height;
      }
 
      if (y > height)
      {
        y = y - height;
      }
       
      
      y = y + k;
    }
  }
}
void mouseDragged(){
  if (mouseX < 600 && mouseX > 300){
  image (img0, 100, 25, 280, 148);
}
}

void mousePressed(){
  if (mouseButton == LEFT && mouseX < 550 && mouseX > 350){
    minim = new Minim(this);
  mySound = minim.loadFile("oh.mp3");
  mySound.play();
}
}
void keyPressed(){
 if (key == '1'){
   theSound.play(); 
  theSound.loop();
  
  }
if (key == '2') {
if (theSound.isPlaying()) {
      theSound.pause();
    }
    else {
      theSound.play();
    } 
  }
}

    

 
void stop(){

  minim.stop();
  super.stop();
}

