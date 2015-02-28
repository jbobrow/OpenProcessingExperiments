
/*

 MANIPULAR
 
 -TAMAÑO FUENTE CON DIVISOR
 
 - PROPORCION TEXTO-VIDEO CON TURNO
 
 */

//////////////////////

float anchoVideo = 160.0;
float altoVideo = 120.0;
float pixelado = 0.13;        //// entre 0,03 y 1
float anchoLetra = 1;      // 0.6
float altoLetra = 1;      // 0.9

color fondoColor = (255);

float segundoPlano = random(179, 197);
float tercerPlano = random(317, 397);
///////////////////////

import codeanticode.gsvideo.*;
import processing.video.*;

Capture video;
boolean cheatScreen;


/////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

PImage mascara;
int x0, dx, y0, dy;
int columnas, anchoColumna;
int[] x0Columna, dxColumna, y0Columna, dyColumna;
int intervaloAleatorio, intervaloLimpiar;

/////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////


//String letterOrder1 = "El miedo en rabia, melancolía en violencia";

String letterOrder1 = "ElMiedoEnRabia,MelancolíaEnViolencia.";

String letterOrder2 =
"TrocandoAusenciasPorDolor.";

String letterOrder3 = "LaFuerzaEnSangre,LaVidaEnteraEnLosPuños.";

String letterOrder4 =
"ElRostroArdiendo,IncendiadoPorDios,";

String letterOrder5 =
"UnCuerpoSinEntrañas,ArdiendoDeImpotencia!";

String todasLasLetras = "ElmiedonrablcvtuspfzgñD";

char[] arregloLetras;
char[] arregloLetras2;
char[] arregloLetras3;

int intervalo, plano, intervaloFila, intervaloColumna, inicio, inicioFila, inicioColumna, indice;
float anchoDinamico;

/////////////////////////////////////////////////////////////////


PFont font;
float fontSize;

PImage frame;

///////////////////////


float numeroRandom;
int rate; 
int contador;
int intRandom; 
int turno;

int faseTexto = 0;

float anchoPantallaWebcam, altoPantallaWebcam;
int pixelesAncho, pixelesAlto;

void setup() 
{
  size(displayWidth, displayHeight, P3D);


  rate = 9;
  numeroRandom = random(1, 1.7*rate);
  intRandom = (int)numeroRandom;
  contador = 1;
  frameRate(rate);

  /////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////  
  intervaloAleatorio=(int)(random(1, 3)*rate)+1;
  intervaloLimpiar=(int)(random(1, 1.9)*rate)+1;
  mascara = new PImage(width, height, ARGB);

//  inicializacionMascara();
//  limpiarMascara();
//  generacionMascara();
  /////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////




  int count = width * height;
  println(count);

  font = loadFont("UniversLTStd-Light-48.vlw");



  video = new Capture(this, (int)anchoVideo, (int)altoVideo);
  video.start(); 

  pixelesAncho = (int)(width * pixelado);
  pixelesAlto = (int)(height * pixelado);

  anchoPantallaWebcam = pixelesAncho / anchoVideo;
  altoPantallaWebcam = pixelesAlto / altoVideo;  


  turno = 1;

  //////////

  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO
  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO
  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO

  fontSize = 1/pixelado;

  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO
  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO
  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO
  //// OJOJ OJOJ OJO JO OJOJ OJO JOJOJ OJO JOJO OJ OJO JOJ OJOJ OJOJ OJO JO JO J OJO JOJOJ OJO JOJOJ OJOJ OJO JO

  /////////////  

  arregloLetras = new char[(int)(pixelesAncho*pixelesAlto*1.3)]; 
  arregloLetras2 = new char[(int)(pixelesAncho*pixelesAlto*1.3)]; 
  arregloLetras3 = new char[(int)(pixelesAncho*pixelesAlto*1.3)];
}


void captureEvent(Capture c) {
  c.read();
}

