
//YANAHUI HERNANDEZ CRUZ
//FELIPE ANDRES TORRES TORRES
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim miaudio;
AudioPlayer miReproductor;
boolean izq=false;
int x;

void setup() {
  size(500, 500);
  smooth();
  stroke(0, 255, 0);
  frameRate(25);
  x=(int)width/2;
  miaudio=new Minim(this);

}

void draw() {
  background(255,178,90);

  if (izq==false&&x>=485) {
    izq=true;


    miReproductor=miaudio.loadFile("perro.mp3");
    miReproductor.play();
    miaudio.stop();
  }
  if (izq==true&&x<=15) {
    izq=false;
   
    miReproductor=miaudio.loadFile("gatito.mp3");
    miReproductor.play();
    miaudio.stop();
  }
  if (izq==false)
    x+=4;
  else
    x-=4;
    
  fill(50,150,30);
  ellipse(x, (int)height/2, 50, 50 );
}


