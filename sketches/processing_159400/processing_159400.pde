
/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */

//++ Modificare gli otto parametri seguenti

float raggio1 = 106;  // lunghezza del 1Â° segmento 
float raggio2 = 52;   // lunghezza del 2Â° segmento
float raggio3 = 84;   // lunghezza del 3Â° segmento
float raggio4 = 32;   // lunghezza del 4Â° segmento

float passoAngolo1 = PI/101;  // velocita' di rotazione del 1Â° segmento
float passoAngolo2 = PI/40;  // velocita' di rotazione del 2Â° segmento
float passoAngolo3 = PI/80;   // velocita' di rotazione del 3Â° segmento
float passoAngolo4 = PI/20;    // velocita' di rotazione del 4Â° segmento

void setup()
{
  size(600,600);
  background(0, 0, 50);
  colorMode( HSB, 360, 100, 100 );
}

void draw () 
{
  // Centro dell'area di visualizzazione
  float c0x = 300;
  float c0y = 300;
  
  // Calcola l'estremita' finale del 1Â° segmento
  float angolo1 = frameCount*passoAngolo1;
  float c1x = c0x + cos(angolo1)*raggio1;
  float c1y = c0y + sin(angolo1)*raggio1;
  
  // Calcola l'estremita' finale del 2Â° segmento
  float angolo2 = frameCount*passoAngolo2;
  float c2x = c1x + cos(angolo2)*raggio2;
  float c2y = c1y + sin(angolo2)*raggio2;
  
  // Calcola l'estremita' finale del 3Â° segmento
  float angolo3 = frameCount*passoAngolo3;
  float c3x = c2x + cos(angolo3)*raggio3;
  float c3y = c2y + sin(angolo3)*raggio3;
  
  // Calcola l'estremita' finale del 4Â° segmento
  float angolo4 = frameCount*passoAngolo4;
  float c4x = c3x + cos(angolo4)*raggio4;
  float c4y = c3y + sin(angolo4)*raggio4;
  
  //++ Calcolare le coordinate cromatiche usando i valori 
  //   presenti o ricavati da altre funzioni non randomiche
  
  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
  
  // Disegna il 2Â°, il 3Â° e il 4Â° segmento
  
  float h = (int (angolo1/PI) % 40)*8;
  stroke( h, 45, 100, 100); 
  line(c1x,c1y, c2x,c2y);
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}

