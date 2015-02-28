
int diametro = 12;                                                                        //Variable que define el diametro de las bolas que caen
boolean disparo = false;                                                                  //Variable booleana predeterminada en 0 
boolean perder = false;                                                                   //Variable booleana predeterminada en 0
int aleatorio()                                                                           //Variable que devuelve un valor aleatorio desde 0 hasta 600
{
  return int(random(600));
}
 
int[] circuloX = { aleatorio(), aleatorio(), aleatorio(), aleatorio(), aleatorio() };    //Posición en el eje X de los circulos aleatorios que van cayendo
int[] circuloY = { 0, 0, 0, 0, 0 };                                                      //Posición en el eje Y. Todas empiezan desde cero

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
 
 
PImage fondo;                                                                              //Fondo Space Invaders
PImage naveImagen;                                                                         //Foto nave

Minim minim;
AudioPlayer sound;
AudioOutput out;
 
void setup()
{
  size(600,600);                                                                         //Tamaño de la pantalla
  noCursor();                                                                             //El cursor no aparece en pantalla

minim = new Minim(this);                                                                  //Iniciamos el sonido
  sound = minim.loadFile("song.mp3");                                                     
    sound.cue(0);
    sound.play();//
 
   
   fondo = loadImage("fondo.gif");
   naveImagen = loadImage("nave.gif");

}
 
void draw()
{
  background(0);   //Se define el color de fondo
  image(fondo,0,0);
  image(naveImagen,mouseX,572);                                                          // La nave ahora es una imagen
  
  if(disparo==true)                                                                      //Condicional. Si se efectúa el disparo
  {
    nave(mouseX);                                                                        //La nave se encuentra en la posición del ratón
    disparo = false;                                                                     // Se cancela el disparo ya que solo se dispara cuando se pulsa el ratón                                                                 
  }
 
  invaders();
  fin(); 
}
 
void mousePressed()                                                                      //Que pasa cuando haces click con el raton
{
  disparo = true;   //Se efectúa el disparo
  
  sound = minim.loadFile("laser.mp3");//so de la pistola
      sound.cue(0);
      sound.play(); 
}
 
void invaders()                                                                          //Se declara los invasores (las bolas verdes que caen)
{ 
  stroke(0,255,0);                                                                       //Se define el color de la linea                                               
  fill(0,255,0);                                                                         //Se define el color de relleno
  for (int i=0; i<5; i++)                                                                //Bucle para repetir la sentencia 5 veces, sumando de una en una
  {
    ellipse(circuloX[i], circuloY[i]++, diametro, diametro);                             //Se hace un circulo del tamaño y la posición de las variables definidas al principio cada vez que se elimina un invader
  }
}
 
void nave(int disparoX)
{
  boolean hit = false;                                                                   
  for (int i = 0; i < 5; i++)                                                            //Bucle para mantener 5 invaders en la pantalla aunque se vayan eliminando
  {
    if((disparoX >= (circuloX[i]-diametro/2)) && (disparoX <= (circuloX[i]+diametro/2))) //Si la posición de X está dentro del tamaño del circulo, le golpeará
    {
      hit = true;
      line(mouseX, 565, mouseX,circuloY[i]);                                            //Linea desde la nave hasta el invader
      ellipse(circuloX[i], circuloY[i], diametro+20, diametro+20);                      //Circulo de explosión en la posición del invader 20px más del diametro del mismo
      circuloX[i] = aleatorio();
      circuloY[i] = 0;
    }   
  }
 
    if (hit == false)                                                                   //Si el disparo no acierta
  {
    line(mouseX, 565, mouseX, 0);                                                      //Linea desde la nave hasta la parte superior de la pantalla
  } 
 
}
 
void fin()
{
  for (int i=0; i< 5; i++)
  {
    if(circuloY[i]==600)                                                                //Cuando uno de los invaders llega a la fila 600
    {
      fill(color(255,0,0));                                                             //Rellenar de rojo    
      textSize(20);                                                                     //Tamaño de letra
      text("¡¡HAS PERDIDO!!", 230,100);                                                   //Aparece el texto en la posición indicada
      noLoop();                                                                         //Se para el bucle al final de la función draw
      
    }
  }
}



