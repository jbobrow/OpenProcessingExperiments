
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
int ballWidth = 48;
// Ball setup
Ball theBall = new Ball(random(1024), random(768), ballWidth);
 
void setup()
{
  // minim set up
  size(1024,768);
 
  // always start Minim first!
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("Lights - Ellie Goulding Dubstep Remix HD.mp3", 1024);
  song.play();
 
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
  
  
}
 
void draw()
{
 
  background(0);
  // first perform a forward fft on one of song's buffers
  // I'm using the mix buffer
  //  but you can use any one you like
  fft.forward(song.mix);
 /*
  stroke(255, 0, 0, 128);
  // draw the spectrum as a series of vertical lines
  // I multiple the value of getBand by 4 
  // so that we can see the lines better
  for(int i = 0; i < fft.specSize(); i++)
  {
    int j = i*2;
    line(j, height, j, height - fft.getBand(i)*4);
  }
  */
  
   //ball manipulation
  for(int i = 0; i < fft.specSize(); i++)
  {    
  theBall.w = fft.getBand(i)*3;
  
  theBall.move();
  theBall.display();
  }
 /*
  stroke(255);
  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < song.left.size() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  */
  
     
}
 
void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}


class Ball {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  float gravity;
  float w;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    xspeed = .01;
    yspeed = .01;
    //gravity = 0.1;
  }
  
    void move() {
    // Add gravity to speed
    // yspeed = yspeed + gravity;
    // Add speed to x&y location
    x = x + xspeed;
    y = y + yspeed;
    // If square reaches edge
    // reverse speed
    if (x > width) {
      xspeed = xspeed * -1.0;
      x = width;
    }
    else if (x < 0) {
      xspeed = xspeed * -1.0;
      x = 0;
    }
    if (y > height) {
      yspeed = yspeed * -1.0;
      y = height;
    }
    else if (y < 0) {
      yspeed = yspeed * -1.0;
      y = 0;
    }
    }
  
  void display() {
    // Display the circle
    this.fillColor(w);
    //stroke(255,255,255);
    ellipse(x,y,w,w);
  }
  
  void fillColor(float w) {
    int k = 2;
    if (w < k*10){
    fill(255,0,0,127); //red
    stroke(255,0,0,127);
    }
    else if (w < k*20){
    fill(255,165,0,127); //orange
    stroke(255,165,0,127);
    }
    else if (w < k*30){
    fill(255,255,0,127); //yellow
    stroke(255,255,0,127);
    }
    else if (w < k*40){
    fill(0,128,0,127); //
    stroke(0,128,0,127);
    }
    else if (w < k*50){
    fill(0,0,255,127); //blue
    stroke(0,0,255,127);
    }
    else if (w < k*60){
    fill(128,0,128,127); //purple
    stroke(128,0,128,127);
    }
  }
} 