void draw() {



  background(fondoColor);

  pushMatrix();
  textFont(font, fontSize);

  int index = 0;
  video.loadPixels();

  for (int y = 0; y < pixelesAlto; y++) {

    // Move down for next line
    translate(0, fontSize*altoLetra);

    pushMatrix();
    for (int x = 0; x < pixelesAncho; x++) {
      int pixelColor = video.pixels[floor(x/anchoPantallaWebcam)+floor(y/altoPantallaWebcam)*video.width];

     

      if (frameCount%intRandom == 0)
      {
        //        println("numero de cambios: "+contador);
        contador ++;
        numeroRandom = random(1, 1.7*rate);
        intRandom = (int)numeroRandom;
        //        println("intervalo en segundos: "+(float)intRandom/rate);

        turno = (int)random(1, 11.9); // agregar borrar!


        switch (turno)
        {
        case 1: 

          int modalidad = (int)random(1, 4);  // linea, occ, jap



          if (modalidad == 1)
          {
            modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = letterOrder1.charAt(i%letterOrder1.length());
                break;
              case 2: 
                arregloLetras2[inicio + floor(i/3)] = letterOrder1.charAt(floor(i/3)%letterOrder1.length());
                break;
              case 3: 
                arregloLetras3[inicio + floor(i/7)] = letterOrder1.charAt(floor(i/7)%letterOrder1.length());
                break;
              }
            }
          }

          if (modalidad == 2)
          {
            modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder1.charAt(i%letterOrder1.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder1.charAt(floor(i/3)%letterOrder1.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder1.charAt(floor(i/7)%letterOrder1.length());
                  break;
                }


                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {

                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder1.charAt(i%letterOrder1.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder1.charAt(floor(i/3)%letterOrder1.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder1.charAt(floor(i/7)%letterOrder1.length());
                  break;
                }

                indice++;
              }
            }
          }


          break;

          ///// otros versos
          ///// otros versos
          ///// otros versos
          ///// otros versos
          ///// otros versos



        case 2: 

          modalidad = (int)random(1, 4);  // linea, occ, jap



          if (modalidad == 1)
          {
            modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = letterOrder2.charAt(i%letterOrder2.length());
                break;
              case 2: 
                arregloLetras2[inicio + floor(i/3)] = letterOrder2.charAt(floor(i/3)%letterOrder2.length());
                break;
              case 3: 
                arregloLetras3[inicio + floor(i/7)] = letterOrder2.charAt(floor(i/7)%letterOrder2.length());
                break;
              }
            }
          }

          if (modalidad == 2)
          {
            modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder2.charAt(i%letterOrder2.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder2.charAt(floor(i/3)%letterOrder2.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder2.charAt(floor(i/7)%letterOrder2.length());
                  break;
                }


                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {

                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder2.charAt(i%letterOrder2.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder2.charAt(floor(i/3)%letterOrder2.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder2.charAt(floor(i/7)%letterOrder2.length());
                  break;
                }

                indice++;
              }
            }
          }


          break;


          ///////////////////////////
          /////////////////////////

          ///////////////////////////
          /////////////////////////

        case 3: 

          modalidad = (int)random(1, 4);  // linea, occ, jap



          if (modalidad == 1)
          {
            modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = letterOrder3.charAt(i%letterOrder3.length());
                break;
              case 2: 
                arregloLetras2[inicio + floor(i/3)] = letterOrder3.charAt(floor(i/3)%letterOrder3.length());
                break;
              case 3: 
                arregloLetras3[inicio + floor(i/7)] = letterOrder3.charAt(floor(i/7)%letterOrder3.length());
                break;
              }
            }
          }

          if (modalidad == 2)
          {
            modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder3.charAt(i%letterOrder3.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder3.charAt(floor(i/3)%letterOrder3.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder3.charAt(floor(i/7)%letterOrder3.length());
                  break;
                }


                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {

                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder3.charAt(i%letterOrder3.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder3.charAt(floor(i/3)%letterOrder3.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder3.charAt(floor(i/7)%letterOrder3.length());
                  break;
                }

                indice++;
              }
            }
          }


          break;

          ///// otros versos
          ///// otros versos
          ///// otros versos
          ///// otros versos
          ///// otros versos



        case 4: 

          modalidad = (int)random(1, 4);  // linea, occ, jap



          if (modalidad == 1)
          {
            modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = letterOrder4.charAt(i%letterOrder4.length());
                break;
              case 2: 
                arregloLetras2[inicio + floor(i/3)] = letterOrder4.charAt(floor(i/3)%letterOrder4.length());
                break;
              case 3: 
                arregloLetras3[inicio + floor(i/7)] = letterOrder4.charAt(floor(i/7)%letterOrder4.length());
                break;
              }
            }
          }

          if (modalidad == 2)
          {
            modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder4.charAt(i%letterOrder4.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder4.charAt(floor(i/3)%letterOrder4.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder4.charAt(floor(i/7)%letterOrder4.length());
                  break;
                }


                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {

                switch(plano)
                {
               case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder4.charAt(i%letterOrder4.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder4.charAt(floor(i/3)%letterOrder4.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder4.charAt(floor(i/7)%letterOrder4.length());
                  break;
                }

                indice++;
              }
            }
          }


          break;


          ///////////////////////////
          /////////////////////////

          ///////////////////////////
          /////////////////////////


        case 5: 

          modalidad = (int)random(1, 4);  // linea, occ, jap



          if (modalidad == 1)
          {
            modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = letterOrder5.charAt(i%letterOrder5.length());
                break;
              case 2: 
                arregloLetras2[inicio + floor(i/3)] = letterOrder5.charAt(floor(i/3)%letterOrder5.length());
                break;
              case 3: 
                arregloLetras3[inicio + floor(i/7)] = letterOrder5.charAt(floor(i/7)%letterOrder5.length());
                break;
              }
            }
          }

          if (modalidad == 2)
          {
            modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder5.charAt(i%letterOrder5.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder5.charAt(floor(i/3)%letterOrder5.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder5.charAt(floor(i/7)%letterOrder5.length());
                  break;
                }


                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));
            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {

                switch(plano)
                {
                case 1: 
                  arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = letterOrder5.charAt(i%letterOrder5.length());
                  break;
                case 2: 
                  arregloLetras2[(inicioColumna + floor(i/3))+(inicioFila + floor(j/3))*pixelesAncho] = letterOrder5.charAt(floor(i/3)%letterOrder5.length());
                  break;
                case 3: 
                  arregloLetras3[(inicioColumna + floor(i/7))+(inicioFila + floor(j/7))*pixelesAncho] = letterOrder5.charAt(floor(i/7)%letterOrder5.length());
                  break;
                }

                indice++;
              }
            }
          }


          break;


          ///////////////////////////
          /////////////////////////

          ///////////////////////////
          /////////////////////////


        default: 

          modalidad = (int)random(1, 4);  // linea, occ, jap

          if (modalidad == 1)
          {
           modalidad1((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));


            for (int i=0 ; i< intervalo; i++)
            {
              switch(plano)
              {
              case 1: 
                arregloLetras[inicio + i] = ' ';
                break;
              case 2: 
                arregloLetras2[inicio + i] = ' ';
                break;
              case 3: 
                arregloLetras3[inicio + i] = ' ';
                break;
              }
            }
          }

          if (modalidad == 2)
          {
           modalidad2((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));

            for (int j = 0; j< intervaloFila; j++)
            {
              for (int i=0 ; i< intervaloColumna; i++) 
              {
                
                switch(plano)
              {
              case 1: 
                arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              case 2: 
                arregloLetras2[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              case 3: 
                arregloLetras3[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              }
                
                
                indice++;
              }
            }
          }


          if (modalidad == 3)
          {
            modalidad3((int)random(3, 7), (int)random(13, 19), random(0.1, 0.3), random(0.3, 0.7));

            for (int i=0 ; i< intervaloColumna; i++)
            {
              for (int j = 0; j< intervaloFila; j++)
              {
                switch(plano)
              {
              case 1: 
                arregloLetras[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              case 2: 
                arregloLetras2[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              case 3: 
                arregloLetras3[(inicioColumna + i)+(inicioFila + j)*pixelesAncho] = ' ';
                break;
              }
                indice++;
              }
            }
          }


          break;
        }
      }
      pushMatrix();
      // if(random(1)>1-((float)frameCount/10000)) translate(frameCount*sin(random(1)*radians(frameCount60))/rate, frameCount*sin(random(1)*radians(frameCount60))/rate, frameCount*3*sin(random(1)*radians(frameCount60))/rate);
       translate(sin(radians(random(31)*frameCount60)), sin(radians(random(31)*frameCount60)), 0);
       fill(pixelColor,73);
      text(arregloLetras[index], 0, 0);
      popMatrix();

      pushMatrix();
      translate(0.3*sin(radians(random(31)*frameCount60)), 0.3*sin(radians(random(31)*frameCount60)), segundoPlano);
       fill(pixelColor,137);
      text(arregloLetras2[index], 0, 0);
      popMatrix();

      pushMatrix();
      translate(0.03*sin(radians(random(31)*frameCount60)), 0.03*sin(radians(random(31)*frameCount60)), tercerPlano);
       fill(pixelColor);
      text(arregloLetras3[index], 0, 0);
      popMatrix();

      index++;

      // Move over for next character
      translate(fontSize*anchoLetra, 0);
    }
    popMatrix();
  }
  popMatrix();



  /////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////

  //  image(mascara, 0, 0, width, height);

  /////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////

