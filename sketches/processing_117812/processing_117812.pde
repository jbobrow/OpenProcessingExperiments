
//Hung Wing Chu Charlie
//52627887

import ddf.minim.*;

PImage bg, img1, img2, tv1, tv2, tv3;

Minim minim;
AudioPlayer laugh, song;

void setup() {
  size(600, 400);
  background(255);
  imageMode(CENTER);
    
  minim = new Minim(this);
  laugh = minim.loadFile("haha.wav");
  song = minim.loadFile("dream.wav");
  
  bg = loadImage("TV-05.png");
  img1 = loadImage("on.png");
  img2 = loadImage("off.png");
  tv1 = loadImage("001.jpg");
  tv2 = loadImage("002.jpg");
  tv3 = loadImage("003.jpg");
  
  image(bg, 300, 200);
}


void draw() {
  on();
  off();
  
  if (keyPressed == true) {
    if (key == '1') {
      image(tv2, 184.5, 189);
      laugh.play(); 
    }
      else if (key == 'p') {
    if (laugh.isPlaying()) 
        laugh.pause();
    else
    laugh.play();
  }
    
   if (key == '2') {
      image(tv3, 184.5, 189);
    }
    
   if (key == '3') {
      image(tv1, 184.5, 189);
      song.play();
   }
       else if (key == 'o') {
    if (song.isPlaying())
    song.pause();
    else
    song.play();
  }
 }
}


//User-defined function
//To display the images
void on() {
  image(img1, 428, 335);
}

void off() {
  image(img2, 520, 335);
}

//Audio download from youtube
//Images search on google
//Illustration created by me


