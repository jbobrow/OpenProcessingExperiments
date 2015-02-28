
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioInput in;
PFont comicSans;
int h=40;
int y;
int x;
boolean fin=false;
void setup() {
  size(500, 500);
  smooth();
  stroke(255, 0, 0);
  frameRate(25);
  x=(int)width/2;
  y=15;
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO, 512);
  comicSans=createFont("ComicSansMS", h);
}

void draw() {
  background(155);
  float m=0;
  for (int i=0;i<in.bufferSize()-1;i++) {
    if (abs(in.mix.get(i))>m) {
      m=abs(in.mix.get(i));
    }
  }
  if (y<15) {
    text("Ganaste", 50, h);
    fin=true;
  }
  if (y>485) {
    text("Perdiste", 50, h);
    fin=true;
  }
  if (fin==false) {
    y+=2;
    y-=int(m*7);
  }

  ellipse(x, y, 30, 30 );

  //line(ancho, 100, ancho, 250);
}


