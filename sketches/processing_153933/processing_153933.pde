
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/153118*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */
 
//++ Modificare gli otto parametri seguenti
 
float raggio1 = 180;  //  1Â° segmento
float raggio2 = 10;   //  2Â° segmento
float raggio3 = 50;   //  3Â° segmento
float raggio4 = 50;   //  4Â° segmento
float raggio5 = 50;   //  5Â° segmento
float raggio6 = 50;   //  6Â° segmento
float raggio7 = 50;   //  7Â° segmento 
 
 
float passoAngolo1 = PI/999;  //  1Â° segmento
float passoAngolo2 = PI/150;  //  2Â° segmento
float passoAngolo3 = PI/60;   //   3Â° segmento
float passoAngolo4 = PI/30;    //  4Â° segmento  
float passoAngolo5 = PI/130;    //  5Â° segmento  
float passoAngolo6 = PI/120;    //  6Â° segmento  
float passoAngolo7 = PI/130;    //  7Â° segmento  



int A = 0;
int B = 0;
int C = 1;

void setup()
{
  size(720,720);
  stroke(255,100);
  background(0);
  colorMode (HSB,360,360,100);
  frameRate (100); 

  
  
}
 
void draw ()
{
  // Centro dell'area di visualizzazione
  float c0x = 370;
  float c0y = 370;
   
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
  
  // Calcola l'estremita' finale del 5Â° segmento
  float angolo5 = frameCount*passoAngolo5;
  float c5x = c4x + cos(angolo5)*raggio5;
  float c5y = c4y + sin(angolo5)*raggio5;
   
  //++ Calcolare le coordinate cromatiche usando i valori
  //   presenti o ricavati da altre funzioni non randomiche
 
 setupHSB();
  stroke(B, 360, 100, 100);
  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
   
  // Disegna il 2Â°, il 3Â° e il 4Â° segmento
  line(c1x,c1y, c2x,c2y); 
  line(c2x,c2y, c3x,c3y);
  line(c3x,c3y, c4x,c4y);
  line(c4x,c4y, c5x,c5y);
}
void setupGrey()
{
  if ( A <= 0 )
    C = 0;
  
  if ( A >= 255 )
    C = 1;
  
  if ( C==1 )
    A--;
  else
    A++;
}

void setupHSB()
{
  if ( B <= 0 )
    C = 1;
  
  if ( B >= 360 )
    C = 0;
  
  if ( C==1 )
    B++;
  else
    B--;
}

