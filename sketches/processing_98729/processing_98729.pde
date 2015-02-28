
float x=0;
float y=0;

//Music
import ddf.minim.*;
 
Minim minim;
AudioPlayer player;
 
void setup () {
  size(600, 600);
  colorMode(RGB);
  smooth();
   
//music cont.
  
minim = new Minim (this);
player = minim.loadFile ("MayBe.mp3");
player.play ();
}
 
void draw () {
  
  
  
  x+=0.02;
  y+=0.005;
  float n = noise(x);
  float t = noise(y);
 
  pushMatrix();
  stroke(100, 3, 11,20);
  translate(310, -140);
  rotate(.79);
  fill (60, 202, 216, t*4);
  rect(t*(width)-50, n*height+10, 50*n, height/2*n);
  rect( n*height+10, t*(width)-50, height/2*n, 50*n);
  popMatrix();
 
 
  pushMatrix();
  translate(300, 700);
  rotate(3.95);
  rect(t*(width)-50, n*height+10, 50*n, height/2*n);
  rect( n*height+10, t*(width)-50, height/2*n, 50*n);
  popMatrix();
  
}

//Reference:
//Matrix inspirational codes: http://www.openprocessing.org/sketch/87168
//Audio input code: http://www.creativecoding.org/lesson/topics/audio/sound-in-processing
//Music: May Be by Yiruma 

//The reason for this is to explore how emotions can be drawn visually within sound (music) environment
//As my final is all about connecting people and how community can support one to live honestly to themself


