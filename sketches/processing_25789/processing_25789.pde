
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;


int numFrames = 13;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage b;
PImage s;
PImage j;

void setup()
{
  
  b = loadImage("enchtrees.jpg");
  s = loadImage("darkenchtrees.gif");
  j = loadImage("rainbowtrees.jpg");
  
  size(500,500);

  
  images[0] = loadImage("d0000.gif");
  images[1] = loadImage("d0001.gif");
  images[2] = loadImage("d0002.gif");
  images[3] = loadImage("d0003.gif");
  images[4] = loadImage("d0004.gif");
  images[5] = loadImage("d0005.gif");
  images[6] = loadImage("d0006.gif");
  images[7] = loadImage("d0007.gif");
  images[8] = loadImage("d0008.gif");
  images[9] = loadImage("d0009.gif");
  images[10] = loadImage("d0010.gif");
  images[11] = loadImage("d0011.gif");
  images[12] = loadImage("d0012.gif");
  
  
  minim = new Minim(this);
song = minim.loadFile("05 Lotus Flower.MP3");
  song.play();
  
 song2 = minim.loadFile("Lights (Bassnectar Remix).mp3");
  

  
}

void draw() { 
  image(b, 0, 0);
  
  
  
  
  
  if (mousePressed == true) {
    song.pause();
   song2.play();
      
    image(j, 0, 0);
    frameRate(11);
    
    
  } else {
    song2.pause();
    song.play();
    
    frameRate(1.8);
  
  }
  

    
  
  frame = (frame+1) % numFrames;  
  image(images[frame], 20, 311);
  

  
 frame = (frame+20) % numFrames;  
  image(images[frame], 150, 280);
}
          
void stop()
{
  song.close();
  song2.close();
  minim.stop();
  
  super.stop();

      
    
     }
  



//libraray> minim > load file : on processing libraries for sound
//import library

