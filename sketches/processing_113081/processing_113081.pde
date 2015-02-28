
PImage img, img1, img2;
float angle, v;
int cols, rows, interval = 50;
int [] [] diameters;  // Declare 2D array
import ddf.minim.*;
Minim minim;
AudioPlayer file;

void setup() {
  size(400,400);
  // images are taken from http://www.cherrybam.com/
  img = loadImage("rilakkuma003.png");  
  img1 = loadImage("rilakkuma018.png");
  // AudioPlayer
  minim = new Minim(this);   
  file = minim.loadFile("duckjob.wav", 2048);
  // Pattern of background
  cols = int(width/interval);
  rows = int(height/interval);
  diameters = new int[cols][rows];  // Create
  // Initialize values of 2D array diameters
  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j ++){
      diameters[i][j] = int(random(5, 15));
    }
  }
  noStroke();
  frameRate(2);
}

void draw() {
  background(255);    //set the background to whitle color
  
  textSize(30);
  text("Click P !", 200,250);
  text("Listen~", 200, 300);
  
  for (int i = 0; i < cols; i ++){
    for (int j= 0; j < rows; j ++) {
      fill(random(200,255), random(255), random(255), random(255));
      ellipse(i*interval, j*interval, diameters[i][j], diameters[i][j]);
    }
  }
  v += 10;
  if (v > width) {
    v = -width;
  }
  image(img1, v, 0, img.width/3, img.height/4);
  
  angle += 0.5;
  translate(80,250);  //Set the centre of rotation
  rotate(angle);
  image(img, -100, -100, img.width/4, img.height/4);

}

void keyPressed() {
  if ( key == 'p' ) { 
    file.rewind();
    file.play();
  }
  else {
    if (file.isPlaying())
      file.pause();
    else
      file.play();
  }
}


