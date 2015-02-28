
/**
 * Sequential
 * by James Patterson.  
 * edited by ErrorbyErrors
 * Displaying a sequence of images creates the illusion of motion. 
 * Twelve images are loaded and each is displayed individually in a loop. 
 */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

int numFrames = 12;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup()
{
  size(500, 400);
  minim = new Minim(this);
  player = minim.loadFile("marcus_kellis_theme.mp3");
  player.play();
  
    fft = new FFT(player.bufferSize(), player.sampleRate());
  
  imageMode(CENTER);

  images[0]  = loadImage("runner_00.gif");
  images[1]  = loadImage("runner_01.gif"); 
  images[2]  = loadImage("runner_02.gif");
  images[3]  = loadImage("runner_03.gif"); 
  images[4]  = loadImage("runner_04.gif");
  images[5]  = loadImage("runner_05.gif"); 
  images[6]  = loadImage("runner_06.gif");
  images[7]  = loadImage("runner_07.gif"); 
  images[8]  = loadImage("runner_08.gif");
  images[9]  = loadImage("runner_09.gif"); 
  images[10] = loadImage("runner_10.gif");
  images[11] = loadImage("runner_11.gif"); 

  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  //for(int i=0; i<numFrames; i++) {
  //  String imageName = "PT_anim" + nf(i, 4) + ".gif";
  //  images[i] = loadImage(imageName);
  //}
  fft.linAverages(128);
} 

void draw() 
{ 
  background(255);
  stroke(random(255), random(255), random(255));
  fft.forward(player.mix);

  for (int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, height/2 + player.left.get(i)*100, x2, height/2 + player.left.get(i+1)*100 );
  }

int sum = 0;

for (int i = 0; i < fft.avgSize(); i++) {
 sum += fft.getAvg(i); 
}

println(sum);

  frameRate(map(sum, 0, 300, 10, 50));
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], width/2, height/2);
}

void mousePressed() {
  saveFrame("ErrorsFlocking-######.png");
}


