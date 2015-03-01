



float raggio1 = 144;  // lunghezza del 1° segmento 
float raggio2 = 72;   // lunghezza del 2° segmento
float raggio3 = 36;   // lunghezza del 3° segmento
float raggio4 = 18;   // lunghezza del 4° segmento
float raggio5 = 9;

float passoAngolo1 = PI/937;  // velocita' di rotazione del 1° segmento
float passoAngolo2 = PI/177;  // velocita' di rotazione del 2° segmento
float passoAngolo3 = PI/31;   // velocita' di rotazione del 3° segmento
float passoAngolo4 = PI/9;    // velocita' di rotazione del 4° segmento
float passoAngolo5 = PI/3;
 color green= color(0,255,13,10);
 color blue= color (0,6,205,10);
 
void setup()
{
  size(720,720);
  stroke(0,40);
  background(0);
  frameRate(30);
  
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
  
  //Calcola l'estremita' finale del 5° segmento
  float angolo5 = frameCount*passoAngolo5;
  float c5x = c4x + cos(angolo5)*raggio5;
  float c5y = c4y + sin(angolo5)*raggio5;
  //++ Calcolare le coordinate cromatiche usando i valori 
  //   presenti o ricavati da altre funzioni non randomiche

  //++ Impostare il colore dei tre segmenti
  //   eventualmente con colori diversi
  color mid=lerpColor(blue,green,sin(angolo1));
   stroke(mid);
   
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
  line(c5x,c5y, c1x,c1y);
}


