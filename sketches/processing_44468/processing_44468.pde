
import ddf.minim.*;
Minim minim;
AudioPlayer bmusic;
float [] buffersizeL = new float[1024];
float [] buffersizeR = new float[1024];
float speed = 0.4;
float trans [] = new float [1024];

void setup() {
  smooth();
  minim = new Minim(this);
  bmusic = minim.loadFile("outrage.mp3", 1024);
  bmusic.play();
  size (800, 500);
}

void draw() {
  noStroke();
  fill(0, 150);
  rect(0, 0, width, height);

  //draw waveform
  for (int k = 0 ; k < 1023 ; k++)
  {
    float left1 = 250 + bmusic.left.get(k) *200;//get lift buffer size

    float right1 = 250 + bmusic.right.get(k) * 200;//get rightbuffer size
    buffersizeL[0] = left1;
    buffersizeR[0] = right1;
    buffersizeL[0] = left1;
    buffersizeR[0] = right1;


    buffersizeL[1023 -k]   = buffersizeL[1023 -k-1];


    buffersizeR[1023 -k]   = buffersizeR[1023 -k-1];
    trans[k] =  150 - k*0.3;

    strokeWeight(k*0.05);
    stroke(51, 255, 204, trans[k]*0.5);
    line(k, buffersizeL[k], k+1, buffersizeL[k+1]);
    stroke(255, 204, 51, trans[k]*0.5);
    line(width -k, buffersizeR[k], width-k, buffersizeR[k+1]);
  }
}

void stop()
{
  bmusic.close();
  minim.stop();
  super.stop();
}


