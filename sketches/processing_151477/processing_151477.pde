
//lunghezze
float raggio1 = 130;  // 1° segmento
float raggio2 = 225;   // 2° segmento
float raggio3 = 80;   // 3° segmento
float raggio4 = 40;   // 4° segmento
   
//velocità di rotazione
float passoAngolo1 = PI/780;  // 1° segmento
float passoAngolo2 = PI/300;  // 2° segmento
float passoAngolo3 = PI/160;   // 3° segmento
float passoAngolo4 = PI/90;    // 4° segmento
  
color lilla = color(140, 80, 0);
color arancione = color(150, 150, 250);
void setup()
{
  size(600,600);
  stroke(255,40);
  background(0);
}
   
void draw ()
{
  // Centro dell'area di visualizzazione
  float c0x = 350;
  float c0y = 350;
    
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
     
   
  color middlecolor = lerpColor (lilla, arancione, cos(angolo4)*0.5+0.5);
  stroke (middlecolor, 40);
   
  // Disegna il 2°, il 3° e il 4° segmento
  line(c1x,c1y, c2x,c2y);
  line(c2x,c2y, c3x,c3y);
  line(c3x,c3y, c4x,c4y);
}

