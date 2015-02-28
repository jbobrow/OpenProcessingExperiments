
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


 Minim minim;
AudioPlayer sonido;
AudioPlayer sonido2;
// Fons estàtic
int distX = 27, distY = 27; // Espaiat
int szX = 25, szY = 25; // Dimensions quadrats
color color2 = color(110,94,59), color3 = color(20,230,10); // Color quadrats
 
// Elements que reboten amb la pantalla
int sz = 50; 
int forma = 5; //nombre de marios
color color1; 
 
// Matrius dels mario
float[] posX = new float[forma]; // Matriu posicions X
float[] posY = new float[forma]; // Matriu posicions Y
float[] velX = new float[forma]; // Matriu velocitats X
float[] velY = new float[forma]; // Matriu velocitats Y
PImage foto;
void setup() {
   
  // Seqüència de velocitats
  frameRate(20);
   
  //Dimensions de la pantalla en funció del fons estàtic
  size(distX*szX+(distX-szX),distY*szY+(distY-szY));
   
   
  // Inicialització posicions i velocitats
  for(int i = 0; i < forma; i++){
    posX[i] = height/2;
    posY[i] = width/2;
    velX[i] = random(-5,15);
    velY[i] = random(-7,15);
  }
  minim = new Minim(this);
     sonido = minim.loadFile("sonido.wav");
     sonido2 = minim.loadFile("sonido2.wav");


   foto = loadImage("tub.png"); 
    noStroke();
   noCursor();
}
 
void draw () {
     
  // Fons
  background(175,166,55);   
  for(int x=distX-szX; x < width; x+=distX)for(int y=distY-szY; y < height; y+=distY){   
    fill(color2);
    rect(x,y,szX,szY);
   
  }
   image(foto, mouseX-25, mouseY+40, 50,45);
  // Actualitzem posicions dels marios
  for(int i = 0; i < forma; i++){   
    posX[i] += velX[i];
    posY[i] += velY[i];
 
    // Comprobem limits 
    if((posX[i] < (0 + sz/2))||(posX[i] > (width - sz/2))){
      velX[i] = -velX[i];
      sonido.cue(0);
      sonido.play();

    }
     
    if((posY[i] < sz)||(posY[i] > (height - sz)) ) {
      velY[i] = -velY[i];
      sonido.cue(0);
      sonido.play();
    }
     
       
    // Dibuix del mario
     fill(255,0,0);
  ellipse(posX[i],posY[i]-6.5,16,16);
  fill(250,130,130);
  ellipse(posX[i],posY[i]-1.5,13,15);
  rect(posX[i]-6,posY[i]+24,4,10,4,4,4,4);
  rect(posX[i]+3,posY[i]+24,4,10,4,4,4,4);
  rect(posX[i]-10,posY[i]+11,20,4,4,4,4,4);
  fill(0,0,255);
  rect(posX[i]-6,posY[i]+6,13,20);
     
     }
   
  }

// Al clicar el ratolí es reinicialitzen la posició i les velocitats
void mousePressed(){
  for(int i = 0; i < forma; i++){
    posX[i] = mouseX;
    posY[i] = mouseY;
    velX[i] = random(-5,15);
    velY[i] = random(-7,15);
    minim = new Minim(this);
  sonido2 = minim.loadFile("sonido2.wav");
    sonido2.cue(0);
    sonido2.play();

  }

}




