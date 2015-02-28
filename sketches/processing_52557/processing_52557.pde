
import ddf.minim.*;
import ddf.minim.analysis.*;
int numFrames = 472; // The number of animation frames
PImage[] images = new PImage[numFrames]; // Image array
Minim minim;
AudioPlayer rob;
FFT song;
void setup(){
  size(640,440, P2D);
  frameRate(3); // Maximum 30 frames per second
  for(int i = 0; i < images.length; i++){
    // Construct the name of the image to load
    String imageName = "" + nf(i,1) + ".jpg";
    // nf(int/float value, digit) function
    images[i] = loadImage(imageName);
    // minim = new Minim(this);
 
  }
  minim = new Minim(this);
  rob = minim.loadFile("cock_chest.mp3", 2048);
  rob.loop();
  rob.play();
  song = new FFT(rob.bufferSize(), rob.sampleRate());
  song.linAverages(125);
  rectMode(CORNERS);
}

void draw(){
  // Calculate the frame to display, use % to cycle through frames
  int frames = frameCount % numFrames;
  image(images[frames],0,0); 
  
  fill(255);
  song.forward(rob.mix);
  int w = int(song.specSize()/125);
  for(int i = 0; i < song.avgSize(); i++)
  {
    rect(i*w, height, i*w + w, height - song.getAvg(i)*6);
  }  
}

void stop(){
  rob.close();
  minim.stop();
  super.stop();
}

