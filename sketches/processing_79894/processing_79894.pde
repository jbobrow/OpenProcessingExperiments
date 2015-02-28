
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
AudioInput in;
Minim minim;
float largo,ancho,m,r,a;
int d=0;
PFont letra;
 
void setup(){
  size(400,400);
  smooth();
  frameRate(100);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
  background(0);
  letra=loadFont("Algerian-48.vlw");
}
void draw(){
   if(largo<=390){
      background(350);
      fill(255,255,50);
      m=abs(in.mix.get(0)*50);
      r=abs(in.mix.get(0)*50);
      ancho+=m;
      largo+=r;
      ellipse(200,200,ancho,largo);
  }
  else{
    frameRate(20);
    background(350);
    fill(255,0,0);
    textFont(letra,70);
    text("EXPLOTO!!!",15,200);  
  }
}
