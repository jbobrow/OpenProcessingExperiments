


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
  
int[] posicion = new int[8];
float[] senal = new float[10];
 
Minim miaudio;
AudioPlayer miReproductor;
 
void setup()
{
  miaudio= new Minim(this);
  miReproductor=miaudio.loadFile("12 - Eels - Souljacker Part 1.mp3");
  miReproductor.play();
  miaudio.stop();
   
  size(400,400);
  frameRate(10);
  strokeWeight(50);
  smooth();
}
 
void draw()
{
  int i=0;
  background((int)random(155));
 
  stroke(random(100),random(55),random(255));
  ellipse(width/2,height/2,300,300);
   
  senal[0] = 1; senal[1] = -1; senal[2] = 1;
  senal[3] = -1;senal[4] = -1; senal[5] = -1;
  senal[6] = 1; senal[7] = 1;
    
  for(i=0;i<4;i++)
  {
    posicion[i] = (int)random(0,150);
    posicion[i+4] = (int)sqrt((150*150)-(posicion[i]*posicion[i]));
    posicion[i] = posicion[i]*(int)senal[i];
    posicion[i] = posicion[i] + 200;
    posicion[i+4] = posicion[i+4]*(int)senal[i+4];
    posicion[i+4] = posicion[i+4]+200;
  }
  for(i=0;i<4;i++)
  {
 
  stroke(random(255),random(255),random(255));
    ellipse(posicion[i],posicion[i+4],10,10);
    fill(206);
  }
  for(i=0;i<2;i++)
  {
   stroke(random(255),random(255),random(255));
    bezier(posicion[i],posicion[i+4],width/2,height/2,width/2,height/2,posicion[i+2],posicion[i+6]);
  }
}


