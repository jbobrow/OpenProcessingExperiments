
/* @pjs preload="sfondo.jpg"; */
/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */

//++ Modificare gli otto parametri seguenti

float raggio1 = 140;  // lunghezza del 1° segmento 
float raggio2 = 160;   // lunghezza del 2° segmento
float raggio3 = 10;   // lunghezza del 3° segmento
float raggio4 = 20;   // lunghezza del 4° segmento

float passoAngolo1 = PI/1000;  // velocita' di rotazione del 1° segmento 900
float passoAngolo2 = PI/150;  // velocita' di rotazione del 2° segmento 150
float passoAngolo3 = PI/20;   // velocita' di rotazione del 3° segmento 30
float passoAngolo4 = PI/20;    // velocita' di rotazione del 4° segmento 10

void setup()
{
  size(715,720);
  
PImage sfondo=loadImage("sfondo.jpg");
 image(sfondo,-5,0); 
  frameRate(600);
  colorMode(HSB,349,5,100);
}

void draw () 
{
  // Centro dell'area di visualizzazione
  float c0x = 360;
  float c0y = 360;
  
  // Calcola l'estremita' finale del 1° segmento
  float angolo1 = frameCount*passoAngolo1;
  float c1x = c0x + cos(angolo1)*raggio1;
  float c1y = c0y + sin(angolo1)*raggio1;
  
  // Calcola l'estremita' finale del 2° segmento
  float angolo2 = frameCount*passoAngolo2;
  float c2x = c1x + cos(angolo2)*raggio2;
  float c2y = c1y + sin(angolo2)*raggio2;
  
  // Calcola l'estremita' finale del 3° segmento
  float angolo3 = frameCount*passoAngolo3;
  float c3x = c2x + cos(angolo3)*raggio3;
  float c3y = c2y + sin(angolo3)*raggio3;
  
  // Calcola l'estremita' finale del 4° segmento
  float angolo4 = frameCount*passoAngolo4;
  float c4x = c3x + cos(angolo4)*raggio4;
  float c4y = c3y + sin(angolo4)*raggio4;
  
  //++ Calcolare le coordinate cromatiche usando i valori 
  //   presenti o ricavati da altre funzioni non randomiche
  

  
  
  

  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
  
 float tono = 349;
 float saturazione = 5;
 float brillantezza = 100;
 float alfa = 1;
stroke(tono, saturazione, brillantezza, alfa);

  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
  line(c4x,c4y, c1x,c1y);
  line(c1x,c1y, c3x,c3y);
  line(c2x,c2y, c4x,c4y);
}
