
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
FFT fft;

Controlli c;

PFont font;

color c1 = color(233,0,58);
color c2 = color(255,83,0);
color c3 = color(0,171,111);
color c4 = color(88,224,0);

void setup()
{
  size(512, 500);
  minim = new Minim(this);
  song = minim.loadFile("Marry You.mp3", 1024);
  c = new Controlli(song);
  song.play();
  //println("sampleRate" + song.sampleRate());
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(22,3); 
}

void draw()
{
  //stroke(255);
  fill(0);
  rectMode(CORNER);
  rect(0,0,width,height);
  c.display();
  // esegue trasformata di Fourier sul buffer mix
  fft.forward(song.mix);
  /*println("specSize" + fft.specSize());
  println("buffersize" + song.bufferSize());
  println("buffersize" + song.sampleRate());*/
  int x = int((width-2*20)/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++){
    stroke(c1);
    strokeWeight(1);
    fill(c1);
    ellipse(i*x+2*20, 340 - fft.getAvg(i)*2, 14,14);
    stroke(c2);
    strokeWeight(1);
    fill(c2);
    ellipse(i*x+2*20, 360 - fft.getAvg(i)*2, 14,14);
    stroke(c3);
    strokeWeight(1);
    fill(c3);
    ellipse(i*x+2*20, 380 - fft.getAvg(i)*2, 14,14);
    stroke(c4);
    strokeWeight(1);
    fill(c4);
    ellipse(i*x+2*20, 400 - fft.getAvg(i)*2, 14,14);
  }
  fill(255);
  text("Marry You - Bruno Mars", 360,40);
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
void cambiaColore(){
  c1 = color(random(255),random(255),random(255));
  c2 = color(random(255),random(255),random(255));
  c3 = color(random(255),random(255),random(255));
  c4 = color(random(255),random(255),random(255));
}
void keyPressed(){
  if(key == 'c' || key =='C'){
    cambiaColore();
  }
}
void mousePressed() {
  c.pressed(mouseX,mouseY);
}
void mouseDragged() {
  c.dragging(mouseX, mouseY);
}
void mouseReleased() {
  c.blockControlli();
}

