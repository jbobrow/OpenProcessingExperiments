
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer mySound;
int ancho = 10;


void setup() {
  size (400,400);
  
  minim = new Minim(this);
  mySound = minim.loadFile ("Like Money.mp3");
  mySound.play();
  //background(1);
  smooth();
 
 
  

}

void draw(){
  noFill();
  background(0);
  strokeWeight(4);
  //ellipse (height/2,width/2, 300,300);
  //bezier(200, 50,  80, 5,  80, 75,  175, 345);
  
  
   float m=0;
  for(int i = 0; i <  mySound.bufferSize() - 1; i++) {
  if (abs(mySound.mix.get(i))>m) { //convierto los negativos en numeros enteros, osea numeros abstractos.
      m=abs(mySound.mix.get(i));
  }
}
   
 
   ancho+=int(m*200);
 
  noFill();

 stroke(255,255,255,ancho);
  //ellipse ((int)width/2, (int)height/2, (int)ancho/2,ancho);
   //ellipse (0+ancho, (int)height/2, (int)ancho/2,ancho);
    //ellipse (random(ancho), random(ancho), ancho,ancho);
  ellipse (height/2,width/2, 300,300);
 bezier(200, 50,random(0,400), random(0,400),random(0,400), random(0,400),  175, 345);
 
  bezier(50, 200,random(0,400), random(0,400),random(0,400), random(0,400), 345 , 175);

//bezier(30, 20,  80, 5,  80, 75,  30, 75);
    
    fill(255,255,255,random(0,20));


 stroke(255,255,255);
//ellipse(200,200, 160 +  mySound.mix.get(i)*150, 160 +  mySound.mix.get(i+1)*150);

if (ancho>300) {
  ancho=1;
 }
if ((int) m==2) {
  m=1;
 }

 
 // ellipse (width/2, height/2, 100,100);


}









