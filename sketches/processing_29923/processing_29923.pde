
import ddf.minim.*;

Minim minim;
AudioPlayer musica;

PImage S;
PImage floresta;
PImage imagensss;
PImage preto;
PImage toca;
PImage i1;
PImage i2;
PImage i3;
PImage i4;
PImage i5;
PImage i6;
PImage i7;
PImage i8;
PImage L1;
PImage L2;
PImage i9;

float Xi1;
float Xi2;
float Xi3;
float Xi4;

void setup(){
  size(800, 600);
  
  minim = new Minim(this);
  musica = minim.loadFile("musica.mp3");
  musica.play();
   
S = loadImage("S.jpg");
  floresta = loadImage("floresta.jpg");
    imagensss = loadImage("imagensss.jpg");
      preto = loadImage("preto.jpg");
        toca = loadImage("toca.png");
          i1 = loadImage("1.png");
            i2 = loadImage("2.png");
              i3 = loadImage("3.png");
i4 = loadImage("4.png");
  i5 = loadImage("5.png");
    i6 = loadImage("6.png");
      i7 = loadImage("7.png");
        i8 = loadImage("8.png");
          L1 = loadImage("L1.png");
            L2 = loadImage("L2.png");
              i9 = loadImage("9.png");
  
Xi1=-100;

Xi2=800;
Xi3=-100;
Xi3=-800;
Xi4=800;

  }

void draw(){
  background(0);
  
  // Display the sprite at the position xpos, ypos
  image(floresta, 0, 0);
  image(i1, Xi1, 430);
   image(i2,Xi2, 430);
   image(i3,Xi3, 420);
  image(i4,Xi4, 420);

  
  Xi1=Xi1+1;
 
  
  if(Xi1 > 300){
  Xi1=300;
  Xi2=Xi2-1;
  }
  
  if(Xi2 < 500){
  Xi2=500;
  Xi3=45;
 Xi4=Xi4-1;
  
  }
  
    if(Xi4 < 550){

image(i9,-345,-465,818,1062);
  
    }
  

      if(Xi4 < 450){

image(imagensss,0,0);
  
    }

    
  
  
  
}




