
import ddf.minim.*;
//add background music
AudioPlayer bmusic;
float [] buffersizeL = new float[1024];
float [] buffersizeR = new float[1024];
float speed = 0.4;
float trans [] = new float [1024];
 
 
//add drum effect
AudioPlayer player;
Minim minim;
Drum[] Drums;
int numDrums = 20;
int currentDrum = 0;
int col = 0;
 
 
void setup() {
  minim = new Minim(this);
  player = minim.loadFile("snare.wav");
  player.play();
  bmusic = minim.loadFile("Sonatine.mp3", 1024);
  bmusic.play();
  background(0);
  size(800, 500);
  smooth();
  Drums = new Drum[numDrums];
  for (int i=0; i < numDrums; i++) {
    Drums[i] = new Drum();
  }
}
void mousePressed() {
  col+=20;
  col%=255;
  player.rewind();
  player.play();
  Drums[currentDrum].start(mouseX, mouseY);
  currentDrum++;
  if (currentDrum >= numDrums) {
    currentDrum = 0;
  }
}
 
//every 3frame start to play drum music and create new drum when mousedraged
void mouseDragged() {
  if (frameCount % 3 == 0) {
 
    col+=20;
    col%=255;
    player.rewind();
    player.play();
    Drums[currentDrum].start(mouseX, mouseY);
    currentDrum++;
    if (currentDrum >= numDrums) {
      currentDrum= 0;
    }
  }
}
 
 
void draw() {
  fill(0, 17);
  noStroke();
  rect(0, 0, width, height);
  //drawing waveform
  for (int k = 0 ; k < 1023 ; k++)
  {
    float left1 =  bmusic.left.get(k) *500;//get lift buffer size
 
    float right1 = bmusic.right.get(k) *500;//get rightbuffer size
    buffersizeL[0] = left1;
    buffersizeR[0] = right1;
    buffersizeL[0] = left1;
    buffersizeR[0] = right1;
 
 
    buffersizeL[1023 -k]   = buffersizeL[1023 -k-1];
 
 
    buffersizeR[1023 -k]   = buffersizeR[1023 -k-1];
    trans[k] =  150 - k*0.3;
  colorMode(RGB);
    strokeWeight(k*0.01);
    stroke(0.5, 0.5, 256, trans[k]*0.5);
    line(k, buffersizeL[k], k+1, buffersizeL[k+1]);
    stroke(0.001, 256, 256, trans[k]*0.5);
    line(width -k, buffersizeR[k], width-k, buffersizeR[k+1]);
  }
 
 
  //drawing drums
  for (int i=0; i < numDrums; i++) {
    Drums[i].update();
    Drums[i].show();
  }
}
 
void stop()
{
  bmusic.close();
  minim.stop();
  super.stop();
}

