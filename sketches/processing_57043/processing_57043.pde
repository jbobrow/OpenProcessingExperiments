


import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

//import codeanticode.gsvideo.*;
//GSMovieMaker mm;
int fps = 25;
//GSPipeline pipeline;

float vals[];
float cx, cy;

void setup() {

  size(800, 400, P2D);
  frameRate(fps);
  smooth();

  cx = width/2;
  cy = height/2;

  minim = new Minim(this);

  jingle = minim.loadFile("siteUnseen.mp3", 2048);
  vals = new float[1025];
  jingle.play();

  //  mm = new GSMovieMaker(this, width, height, "drawing.ogg", GSMovieMaker.THEORA, GSMovieMaker.BEST, fps);

  //mm.setQueueSize(0, 0);

  //mm.start();

  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

  background(0);
}

/*
void keyPressed() {
 if (key == ' ') {
 mm.finish();
 exit();
 }
 }*/


void draw() {

  image(g, 0, -1);
  fill(0, 13);

  pushStyle();
  noFill();
  stroke(0);
  strokeWeight(10);
  rect(0, 0, width, height);
  popStyle();



  fft.forward(jingle.mix);
  for (float q = 0;q<width;q+=width/4) {

    pushMatrix();
    translate(q+cx*10.0+width/8, height-10.0-cy*10.0);


    float t = 0;
    beginShape();  

    for (int i = 5; i < fft.specSize()/4.0; i++)
    {
      stroke(lerpColor(#ffcc00, #ffffff, norm(vals[i], 0, 512)), vals[i]/8.0);
      vals[i] += (fft.getBand(i)*i - vals[i])/(120.0);
      t = (radians(map(i+frameCount/50.0+q, 0, fft.specSize()/4.0, 0, 360)));
      vertex(sin(t)*vals[i], cos(t)*vals[i]);
      cx+=(sin(t)*vals[i]-cx)/1000.0;
      cy+=(cos(t)*vals[i]-cy)/1000.0;
    }

    endShape(CLOSE);

    popMatrix();
  }
}


