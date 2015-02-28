
/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
*/
var audioElement = document.createElement("audio");

//definim les variables
PImage fotofons;
PImage fotodofi;

void setup(){
size(800,500);    
fotofons=loadImage("fons.jpg");//carreguem la imatge del fons
fotodofi=loadImage("dofins.png");//carreguem la imatge de la silueta de dofí
audioElement.setAttribute("src", "Cantodelfín.mp3");
}
 
void draw() {
  noCursor();
 imageMode(CENTER);//centrem la imatge dels fons
  image(fotofons,0,0);
  image(fotodofi,mouseX,mouseY);//com que tenim centrada la imatge del fons, definim la imatge del dofí en funció de moviment del mouse

}
 
void mousePressed(){// quan cliquem el mouse a la imatge sonarà una música de sorolls de fons del mar que dura bastant
  audioElement.setAttribute("src", "Cantodelfín.mp3");//carreguem l'mp3
  audioElement.play();
  audioElement.cue(0);
}

// No entenc perquè no sona quan ho carrego al sketch amb mode Javascript funciona correctament i sona, però al openprocessing no se sent el so.

