
// Armando Rocha


// Entrada de audio
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;

float ancho=0;
float alto=0;
float m=0;

void setup(){
  size(600,450);
  smooth();
  frameRate(5);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);  // 512 muestras por segundo
}

void draw(){
 background(255);
 
for(int i=0;i< in.bufferSize()-1;i++)
{
  if(abs(in.mix.get(i))>m){  // traer lo que esta en el buffer
  m=abs(in.mix.get(i));
}
}

float ancho=(m*300)+5;
float alto= (m*400)+5;
 ancho+=ancho;
 alto+=alto;
  noFill();
  strokeWeight(2);
  bezier(295,225,350,250+alto,250,305+alto,330,320+alto);
  fill(0,0,255);
  strokeWeight(1);
  ellipse(300,220,ancho+5,alto+10); 
 if(ancho>=600 && alto>=450){
  background(255);
  ellipse(random(590),random(440),70,70);
 }
}
