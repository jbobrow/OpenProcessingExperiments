
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioInput in;
Minim minim;
float largo,ancho,m,r,s;

void setup(){
  size(700,800);
  smooth();
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
  background(0);
}
void draw(){
  
  if(largo<=1000){
fill(205,255,50);
m=abs(in.mix.get(0)*60);
r=abs(in.mix.get(0)*80);
ancho+=m;
largo+=r;
ellipse(350,400,ancho,largo);}
else{
  background(0);}
  

}

