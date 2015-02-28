
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int Tx=700,Ty=500;
int[] coorxInvasor={int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10)),int(random(10,Tx-10))};
int[] cooryInvasor={int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0)),int(random(-30,0))};
int radioInvasor=7;
int numInvasores=10;
int score = 0;
boolean fin=false;
PImage pena,peje,mexico;           //tipo de dato imagen
Minim mi_cancion;
AudioPlayer miReproductor;
  


void setup()
{
 background(0);
 size(Tx,Ty); 
 smooth();
 strokeWeight(4);
 
 mi_cancion = new Minim(this); 
 miReproductor=mi_cancion.loadFile("musica.mp3");
 pena = loadImage("pena2.jpg"); //cargamos la imagen en foto 
 peje = loadImage("peje.jpg"); //cargamos la imagen en foto 
 mexico = loadImage("mexico.jpg");
 
}
void draw()
{
  background(0);
  fondo();  
  arma(); 
  invasores();
  
  miReproductor.play();
 
  if(score>=250)
    {
      background(0);
      win();
      noLoop();
    }
  
  if(fin==true)
    { 
      fondo();
      finJuego();
      noLoop();
    }
}

void arma()
{
  fill(0,255,0);
  stroke(0,255,0);
  strokeWeight(1);
  image(peje,mouseX,Ty-40);//mostramos la imagen en coorx, coory
//  triangle(mouseX,Ty-25,mouseX-7,Ty-10,mouseX+7,Ty-10);
}

void mousePressed()  //detecta click en el mouse
{
  if(fin!=true && score<250)
     proyectil(mouseX); //tomamos la posición de X del disparo
}

void invasores()
{
  fill(255);
  stroke(255);
  strokeWeight(1);
  for(int i=0; i<numInvasores;i++)
  //ellipse(coorxInvasor[i],cooryInvasor[i]++,2*radioInvasor,2*radioInvasor);
  image(pena,coorxInvasor[i],cooryInvasor[i]++);//mostramos la imagen en coorx, coory
    
  for(int i=0;i<numInvasores;i++)  
      if(cooryInvasor[i]>=Ty-40)  //si invasores llegaron al limite
            {
              fin=true;    //fin del juego         
            }  
}

void proyectil(int disparo)
{
  boolean acertar=false;

  fill(255,0,0);
  stroke(255,0,0);
  strokeWeight(3);  

  for(int i=0;i<numInvasores;i++)
     {
       if(disparo<=coorxInvasor[i]+40 && disparo>=coorxInvasor[i])  //si le dio a algun invasor
        {
         acertar=true;       
         score = score +10;
         line(disparo+20,Ty+40,disparo+20,cooryInvasor[i]);   //linea del disparo
         stroke(250,250,0);
         ellipse(coorxInvasor[i]+20,cooryInvasor[i]+20,5*radioInvasor,5*radioInvasor); //explosion del invasor   
      // image(pena,coorxInvasor[i],cooryInvasor[i]++);//mostramos la imagen en coorx, coory
         coorxInvasor[i] = int(random(10,Tx-40)) ;   //creamos un nuevo invasor
         cooryInvasor[i] = 0;                  //creamos un nuevo invasor
        }     
     }     
  
  if(acertar==false)
     line(disparo+20,Ty,disparo+20,0);   //linea del disparo fallo, no dio a ningun invasor           

} //termina funcion proyectil

void win()
{
 background(0);  
 PFont tipo_letra;                                    //declaramos un tipo de variable tipo letra
 tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");  //cargamos el tipo de letra en la variable
 textFont(tipo_letra,30);                             //damos tamaño al tipo de la letra  
 text("Ganaste!! Score 250",(Tx/2)-80,Ty/2);      //desplegamos el texto que queremos en la posicion deseada    
 mi_cancion.stop(); 
}

void finJuego()
{
 PFont tipo_letra;                                    //declaramos un tipo de variable tipo letra
 tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");  //cargamos el tipo de letra en la variable
 textFont(tipo_letra,30);                             //damos tamaño al tipo de la letra  
 background(0);  
 text("Game Over :-(",(Tx/2)-80,Ty/2);               //desplegamos el texto que queremos en la posicion deseada    
 mi_cancion.stop(); 
}

void fondo()
{
 image(mexico,0,0);//mostramos la imagen en coorx, coory
}


