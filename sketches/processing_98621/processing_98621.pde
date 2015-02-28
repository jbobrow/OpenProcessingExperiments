
/*Marta Donoso_ Informàtica: imatge i so
Aquest exercici tracta d'escollir una imatge que es vagi movent amb el cursor, i que a la vegada
reprodueixi un so*/

var audioElement = document.createElement ("audio");//aixo ho posem quan ho passem a javascript
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; */ //hem de treure tot lu relacionat amb so, x passar a javascript


/*
Minim minim;//creem un objecte de so
AudioPlayer daBackgroundSound;//creem un player */
PImage afoto; 
//aqui defineixo les mides del sol, ja que fa l'efecte de respiració i per tant necessita varis valors de diàmetre
int midaMinima = 100;
int midaMaxima = 150;
int interval = 1;
boolean creixent = true;
int midaBola = 30;

void setup(){

  size(600,600);
  background(68,47,211);
  //carguem l'arxiu d'imatge en afoto
  afoto = loadImage("peix.jpg"); 
  //borro la fletxa del cursor
  noCursor();
  smooth();
  strokeWeight(3);
  audioElement.setAttribute("src","peixos.mp3");      //MUSICA DE FONS EN JAVASCRIPT, SEMPRE POSAR AIXO
  audioElement.play();
 /* minim = new Minim(this);//instanciem l'objecte de so
 daBackgroundSound = minim.loadFile("peixos.mp3");//carreguem l'mp3
  daBackgroundSound.cue(1200);//avancem el capçal del so de fons
  daBackgroundSound.play();//el reproduim */
}


void draw(){
   background(68,47,211);
  //dibuixem amb la foto que es mogui amb el ratolí i el tamany de la foto és de 200x200.
  image(afoto, mouseX, mouseY, 200,200); 
  
     fill(41,84,237);
   stroke(41,84,237);
ellipse(100,120,160,100);
ellipse(160,150,140,90);
fill(103,137,255);
stroke(103,137,255);
ellipse(160,150,130,80);
ellipse(100,120,150,90);

  //colors sol
  fill(255,233,31);
  stroke(255,233,31);
 

  //La mida de la bola ha de canviar segons estigui creixent o decreixent
  if(creixent==true){
    midaBola = midaBola + interval;
  } 
  else { //no esta creixent
  midaBola = midaBola - interval;
  }


  //I ara cal comprobar si ha arribat a una mida límit
  //per canviar el cicle creixent/decreixent
  if(midaBola > midaMaxima){
    creixent = false;
  }
  if(midaBola < midaMinima){
    creixent = true;
  }

  //I finalment la dibuixem
  ellipse(240,100,midaBola,midaBola);
  
  
  
 
}
/*
//Tanquem les coses de so de java
void stop()
{

  daBackgroundSound.close();
  minim.stop();
  super.stop();
}

*/


