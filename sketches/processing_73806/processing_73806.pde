
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mySound;
int ancho = 10;
PFont miVariableTipo; //declaro variable

void setup() {
  size (400,400);
  minim = new Minim(this);
  mySound = minim.loadFile ("Like Money.mp3");
  mySound.play();
  background(1);
  smooth();
  miVariableTipo=loadFont("Helvetica-48.vlw");
}

void draw(){
  background(0);
   float m=0;
  for(int i = 0; i <  mySound.bufferSize() - 1; i++) {
  if (abs(mySound.mix.get(i))>m) { //convierto los negativos en numeros enteros, osea numeros abstractos.
      m=abs(mySound.mix.get(i));
  }
}
   
 
   ancho+=int(m*200);
  strokeWeight(ancho);
  noFill();

 stroke(255,255,255,ancho-200);
  ellipse ((int)width/2, (int)height/2, (int)ancho/2,ancho);
   ellipse (0+ancho, (int)height/2, (int)ancho/2,ancho);
    ellipse (random(ancho), random(ancho), ancho,ancho);
    
    fill(0,0,0,random(0,20));
textFont(miVariableTipo,ancho-200);
textAlign(CENTER);
text("Like Money", (int)width/2, (int)height/2);

fill(0,0,0,random(0,60));
text("Like Money", random(400), random(400));
noFill();

 stroke(255,255,255);
//ellipse(200,200, 160 +  mySound.mix.get(i)*150, 160 +  mySound.mix.get(i+1)*150);

if (ancho>300) {
  ancho=1;
 }
if ((int) m==2) {
  m=1;
 }
 


}









