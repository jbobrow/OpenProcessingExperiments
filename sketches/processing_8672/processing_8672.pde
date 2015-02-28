
import ddf.minim.*;

Minim minim;
AudioInput in;
float time = 0.0;
float increment = 0.01;

void setup()
{
  size(screen.width, screen.height);
  
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  background(255);
   noiseDetail(1,0.1);
  float n = noise(time)* width;
  println(n);
  float m = noise(time*1.2)* width;
  float o = noise(time*0.9)*width;
  time += increment;
   float xn = 1;
  float s = noise(time)*100;

 
   for(int i = 0; i < in.bufferSize() - 1; i++) {
    
 
  float gain = in.left.get(i)*150;

  fill(n/gain/2);
 
  rotate(n/10*gain);
  rectMode(CORNER);
  rect(1250, 1250, 30, 30);
  rect(n, o , gain*m, gain*n);
  rotate(o/-8);
  fill(gain/6);
  rect(m, n, gain*2, gain*2);
  fill(255);
  triangle(o, gain, 150, m, 160, n);
  ellipseMode(CORNER);
  fill(gain*10);
  ellipse(500, 800, gain*100, gain*100);
  noFill();
  rect(900, o, gain*200+20, gain*20+20);
  bezier(0, 0, o, gain, o, m, o, m);
  smooth();
  frameRate(60);
  println(frameCount);

  
  
  }
}