//  if (frameCount%intervaloAleatorio==0)
//  {
//
//    inicializacionMascara();
//
//    intervaloAleatorio=(int)(random(1, 3)*rate)+1;
//    println("intervalo Aleatorio: "+intervaloAleatorio);
//  }
//
//  if (frameCount%intervaloLimpiar==0)
//  {
//
//    limpiarMascara();
//    intervaloLimpiar=(int)(random(1, 3)*rate)+1;
//    println("intervalo Limpiar: "+intervaloLimpiar);
//  }

  if (cheatScreen) {
    //image(frame, 0, height - video.height);
    // set() is faster than image() when drawing untransformed images
    set(0, 0, video);
    println("quiuo");
  }
}


/**
 * Control:
 * 'c' muestra una ventanita con el video original
 * 'g' graba la imagen actual en formato .tiff
 * 'f' y 'F' agrandan y achican el tamaño de fuente
 */
void keyPressed() {
  switch (key) {
  case 'g': 
    saveFrame(); 
    break;
  case 'c': 
    cheatScreen = !cheatScreen; 
    break;
  case 'f': 
    fontSize *= 1.0003; 
    println("Font size: "+fontSize);
    break;
  case 'F': 
    fontSize *= 0.9997; 
    println("Font size: "+fontSize);
    break;
  }
}

