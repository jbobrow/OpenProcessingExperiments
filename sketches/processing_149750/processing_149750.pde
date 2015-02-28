
/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */

//++ Modificare gli otto parametri seguenti

float raggio1 = 234;  // lunghezza del 1° segmento 
float raggio2 = 110;   // lunghezza del 2° segmento
float raggio3 = 50;   // lunghezza del 3° segmento
float raggio4 = 20;   // lunghezza del 4° segmento

float passoAngolo1 = PI/950;  // velocita' di rotazione del 1° segmento
float passoAngolo2 = PI/200;  // velocita' di rotazione del 2° segmento
float passoAngolo3 = PI/31;   // velocita' di rotazione del 3° segmento
float passoAngolo4 = PI/15;    // velocita' di rotazione del 4° segmento

void setup()
{
  size(720,720);
  stroke(255,46);
  background(228,217,185);
  colorMode (HSB,360,100,100);
  frameRate (120);  
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
  float h = (int (angolo1/TWO_PI) % 30)*12; 
  stroke (h,75,100,70);
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}
