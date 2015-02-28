
import ddf.minim.*;
import ddf.minim.analysis.*;

//the main minim object
Minim minim;
//the audio input
AudioInput in;
//the frequency analyzer
FFT fft;

import processing.opengl.*;
// import peasy.*;

// PeasyCam cam;
float x, y, z, r;
float radius = 0;
float xRadius, yRadius, zRadius, xCenter, yCenter, zCenter;
int iRes = 50;
int jRes = 50;
float iMapped, jMapped;
float res, force;
float jelliness = 0.4;
float organicConstant = 1;


void setup() {

  size(1024,768 , OPENGL);

  smooth();



  //start minim
  minim = new Minim(this);
  minim.debugOn();

  //get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);             // klang als welle!!!

  //create frequency analyzer for the audio input
  fft = new FFT(in.bufferSize(), in.sampleRate());  // für frequenzen!!!

  //also calculate averages of frequency amplitudes
  fft.logAverages(20, 5);
}

void draw() {


  lights();

  directionalLight(400, 200-in.mix.level()*300, 0+in.mix.level()*200, -1*in.mix.level()*20, 0+in.mix.level()*10, -1*in.mix.level()*10);

  background(255); 

  r += jelliness;
  if (r > TWO_PI*2) {
    r -= TWO_PI*2;
  }


  
  fill(160+in.mix.level()*400, 240+in.mix.level()*500, 360+in.mix.level()*500);
  noStroke();

  fft.forward(in.mix); // analysiere frequenz mit gemischten kanälen!!!

  beginShape(TRIANGLE_STRIP);
  
  translate(width/2, height/2);
  rotateX(radians(90));
  for (int i = 0; i < iRes; i++) {
    for (int j = 0; j < jRes; j++) {

      iMapped = map(i, 0, iRes, 0, PI);
      jMapped = map(j, 0, jRes, 0, TWO_PI);


      xRadius = radius - force + force*cos(iMapped + r);
      yRadius = radius - force + force*sin(iMapped - r);
      zRadius = radius - force + force*cos(iMapped - r);

      x = xRadius * sin(iMapped) * cos(jMapped);
      y = yRadius * sin(iMapped) * sin(jMapped);
      z = zRadius * cos(iMapped);

      normal(x, y, z);
      vertex(x, y, z);

      iMapped = map(i+1, 0, iRes, 0, PI);
      jMapped = map(j+1, 0, jRes, 0, TWO_PI);


      xRadius = radius - force + force*cos(iMapped + r);
      yRadius = radius - force + force*sin(iMapped - r);
      zRadius = radius - force + force*cos(iMapped - r);

      x = xRadius * sin(iMapped) * cos(jMapped);
      y = yRadius * sin(iMapped) * sin(jMapped);
      z = zRadius * cos(iMapped);
      normal(x, y, z);
      vertex(x, y, z);
    }
  }


 
 
  
  if (radius < 200){
  radius += in.mix.level();  
  
}
 
  if(radius > 200){
    
    radius = 0;
    
    delay(1000);
  
  }
 
  
  
  endShape(CLOSE);

  //sphere(0);

  force *= 0.95;
  force += in.mix.level();

  }




void stop()

{
  //always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


