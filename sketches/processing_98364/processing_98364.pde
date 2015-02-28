
//importacio de llibreries
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
//declaracio de variables
boolean toca=false;
boolean on=true;
PImage nau;
PImage space;
PImage combat;
PImage explosio;
PImage tryagain;
float posx=600;
float posy=250;
float a=0;
int dist=25;
int v=1;
Minim minim;
AudioPlayer daSound;


void setup(){
  
  imageMode(CENTER);                //inicialització parametres
  size(1000,500);
   nau=loadImage("nau.png");
   space=loadImage("space2.jpg");
   combat=loadImage("combate.png");
   explosio=loadImage("explosio.png");
   tryagain=loadImage("try.png");
  background(0);

  rectMode(CENTER);
  noCursor();
  minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("laser.wav");

  
}
void draw(){
 
  image(space,width/2,height/2,width,height);           //dibuixem el fons
  image(nau,mouseX,mouseY,-180,-100);                    //dibuixem la nau
    
    if(!toca){                                //mentre no encertis amb el laser dibuixara la nau enemiga
      image(combat,posx,posy,50,50);
      a=a+v;
      }else{                                 //al encertar dibuixa una explosio

      image(explosio,posx,posy,100,100);
      }
      posx=600+100*cos(a/20);
      posy=250+100*sin(a/15+PI);
     if(mousePressed==true){                      //si cliques comprova si encerta amb la funcio tiro().

    tiro(posy);
    
    }
if(toca){                                                //si toca surt el try again
  image(tryagain,100,height-50,100,100);
}
}
void tiro(float posy){                //comprova la posicio x de les naus
   
  if((mouseY >= (posy-dist)) && (mouseY <= (posy+dist))){
     toca=true;
  
    
   }
}
void mousePressed(){
  if (toca){
    line(mouseX+100,mouseY,posx,mouseY);

  }else{
  daSound.cue(0);//posa el so a 0
  daSound.play();//reprodueix el so
  stroke(255,0,0);
  strokeWeight(3);
  line(mouseX+100,mouseY,width,mouseY);
}
if(dist(mouseX,mouseY,100,height-50)<50){   //si clikes al try again torna a funcionar.
  toca=false;
}
}
void stop()
{
   // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();

  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}



