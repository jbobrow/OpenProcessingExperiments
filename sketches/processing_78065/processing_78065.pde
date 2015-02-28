
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
int ancho=10;
boolean decrece=false;

void setup() {
  size(500, 500);
  smooth();
  stroke(255, 0, 0);
  frameRate(25);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO, 512);
}

void draw() {
  background(255);
  float m=0;
  for (int i=0;i<in.bufferSize()-1;i++) {
    if (abs(in.mix.get(i))>m) {
      m=abs(in.mix.get(i));
    }
  }

  if (ancho>=height/2)
    decrece=true;
  if (ancho<10)
    decrece=false;

  if (decrece==false) {
    ancho+=int(m*5);
  }else {
    ancho-=int(m*5);
  }
  strokeWeight(ancho);
  ellipse((int)width/2, (int)height/2, (int)ancho/2, ancho );

  //line(ancho, 100, ancho, 250);
  println(ancho);
}
