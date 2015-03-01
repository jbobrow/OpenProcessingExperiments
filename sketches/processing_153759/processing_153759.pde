
// First Project submission for Creative Programming
// Fell free to tweak :) Linux Hierro - tzuktzak@gmail.com 04 July 2014
// Please do not delete the line above just add - Thank you :)
// :( Disabled the sound just to work with JavaScript :(

//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

//Minim minim;
//AudioPlayer player;

SineWave wave1 = new SineWave(250, 300, 10);
SineWave wave2 = new SineWave(350, 150, 5);
SineWave wave3 = new SineWave(50, 150, 2);

int nFrames = 10;  // Jet fighter animation
int cFrame = 0;

PImage[] images0 = new PImage[nFrames];
PImage imgdown;
PImage imgtop;
PImage imx;
 
  void setup() {
  size(800, 600, P2D);
  smooth();

//{
//  minim = new Minim(this);
//  player = minim.loadFile("weapon01.wav");
//}

  images0[0]  = loadImage("s10.png");
  images0[1]  = loadImage("s11.png");
  images0[2]  = loadImage("s12.png");
  images0[3]  = loadImage("s13.png");
  images0[4]  = loadImage("s14.png");
  images0[5]  = loadImage("s15.png");
  images0[6]  = loadImage("s16.png");
  images0[7]  = loadImage("s17.png");
  images0[8]  = loadImage("s18.png");
  images0[9]  = loadImage("s19.png");
  
  imgdown = loadImage("back01.jpg");
  imgtop = loadImage("backup.png");
  imx = loadImage("s10.png");
 }
 
void draw() {
  background(0);
  image(imgdown, 0, 0);
  
  cFrame = (cFrame+1) % nFrames;
   
  noStroke();
  rect(0, 0, height, width);
  noFill();
  stroke(255,255,255, 35);
  for (int y = 0; y < height; y += 10) {
    beginShape();
    for (int x = 0; x <= width; x += 7) {
      float a = (wave1.amplitude(x, y) + wave2.amplitude(x, y) + wave3.amplitude(x, y)) * random(6, 16);
      vertex(x, y + a);
    }
    endShape();
  }
   image(imgtop, 1, 2);

   image(imx, mouseX, mouseY);
   
   if (mousePressed) {
   image(images0[(cFrame+0) % nFrames], mouseX, mouseY);
   
   // Draw a beam from jet fighter
  for (int y = 30; y <= height-20; y += random(120, mouseY)) {
  for (int x = 30; x <= width-20; x += random(120, mouseX)) {
  
  // Random Stroke Color and for jet fighter beam
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  color c1 = color(255 - random(128), 255 - random(128), 255 - random(128));
  stroke(c1, 30);
    line(mouseX+43, mouseY+58, x, y);
    line(mouseX+84, mouseY+71, x, y);
//    player.cue(0);
//    player.play();    
  }
  }
  }

}

class SineWave {
  float cx;
  float cy;
  float wavelength;
   
  SineWave(float cx, float cy, float wavelength) {
    this.cx = cx;
    this.cy = cy;
    this.wavelength = wavelength;
  }
   
  float amplitude(float x, float y) {
    float dx = x - this.cx;
    float dy = y - this.cy;
    return sin((sqrt(dx * dx + dy * dy) - frameCount) / this.wavelength);
  }   
}

 


