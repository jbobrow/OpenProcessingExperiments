
/* Programa para hacer un visor sonoro de imágenes.
Música, imágenes y programación por Pablo Arias*/

//Cargar librerías audio
import ddf.minim.*;
Minim minim;
AudioPlayer song;



//Imágenes
PImage [] imagenes = new PImage [8];
PImage [] imagenes2 = new PImage [8];
int x=20;
int y=50;

void setup(){
  
  minim = new Minim(this);
  song = minim.loadFile("Sonidos/GafasOscuras.mp3");
  size(600,400);
  for(int i=0; i<8; i++){
  //Imágenes grandes
  imagenes[i]=loadImage("Imagenes/"+i+".png");
  //Previews
  imagenes2[i]=loadImage("Imagenes/"+i+"0.png");
  }

  }
void draw(){
  background(125);
  song.play();
  for(int i=0; i<8; i++){
    image(imagenes2[i], x, (y*i));
    if(mouseX>=20 && mouseX<=70){
      if(mouseY>=i*50 && mouseY<=i*50+50){
        image(imagenes[i],200,80);
      }
    }
    else{
      fill(127,157,35);
      rect(200,80,300,300);
      }
  }
}
void stop(){
  song.close();
  minim.stop();
  super.stop();
}

