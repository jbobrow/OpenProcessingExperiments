

int numFrames = 7;
int frame = 0;
PImage[] image = new PImage [numFrames];

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup () {

  minim = new Minim(this);
player = minim.loadFile("alcoholic.mp3");
player.play();
player.loop();
player.setGain (6);

size (640, 360);
background (0);
smooth ();
frameRate (10);

imageMode (CORNER);
image[0] = loadImage("drag01.jpg");
image[1] = loadImage("drag02.jpg");
image[2] = loadImage("drag03.jpg");
image[3] = loadImage("drag04.jpg");
image[4] = loadImage("drag01.jpg");
image[5] = loadImage("drag02.jpg");
image[6] = loadImage("drag03.jpg");

image[0] = loadImage("draginfo.jpg");
   image[1] = loadImage("draginfo.jpg");

}

void draw()
{
  frame = (frame + 1) % numFrames;
  image (image[frame], 0, 20);
  
 


    if (keyPressed) {
      if (key == 'x') {
        
      }
       

image[0] = loadImage("drag05.jpg");
image[1] = loadImage("drag06.jpg");
image[2] = loadImage("drag07.jpg");
image[3] = loadImage("drag08.jpg");
image[4] = loadImage("drag09.jpg");
image[5] = loadImage("drag10.jpg");
image[6] = loadImage("drag11.jpg");

           minim = new Minim(this);
player = minim.loadFile("chime.mp3");
player.play();
player.setGain (-15);


      
  frame = (frame + 1) % numFrames;
  image (image[frame], 0, 20);
 
 
  
    
    }

      
    }

