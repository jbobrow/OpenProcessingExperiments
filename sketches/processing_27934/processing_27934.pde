
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
BeatDetect beat;
//many thanks to the help of Ben Richards
PImage bflyImg;
PImage mouseImg;
PImage blankImg;
PImage growImg;

float diameter;
float space = 25;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  

  background(147,49,219);
  minim = new Minim(this);
  song = minim.loadFile("purpose.wav");
  song2 = minim.loadFile("butterland.wav");
  song.loop();
  beat = new BeatDetect();
  bflyImg = loadImage("images.gif");
  blankImg = createImage(1,1,ARGB);
  growImg = loadImage("aflower.gif");
  mouseImg = blankImg; 
  }
float distance;


void draw() {
  
  fill(111,7,80);
  rect(0,0,width,height);
  beat.detect(song.mix);
  if (beat.isOnset())
  {
  fill(7,79,137);
  rect(0,0,width,height);
  }
    
   {
      fill(101,160,35);
      translate(space/2,space/2);
      
      for(float x = 0; x <20; x = x+1)
      {
        for(float y = 0; y <20; y= y+1)
        {
          fill(14,85,43);
          diameter = dist(x*space, y*space,mouseX,mouseY)/10;
          quad(x *space,y *space,diameter,diameter,20,20,20,20);
          ellipse(x *space,y *space,diameter,diameter);
        }
      }
    }
 
 float butterflatter = 100*sin(frameCount*0.03);
 float one = mouseX+butterflatter;
 float two = mouseY+butterflatter;
 

  
  image(growImg,0,250);
  image(mouseImg, mouseX+butterflatter, mouseY+butterflatter);
  distance = dist(mouseX+butterflatter,mouseY+butterflatter,0,250);
  if(distance<100)
  {
   song2.play();
  }
 
 boolean collided  = true;
 if (one<100)
 {
   one=100;
   collided = true;
 }
 if (one>100)
 {
   one=100;
   collided = false;
 }
 if (two<100)
 {
   two=100;
   collided = true;
 }
  if (two>100)
  {
    two=100;
    collided = false;
  }
   if(collided)
  {
   song2.rewind();
  }

  if(mousePressed)
  {
    mouseImg = bflyImg;
  }
  else
  {
    mouseImg = blankImg;
  }
 
}
void stop() {

  song.close();
  song2.close();
  minim.stop();
  super.stop();
}


