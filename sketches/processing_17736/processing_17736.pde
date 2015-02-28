
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer ascent;
FFT fft;
PImage img;
void setup()
{
  size(1024, 640);
  minim = new Minim(this);
  ascent = minim.loadFile("ascent.mp3", 2048);
  ascent.loop();
  fft = new FFT(ascent.bufferSize(), ascent.sampleRate());
noStroke();
smooth();
frameRate(24);
img = loadImage("BPM1.jpg");

}

void draw(){
background(255);
image(img,0,0);
  fft.forward(ascent.mix);
for(int i = 0; i < fft.specSize(); i+=1024){

   fill(0,0,255,40);
 
        for (int e = 0; e < ascent.bufferSize() - 1; e += 2){
          float n1 = ascent.left.get(e)*100;
          float n2 = ascent.right.get(e)*100;
          float p1 = ascent.left.get(e+1)*100;
          float p2 = ascent.right.get(e+1)*100;
                ellipse(e, (height/4)-(n1+n2),n1,p1);
                ellipse(e, 3*((height/4)-(p1+p2)),n2,p2);
                  float f = fft.getBand(e)*50;
  ellipse(e, (height/4)-f, ascent.left.get(i)*f, ascent.left.get(i+1)*f);
  ellipse(e, 3*(height/4)-f, ascent.right.get(i)*f, ascent.right.get(i+1)*f);
                 
            
    }
  }
}

void stop()
{
  ascent.close();
  minim.stop();
  
  super.stop();
}


