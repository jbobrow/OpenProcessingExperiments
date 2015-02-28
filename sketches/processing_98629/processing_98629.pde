
/* Berta Aracil López 
   Informàtica - Practica 4
   2n GEDI - Grup 02 */

//Library minim
/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Declaració de variables
Minim minim; //Canal de sortida del so
AudioPlayer daSound; //Fitxer de so*/

//Java Script
var audioElement1= document.createElement("audio");
var audioElement2= document.createElement("audio");

PImage granota,mosca;



void setup(){
  //Carreguem les imatges
  granota = loadImage("frog.jpg");
  mosca = loadImage("fly.jpg");
  
  //Definim la mida del fons i ocultem el cursor
  size(800,600);
  noCursor();
  
  //Carreguem i iniciem els arxius de so de fons
 /* minim = new Minim(this);
  daSound = minim.loadFile("mosca.mp3");
  //Iniciem el so de fons
  daSound.cue(0);
  daSound.play();*/
  
  audioElement1.setAttribute("src","mosca.mp3");
  audioElement1.play();
}



void draw(){
  //Actualitzem el fons i les imatges
  background(255);
  image(granota,width/4,height*2/3,width/2,height/3);
  image(mosca,mouseX-(width/20)/2,mouseY-(height/20)/2,width/20,height/20); //definim la imatge, la posició respecte el mouse i les dimensions
}



void mousePressed() {
  //Accions quan cliquem el cursor
  strokeWeight(8);stroke(255,3,40);
  line(width/2,height*3.7/5,mouseX+(width/20)/2,mouseY+(height/20)); 
  
  //So del cursor
  /*daSound = minim.loadFile("clap.mp3.mp3");
  //Iniciem el so en clicar
  daSound.cue(0);
  daSound.play();*/
  
  audioElement2.setAttribute("src","clap.mp3.mp3");
  audioElement2.play();
}

/*void stop(){
  daSound.close();
  minim.stop();
  super.stop();
}*/


