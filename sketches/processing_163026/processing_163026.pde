

/**
 * SKETCH BASE PER ESERCITAZIONE 7
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/grafica-computazionale
 */

//++ Modificare gli otto parametri seguenti

float raggio1 = 200;  // lunghezza del 1° segmento 
float raggio2 = 50;   // lunghezza del 2° segmento
float raggio3 = 50;   // lunghezza del 3° segmento
float raggio4 = 50;   // lunghezza del 4° segmento

float passoAngolo1 = PI/1000;  // velocita' di rotazione del 1° segmento
float passoAngolo2 = PI/600;  // velocita' di rotazione del 2° segmento
float passoAngolo3 = PI/30;   // velocita' di rotazione del 3° segmento
float passoAngolo4 = PI/9;    // velocita' di rotazione del 4° segmento
color verde = color(0, 255, 0);
color  verdino= color(0, 255, 255);


void setup()
{
  size(720,720);
  stroke(0,40);
  background(255);
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
  float pippo =c1x/3;
float pippa = c2x/2;
stroke(pippo, pippa, 60, 50);
 


  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
 
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);  
 line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}
  

 
void mouseClicked()
{
  raggio1 = random(310)+10;
  raggio2 = random(320-raggio1)+10;
  raggio3 = random(330-raggio1-raggio2)+10;
  raggio4 = random(340-raggio1-raggio2-raggio3)+10;
 
  passoAngolo1 = random(0.001,0.2);
  passoAngolo2 = random(0.001,0.2);
  passoAngolo3 = random(0.001,0.2);
  passoAngolo4 = random(0.001,0.2);
   
  background(255);

}




