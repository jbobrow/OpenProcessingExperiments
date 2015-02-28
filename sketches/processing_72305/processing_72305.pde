
import ddf.minim.*;
import ddf.minim.analysis.*;
PImage img;
int numCircle=20;

float eRadius;
float radius = 50;
float angle = 0;


Minim minim;
AudioPlayer bgsong;
BeatDetect beat;
AudioInput input;
FFT fft;

void setup() {
  size(1024, 768, P3D);
  minim = new Minim(this);
  bgsong = minim.loadFile("data/gangnam.mp3", 2048);
  bgsong.play();
  bgsong.loop();
  fft = new FFT(bgsong.bufferSize(), bgsong.sampleRate());
  fft.logAverages(22, 3);
  input = minim.getLineIn();
  
  rectMode(CORNERS);
  ellipseMode(CENTER_RADIUS);


  img = loadImage("data/newyork.jpeg");

  beat = new BeatDetect();
  eRadius = random(5, 10);

}

void draw() {
  noStroke();
  
  
  image(img, 0, 0);
//  background(255);

  beat.detect(bgsong.mix);

  //  float a = map(eRadius,20,80,60,255);
  //  fill(random(150,256),random(150,256),random(150,256));
  //  if(beat.isOnset()) eRadius = 50;
  //  ellipse(0,random(0,100), eRadius,eRadius);
  //  ellipse(50,random(0,150), eRadius-10,eRadius-10);
  //  ellipse(100,random(0,100), eRadius,eRadius);
  //  ellipse(150,random(0,200), eRadius-20,eRadius-20);
  //  ellipse(200,random(0,100), eRadius-10,eRadius-10);
  //  ellipse(250,random(0,400), eRadius,eRadius);
  //  ellipse(300,random(0,300), eRadius-5,eRadius-5);
  //  ellipse(350,random(0,100), eRadius-20,eRadius-20);
  //  ellipse(400,random(0,600), eRadius-30,eRadius-30);
  //  ellipse(450,random(0,300), eRadius-40,eRadius-40);
  //  ellipse(500,random(0,200), eRadius-20,eRadius-20);
  //  ellipse(550,random(0,400), eRadius,eRadius);
  //  ellipse(600,random(0,200), eRadius-10,eRadius-10);
  //  ellipse(650,random(0,100), eRadius,eRadius);
  //  ellipse(700,random(0,150), eRadius-30,eRadius-30);
  //  ellipse(750,random(0,100), eRadius,eRadius);
  //  ellipse(800,random(0,200), eRadius,eRadius);
  //  ellipse(850,random(0,100), eRadius-20,eRadius-20);
  //  ellipse(900,random(0,400), eRadius,eRadius);
  //  ellipse(950,random(0,300), eRadius,eRadius);
  //  ellipse(1000,random(0,100), eRadius-30,eRadius-30);
  //  eRadius *= 0.95;
  //  if(eRadius <20) eRadius =20;

  //  float a = map(eRadius, 20, 80, 60, 255);
  //  fill(60, 255, 0, a);
  //  if ( beat.isOnset() ) eRadius = 80;
  //  ellipse(width/2, height/2, eRadius, eRadius);
  //  eRadius *= 0.95;
  //  if ( eRadius < 20 ) eRadius = 20;

  fill(0);
  fft.forward(bgsong.mix);
  float visual = fft.getBand(0)*3;

  int w = int(width/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++) {
    rect(i*w, height, i*w + 2*w, height - fft.getAvg(i)*1.5);
  }

  for (int i = 0; i<bgsong.bufferSize() - 1; i++) {
    pushMatrix();
    translate(width,0);
    noFill();
    strokeWeight(3);
    stroke(0);
    float x = cos(angle) * radius;
    float y = cos(angle)*radius;
    ellipse (x, y, 100- bgsong.left.get(i)*400, 100-bgsong.right.get(i+1)*400);
    popMatrix();
  }
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  bgsong.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}


