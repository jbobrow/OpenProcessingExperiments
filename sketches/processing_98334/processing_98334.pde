
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
*/



PImage foto;
PImage foto2;
boolean Explosio = true;
var audioElement = document.createElement("audio");





void setup(){
  size(400,300);
  foto = loadImage("mont.jpg");
  foto2 = loadImage("volca.jpg");
 
  
}

void draw(){
if (Explosio) {
  image(foto,0,0,width,height);
}else{
image(foto2,0,0,width,height);
}

  
}

void mousePressed () {
  Explosio = !Explosio;
    audioElement.setAttribute("src","EXPLO.mp3");
  audioElement.play();

}




