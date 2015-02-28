
/*
*  Interferences by kof, 2012
*/

import krister.Ess.*;

AudioStream myStream;
float[] streamBuffer;

void setup() {
  size(320, 240, P2D); 
  colorMode(HSB);
  loadPixels();
  noiseSeed(19);


  Ess.start(this);


  myStream=new AudioStream();
  myStream.sampleRate(44100);
  myStream.bufferSize(width);
  streamBuffer=new float[myStream.size];
  myStream.start();
}


void draw() {


  int cnt =0 ;
  for (int i = 0 ; i < pixels.length;i+=1) {
    float d1 = norm(dist(noise(frameCount/30.1, 0)*width, noise(0, frameCount/30.0)*width, i%width, i/width), 360, 0);

    if (i/( (height/2) )==0) {
      streamBuffer[cnt] = map(brightness(pixels[cnt]), 0, 255, -0.97, 0.97);
      cnt++;
    }
    pixels[i] = lerpColor(color(
    (sin((frameCount/30.0*sin(frameCount/30.0)/d1))+1.0)*127
      ), pixels[i], d1);
  }

  updatePixels();
}

void audioStreamWrite(AudioStream theStream) {
  System.arraycopy(streamBuffer, 0, myStream.buffer, 0, streamBuffer.length);
}

public void stop() {
  Ess.stop();
  super.stop();
}


