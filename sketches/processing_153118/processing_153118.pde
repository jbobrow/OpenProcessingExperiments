
/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */
 
//++ Modificare gli otto parametri seguenti
 
float raggio1 = 370;  //  1° segmento
float raggio2 = 180;   //  2° segmento
float raggio3 = 100;   //  3° segmento
float raggio4 = 50;   //  4° segmento
float raggio5 = 50;   //  5° segmento
float raggio6 = 100;   //  6° segmento
float raggio7 = 90;   //  7° segmento 
 
 
float passoAngolo1 = PI/999;  //  1° segmento
float passoAngolo2 = PI/150;  //  2° segmento
float passoAngolo3 = PI/60;   //   3° segmento
float passoAngolo4 = PI/30;    //  4° segmento  
float passoAngolo5 = PI/130;    //  5° segmento  
float passoAngolo6 = PI/120;    //  6° segmento  
float passoAngolo7 = PI/130;    //  7° segmento  



color azzurro = color(260, 160, 170);
color  blu= color(100 ,70, 133);

void setup()
{
  size(720,720);
  stroke(255,100);
  background(0);
  colorMode (HSB,360,100,200);
  frameRate (100); 

  
  
}
 
void draw ()
{
  // Centro dell'area di visualizzazione
  float c0x = 370;
  float c0y = 370;
   
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
  
  // Calcola l'estremita' finale del 5° segmento
  float angolo5 = frameCount*passoAngolo5;
  float c5x = c4x + cos(angolo5)*raggio5;
  float c5y = c4y + sin(angolo5)*raggio5;
   
  //++ Calcolare le coordinate cromatiche usando i valori
  //   presenti o ricavati da altre funzioni non randomiche
  color middlecolor = lerpColor (azzurro,blu, cos(angolo4)*0.5+0.5);
  stroke (middlecolor, 40);
 
 
  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
   
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y); 
  line(c2x,c2y, c3x,c3y);
  line(c3x,c3y, c4x,c4y);
  line(c4x,c4y, c5x,c5y);
}