void generacionMascara()
{
  color vacio = color(255, 255, 255, 0);

  mascara.loadPixels();

  for (int i=0; i<columnas; i++)
  {
    for (int y=0; y<dyColumna[i]; y++)
    {
      for (int x=0; x<dxColumna[i]; x++)
      {
        mascara.pixels[(x0Columna[i]+x)+(y0Columna[i]+y)*width] = vacio;
      }
    }
  }

  mascara.updatePixels();
}

void inicializacionMascara()
{ 
  x0 = (int)random(width/256, width/4);
  dx = (int)(random(1, 1.3)*2*(width/2-x0));

  y0 = (int)random(height/128, height/4);
  dy = (int)(random(0.7, 1.3)*2*(height/2-y0));

  columnas = (int)random(131, 179); 
  anchoColumna = dx/columnas;


  x0Columna = new int[columnas]; 
  dxColumna = new int[columnas]; 

  y0Columna = new int[columnas]; 
  dyColumna = new int[columnas];

  for (int i = 0; i < columnas; i++)
  {
    x0Columna[i]=x0+i*anchoColumna+(int)random(-7, 7);
    dxColumna[i]=(int)random(anchoColumna/2, anchoColumna);

    y0Columna[i]=(int)random(height/128, height/4);
    dyColumna[i]=2*(height/2-y0Columna[i])*(int)random(73, 97)/100;
  }
  
  generacionMascara();
}

void limpiarMascara()
{
  mascara.loadPixels();

  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      mascara.pixels[x+y*width] = color(255-fondoColor, 244) ;
    }
  }
  mascara.updatePixels();
  
  generacionMascara();
}

void modalidad1(int intervalo1, int intervalo2, float anchoDinamico1, float anchoDinamico2)
{

  inicio = (int)random(pixelesAlto*pixelesAncho);
  anchoDinamico = 0;
  if (frameCount < intervalo1*rate)
  {
    anchoDinamico = anchoDinamico1;
  }
  else if (frameCount < intervalo2*rate)
  {
    anchoDinamico = anchoDinamico2;
  }

  else
  {
    anchoDinamico = 0.7;
  }

  intervalo = (int)random((pixelesAncho*3)*anchoDinamico);
  plano = (int)random(1, 4);


  
}

void modalidad2(int intervalo1, int intervalo2, float anchoDinamico1, float anchoDinamico2)
{

  indice=0;

  inicioColumna = (int)random(pixelesAncho);
   inicioFila = (int)random(pixelesAlto);

  float anchoDinamico = 0;
  if (frameCount < intervalo1*rate)
  {
    anchoDinamico = anchoDinamico1;
  }
  else if (frameCount < intervalo2*rate)
  {
    anchoDinamico = anchoDinamico2;
  }

  else
  {
    anchoDinamico = 0.7;
  }

  intervaloColumna = (int)random((pixelesAncho-inicioColumna)*anchoDinamico);
  intervaloFila = (int)random((pixelesAlto-inicioFila)*anchoDinamico);
  plano = (int)random(1, 4);

  
}

void modalidad3(int intervalo1, int intervalo2, float anchoDinamico1, float anchoDinamico2)
{

  indice=0;

  inicioColumna = (int)random(pixelesAncho);
  inicioFila = (int)random(pixelesAlto);

  float anchoDinamico = 0;
  if (frameCount < intervalo1*rate)
  {
    anchoDinamico = anchoDinamico1;
  }
  else if (frameCount < intervalo2*rate)
  {
    anchoDinamico = anchoDinamico2;
  }
  else
  {
    anchoDinamico = 0.7;
  }
  intervaloColumna = (int)random((pixelesAncho-inicioColumna)*anchoDinamico);
  intervaloFila = (int)random((pixelesAlto-inicioFila)*anchoDinamico);

  plano = (int)random(1, 4);


}
