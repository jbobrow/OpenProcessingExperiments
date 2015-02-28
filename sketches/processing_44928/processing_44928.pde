
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;

float x, y, radius, rAngle;
int centX, centY;
int circleSize1 = 60;
int circleSize2 = 45;
int circleSize3 = 30;
int circleSize4 = 15;
color circleColor0 = color(0, 220, 175);



void setup () {
  size(960, 540);
  frameRate(10);
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("xx.wav", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}



void draw () {
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    noStroke();
    fill(circleColor0, 100);
    scale(song.left.get(i)*5, song.left.get(i)*5);
    logoMark();
  }
  popMatrix();
}



void logoMark () {
  rotate(rAngle);
  rAngle += -.001;

  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize1, circleSize1);
  }
  rotate(PI/7);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize2, circleSize2);
  }
  rotate(PI/8);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize3, circleSize3);
  }
  rotate(PI/9);
  for (float ang = 0; ang <= 360; ang += 90) {
    float radius = dist(width/2, height/2, 400, 400);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    ellipse(x, y, circleSize4, circleSize4);
  }
}



void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

