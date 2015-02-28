
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim audioSonido;
AudioPlayer reprodSonido;

int pos;
int inc=4;

void setup() {
  size(400, 200);
  frameRate(10);
  pos =width/2;
}

void draw() {
  background(0);
  ellipse(pos, height/2, 50, 50);
  pos+=inc;
  if (pos > width || pos < 0){
  inc*=-1;
  audioSonido = new Minim(this);
  reprodSonido = audioSonido.loadFile("perro.mp3");
  reprodSonido.play();
  }
  if(pos<25){
  inc*=-1;
  audioSonido = new  Minim(this);
  reprodSonido = audioSonido.loadFile("gato.WAV");
  reprodSonido.play();
  }

}


