
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

 
 
 
 PImage foto;
 PImage picture;
 
 
 //var audioElement = document.createElement("audio");

 void setup()    {
   size(1000,1000);
  foto = loadImage("bmw-2.jpg");
  picture = loadImage("cirquit.JPG");
   
 }
 
 
 
 
 
 void draw()   {
   
  // background(0);
  fill(0,6);
  rect(0,0,width,height);
  image(picture,0,0,1000,1000);
   image(foto,mouseX,mouseY,50,30);
   
 }
  



