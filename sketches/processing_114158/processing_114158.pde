
//refferencing from the example of animation: Sequential
//Source of horn sound effect: http://www.youtube.com/watch?v=p4uUGBOuXLU
//Source of background sound: http://www.youtube.com/watch?v=buRAU0roehw

//number of frames in this animation
int numFrames = 19; 
int frame = 0;
PImage[] images = new PImage[numFrames];


import ddf.minim.*;

Minim minim;
AudioSample horn;
AudioPlayer bgsound;

void setup() {
  size(430, 340);
  frameRate(8);
  minim = new Minim(this);
  horn = minim.loadSample("horn2.mp3");
  bgsound = minim.loadFile("Racing.mp3");
  bgsound.loop();
  
  //load the images
  images[0]  = loadImage("IMG_2934.JPG");
  images[1]  = loadImage("IMG_2935.JPG"); 
  images[2]  = loadImage("IMG_2936.JPG");
  images[3]  = loadImage("IMG_2937.JPG"); 
  images[4]  = loadImage("IMG_2938.JPG");
  images[5]  = loadImage("IMG_2939.JPG"); 
  images[6]  = loadImage("IMG_2940.JPG");
  images[7]  = loadImage("IMG_2941.JPG"); 
  images[8]  = loadImage("IMG_2942.JPG");
  images[9]  = loadImage("IMG_2943.JPG"); 
  images[10] = loadImage("IMG_2944.JPG");
  images[11] = loadImage("IMG_2945.JPG"); 
  images[12] = loadImage("IMG_2946.JPG");
  images[13] = loadImage("IMG_2947.JPG"); 
  images[14] = loadImage("IMG_2948.JPG");
  images[15] = loadImage("IMG_2949.JPG"); 
  images[16] = loadImage("IMG_2950.JPG");
  images[17] = loadImage("IMG_2951.JPG"); 
  images[18] = loadImage("IMG_2952.JPG");
}

void draw() {
  background(0);
   frame = (frame+1) % numFrames;  //keep looping the photos
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) {
    image(images[(frame+offset) % numFrames], 0, 0, width, height);
    offset+=2;
  }
  //Press any key to produce the horn sound effect
  if (keyPressed)
    horn.trigger();
}

