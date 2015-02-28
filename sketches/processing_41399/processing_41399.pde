
import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.opengl.*;

AudioPlayer player;
Minim minim;
FFT fft;

void setup()
{
  size(720, 480, P3D);

  minim = new Minim(this);

  player = minim.loadFile("orig.mp3", 4096);
  fft = new FFT(player.bufferSize(), player.sampleRate());

  player.play();

  fill(56, 67, 89, 100);
  frameRate(24);
}

void draw()
{
  fft.forward(player.mix);

  camera(fft.getBand(600) * 500, fft.getBand(100) * 30, fft.getBand(8000) * 5000, 
  0.0, 0.0, 0.0, 
  0.0, 1.0, 0.0); 

  background(10);
  fill(min(fft.getBand(200) * 150, 255), min(fft.getBand(8000) * 1700, 255), min(fft.getBand(900) * 1000, 255), random(250));
  stroke(min(fft.getBand(200) * 150, 255), min(fft.getBand(8000) * 1700, 255), min(fft.getBand(900) * 1000, 255), 100);

  translate(fft.getBand(600) * 50, fft.getBand(2500) * 20);
  sphere(fft.getBand(100) * 7);
  translate(fft.getBand(900) * 50, fft.getBand(4000) * 50);
  box(fft.getBand(9000) * 20);
  translate(fft.getBand(600) * 50, fft.getBand(6000) * 50);
  box(fft.getBand(8000) * 100);
  scale(2.0);
  scale(min(fft.getBand(200), 3.0), min(fft.getBand(8000) * 10, 5.0), min(fft.getBand(900) * 20, 5.0));
  rotate(random(PI));
  scale(min(fft.getBand(200) * 5, 8.0));
  box(fft.getBand(6000) * 10);
  translate(fft.getBand(1000) * 50, fft.getBand(6000) * 50);
  box(fft.getBand(9000) * 15);  
  translate(fft.getBand(600) * 30, fft.getBand(2500) * 20);
  box(fft.getBand(2000) * 20);
  translate(fft.getBand(1000) * 50, fft.getBand(6000) * 50);
  rotate(random(PI));

  for (int i = 0; i < player.left.size() * 0.5; i++)
  {
    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.right.get(i+1)*50);
    rotate(random(PI));
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
    line(i * 2.0, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    rotate(random(PI));
    line(i * 3.0, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
    triangle(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50, 150 + player.right.get(i+1)*50, i);
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
  }

  sphere(fft.getBand(1000) * 20);
  translate(fft.getBand(1000) * 50, fft.getBand(6000) * 50);
  box(fft.getBand(10000) * 20);
}

void stop()
{
  player.close();
  minim.stop();

  super.stop();
}

