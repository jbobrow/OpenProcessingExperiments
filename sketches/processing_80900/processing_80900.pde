
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioInput in; 
float ancho=0; 
void setup(){
  size(500,500);
  smooth();
  frameRate(25);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512); 
}
void draw(){
  background(255);
  float m=0;
  for(int i=0;i< in.bufferSize()-1;i++){
    if(abs(in.mix.get(i))>m){
      m=abs(in.mix.get(i));
    }
  }
  ancho=int(m*500)+5; 
  strokeWeight(3); 
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(255,255,ancho,ancho+5);
  stroke(0);
  noFill();
  bezier(255,255,300,300,200,350,255,400);
  println(ancho); 
  ancho=ancho+m;
  if((ancho==width) || (ancho==height)){
    rect(random(450),random(450),random(100),random(100));
    rect(random(450),random(450),random(100),random(100));
    rect(random(450),random(450),random(100),random(100));
  }
}
