
/*JÚLIA DUCAT HINOJOSA
Pràctica 5a:Imatge i so
INFORMÀTICA
grup 02
2n GEDI 2012-2013


Declaració de sons (java)

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
*/

//Variable d'element tipus sonor declaració de sons (javascript)
var audioElement1 = document.createElement("audio"); 
var audioElement2 = document.createElement("audio");

//Minim minim;//creem un objecte de so
//AudioPlayer DaSound;//creem un player

//declaració de variable d'imatges

PImage silueta;
PImage siluetablood;

void setup(){
  
size(900,900);//mida pantalla
//carreguem les imatges que es volen utilizar
silueta = loadImage("007.jpg");//imatge inicial silueta James Bond
siluetablood = loadImage("007_red.jpg");//imatge silueta James Bond vermella

//carreguem els sons que es volen utilitzar
//minim = new Minim (this);
//DaSound = minim.loadFile ("JamesBond.mp3");//cançó de fons 007
//DaSound.cue(0);//com a fons ja que està en el setup
//DaSound.play();
//DaSound = minim.loadFile ("scream.wav");//xiscle dona

//Javascript
audioElement1.setAttribute("src","JamesBond.mp3");
audioElement2.setAttribute("src","scream.wav");
audioElement1.play();
noCursor();//amagar el cursor
}

void draw(){
  
  background(0);//foncs de pantalla negre
  
  imageMode(CENTER);
  image(silueta,mouseX,mouseY);//perquè la imatge es mogui seguint el cursor
  
  if(mousePressed==true){//quan cliquem el mouse es duuen a terme les diferents accions
    background(0);
    image (siluetablood,width/2,height/2);//imatge vermella perquè es situii al mig
   // DaSound = minim.loadFile ("scream.wav");//xiscle dona
   // DaSound.cue(0);
   //DaSound.play();
   audioElement2.play();
   
  }
    
  }
  


  


