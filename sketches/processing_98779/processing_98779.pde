
//MªLuisa Espinós-Informática-GEDI
//Repeticiones y elementos en movimiento
 
/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
 
*/
var audioElement = document.createElement("audio");

//Guardamos algunas medidas
int sz = 40;
int numeroMariposas = 10;

/*
Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player
*/


 
//Creamos un array de posicionesX con "numeroMariposas" elementos:
float[] posicionesX = new float[numeroMariposas];
//y creamos un array de posicionesY:
float[] posicionesY = new float[numeroMariposas];
//Creamos un array de velocidadesX con "numeroMariposas" elementos:
float[] velocidadesX = new float[numeroMariposas];
//y creamos un array de velocidadesY:
float[] velocidadesY = new float[numeroMariposas];
 
 
//Definimos funciones principales y damos a valor a los datos
void setup(){
  size(600,600);
   noFill();
  smooth();
  noStroke();
   
   audioElement.setAttribute("src","del1.mp3");
    audioElement.play();

   
  //Inicializamos las posiciones y velocidades:
  for(int i = 0; i<numeroMariposas; i++){
    posicionesX[i] = width/2;
    posicionesY[i] = height/2;
    velocidadesX[i] = random(1,6);
    velocidadesY[i] = random(1,3);  
   
  }

}
 
//Fondo
void draw(){
  background(255);
 
//Cuadrado
int totalr= 8;
int tf= 62;
int tx= 43;
int tj= 33;
 
 
    
//Definición de ecuaciones verticales y horizontales
 
for(int g=0; g<totalr; g++){
 
for(int t=0; t<totalr; t++){
   
  //Girar el rectangulo
 
  pushMatrix();
  noStroke();
  fill(243,167,247,50);
  translate(tx,tj);
  rotate(PI/7);
  rect(-10,-10,tf,tf);
  tx = tx + 70;
  popMatrix();
   
  //Especificar el espacio entre los rectangulos
  }
tj= tj + 70;
tx= 43;
}
 
 
//Elipses
//Poner datos principales
 
int totale= 8;
float m=width/totale;
float d=width/totale;
float radi = m/2;
float cx=radi;
float cy=radi;
 
//Reproduccion en vertical y en horizontal
 
for(int j=0; j<totale; j++){
for(int i=0; i<totale; i++){
   
   
 //Definir formas de las elipses a repetir
 fill(252,250,171,250);
 ellipse(cx,cy,50,50);
  
 stroke(8,255,162);
 fill(215,250,244);
  ellipse(cx,cy,50,20);
  ellipse(cx,cy,20,50);
   
 noStroke();
  fill(255,108,197,120);
  ellipse(cx,cy,18,18);
   
 fill(132,206,242);
  ellipse(cx,cy,10,10);
   
  fill(132,206,242);
  ellipse(cx+25,cy+25,22,22);
  
 //Avance en la x
  cx = cx +d ;
   
}
 
 
cy= cy + d;
cx = radi;
 
 
}
 
  //Iniciamos un bucle para que realize la accion para todos los
  //elementos del array:
  for(int i = 0; i<numeroMariposas; i++){
    //actualitzamos las posiciones
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
 
    //comprobamos los bordes X,para que el dibujo no salga de la ventana
    if((posicionesX[i]<0+20)||(posicionesX[i]>width-45)){
      velocidadesX[i] = -velocidadesX[i];
       
     /*  //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
         */ 
    }
    //comprobamos los bordes Y,para que el dibujo no salga de la ventana
    if((posicionesY[i]<0+20)||(posicionesY[i]>height-30)){
      velocidadesY[i] = -velocidadesY[i];
       
     /*    //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
    */
  
    }
  }
 
  //acabado el proceso, creamos otro bucle
  //donde dibujamos la mariposa:
  for(int i = 0; i<numeroMariposas; i++){
    //Definimos el elemento(Mariposa)
  //Alas
  noStroke();
   
  fill(107,191,19,210);
  ellipse(posicionesX[i],posicionesY[i],sz,sz/2);
  ellipse(posicionesX[i]+30,posicionesY[i],sz,sz/2);
  ellipse(posicionesX[i],posicionesY[i]+20,sz,sz/2);
  ellipse(posicionesX[i]+30,posicionesY[i]+20,sz,sz/2);
  //Cuerpo
   
  fill(255,146,13,230);
   ellipse(posicionesX[i]+15,posicionesY[i]+10,sz/2,sz);
   //Ojos
    
   stroke(0);
  fill(250);
   ellipse(posicionesX[i]+18,posicionesY[i],sz/9,sz/9);
   ellipse(posicionesX[i]+12,posicionesY[i],sz/9,sz/9);
    
   //
   
  }
}
/* 
void stop()
{
    // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();
   
    super.stop();
   
}
 */


