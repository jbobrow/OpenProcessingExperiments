
// Esercizio 7.1 Birth in colors
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */

//++ Modificare gli otto parametri seguenti

float raggio1 = 200;  // lunghezza del 1° segmento //144
float raggio2 = 100;   // lunghezza del 2° segmento //72
float raggio3 = 30;   // lunghezza del 3° segmento //36
float raggio4 = 10;   // lunghezza del 4° segmento //18

float passoAngolo1 = PI/1000;  // velocita' di rotazione del 1° segmento //937
float passoAngolo2 = PI/500;  // velocita' di rotazione del 2° segmento //177
float passoAngolo3 = PI/30;   // velocita' di rotazione del 3° segmento //31
float passoAngolo4 = PI/10;    // velocita' di rotazione del 4° segmento //9

// SGDM
int myGrey = 0;
int myHSB = 0;
int myGrow = 1;

void setup()
{
  size(720,720);
  stroke(0,40);
  background(0);
  
  colorMode(HSB,360,100,100);
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
  //setupGrey();
  //stroke(myGrey);
  setupHSB();
  stroke(myHSB, 360, 100, 100);

  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
  
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}

void setupGrey()
{
  if ( myGrey <= 0 )
    myGrow = 1;
  
  if ( myGrey >= 255 )
    myGrow = 0;
  
  if ( myGrow==1 )
    myGrey++;
  else
    myGrey--;
}

void setupHSB()
{
  if ( myHSB <= 0 )
    myGrow = 1;
  
  if ( myHSB >= 360 )
    myGrow = 0;
  
  if ( myGrow==1 )
    myHSB++;
  else
    myHSB--;
}


