
float raggio1 = 150;   // lunghezza del 1Â° segmento
float raggio2 = 120;   // lunghezza del 2Â° segmento
float raggio3 = 90;    // lunghezza del 3Â° segmento
float raggio4 = 60;     // lunghezza del 4Â° segmento
float raggio5 = 30;


float passoAngolo1 = PI/600;  // velocita' di rotazione del 1Â° segmento
float passoAngolo2 = PI/200;  // velocita' di rotazione del 2Â° segmento
float passoAngolo3 = PI/66.6666666666666666666666666666666666666666666666666666666666666666666666666667;
float passoAngolo4 = PI/22.2222222222222222222222222222222222222222222222222222222222222222222222222223;
float passoAngolo5 = PI/7.40740740740744444444444444444444444444444444444444444444444444444444444444444;


void setup()
{
   size(1000,1000);
   background(250);
   frameRate(300);
}

void draw ()
{
   // Centro dell'area di visualizzazione
   float c0x = 500;
   float c0y = 500;
  
   // Calcola l'estremita' finale del 1Â° segmento
   float angolo1 = frameCount * passoAngolo1;
   float c1x = c0x + cos(angolo1) * raggio1;
   float c1y = c0y + sin(angolo1) * raggio1;
  
   // Calcola l'estremita' finale del 2Â° segmento
   float angolo2 = frameCount * passoAngolo2;
   float c2x = c1x + cos(angolo2) * raggio2;
   float c2y = c1y + sin(angolo2) * raggio2;
  
   // Calcola l'estremita' finale del 3Â° segmento
   float angolo3 = frameCount * passoAngolo3;
   float c3x = c2x + cos(angolo3) * raggio3;
   float c3y = c2y + sin(angolo3) * raggio3;
  
   // Calcola l'estremita' finale del 4Â° segmento
   float angolo4 = frameCount * passoAngolo4;
   float c4x = c3x + cos(angolo4) * raggio4;
   float c4y = c3y + sin(angolo4) * raggio4;
  
   float angolo5 = frameCount * passoAngolo5;
   float c5x = c4x + cos(angolo5) * raggio5;
   float c5y = c4y + sin(angolo5) * raggio5;
  
   //++ Calcolare le coordinate cromatiche usando i valori
   //   presenti o ricavati da altre funzioni non randomiche

   //++ Impostare il colore dei tre segmenti
   //   eventualmente con colori diversi

   float color1 = 200- c2x/4;
   float color2 = c4y/3;
   float color3 = c3x/2;

   stroke(color1,color2,color3,50);

   // Disegna il 2Â°, il 3Â° e il 4Â°  du segmento
   line(c1x,c1y, c2x,c2y); 
   line(c2x,c2y, c3x,c3y);
   line(c3x,c3y, c4x,c4y);
   line(c4x,c4y, c5x,c5y);
}


