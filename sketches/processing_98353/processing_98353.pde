
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//variables
float posX, posY, velX, velY, velB, velE;
float colorB,color1,color2,color3;
float posXb, posYb, posYc;
float RbutX, RbutY;
float posB;
float exp, act1,act2;
float diana;
int i;

var audioElement = document.createElement("audio");

 
PImage FondoCielo;
PImage Avion;
 
 
void setup(){
size(800,700);
FondoCielo=loadImage("http://www.filmscan.co.nz/samples/sky.jpg");
Avion=loadImage("http://tuxpaint.org/stamps/stamps/vehicles/flight/planes/747.png");
imageMode(CENTER);
//valores variables
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  velB = 20;
  act1=0;
  act2=act1-10;

}
 
void draw(){

  image(FondoCielo,width/2,height/2);
   //ametralladora
noStroke ();
fill (255,255,0);
for(int a=0; a > -1600; a-=50){
float velAm = mouseX-random (1600);
float velAn = mouseY;
ellipse (velAm,velAn,act1,act2);
  image(Avion, mouseX, mouseY-20);

  } 
 
}
    


 
void mousePressed(){
 audioElement.setAttribute("src","gun.mp3");
 audioElement.play();
 if (act1 == 20) {
    act1 = 0;
  } else {
    act1 = 20;
  }
  
}



