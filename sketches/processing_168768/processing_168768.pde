
int numFrames = 12; // The number of animation frames
int frame = 0; // The frame to display
PImage[] images = new PImage[numFrames]; // Image array
  
void setup() {
  size(1400, 800);
  setupAudio();
  frameRate(15); // Maximum 15 frames per second
  images[0] = loadImage("Jellie_1.png");
  images[1] = loadImage("Jellie_2.png");
  images[2] = loadImage("Jellie_3.png");
  images[3] = loadImage("Jellie_4.png");
  images[4] = loadImage("Jellie_5.png");
  images[5] = loadImage("Jellie_6.png");
  images[6] = loadImage("Jellie_7.png");
  images[7] = loadImage("Jellie_8.png");
  images[8] = loadImage("Jellie_9.png");
  images[9] = loadImage("Jellie_10v2.png");
  images[10] = loadImage("Jellie_11.png");
  images[11] = loadImage("Jellie_12.png");
}
void draw() {
  getVolume();
  int frame = int(map(volume, 0, 100, 0, 11));
  int countdown = int(map(volume, 0 , 100, 0, 11));
  
  if (frame >= 12) {
    frame = 11;
  };
  //frame++;
//  if (frame >= numFrames) { // If we've reached the 12th frame, start over
//    frame = 11;
  //}
  println(volume);
  println(frame);
  image(images[frame], 0, 0);
}

// Don't worry about understanding the stuff below!
import ddf.minim.*;
 
Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0; 
 
//-------------------------------------
void setupAudio(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}
 
//-------------------------------------
void getVolume(){
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
}
 
//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
}


