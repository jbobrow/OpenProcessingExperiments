


float raggio1 = 80;  // lunghezza del 1° segmento 
float raggio2 = 80;   // lunghezza del 2° segmento
float raggio3 = 80;   // lunghezza del 3° segmento
float raggio4 = 80;   // lunghezza del 4° segmento

float passoAngolo1 = PI/800;  // velocita' di rotazione del 1° segmento
float passoAngolo2 = PI/400;  // velocita' di rotazione del 2° segmento
float passoAngolo3 = PI/60;   // velocita' di rotazione del 3° segmento
float passoAngolo4 = PI/70;    // velocita' di rotazione del 4° segmento

void setup()
{
  size(480,480);
  stroke(255,50);
  background(255);
 
}

void draw () 
{

  float c0x = 240;
  float c0y = 240;
  
 
  float angolo1 = frameCount*passoAngolo1;
  float c1x = c0x + cos(angolo1)*raggio1;
  float c1y = c0y + sin(angolo1)*raggio1;
  
 
  float angolo2 = frameCount*passoAngolo2;
  float c2x = c1x + cos(angolo2)*raggio2;
  float c2y = c1y + sin(angolo2)*raggio2;
  

  float angolo3 = frameCount*passoAngolo3;
  float c3x = c2x + cos(angolo3)*raggio3;
  float c3y = c2y + sin(angolo3)*raggio3;
  

  float angolo4 = frameCount*passoAngolo4;
  float c4x = c3x + cos(angolo4)*raggio4;
  float c4y = c3y + sin(angolo4)*raggio4;
  
  float rosso =(220);
  float verde = c1y/2;
  float blu =255-c2x/2;
  float alfa = (25);
  stroke(rosso, verde, blu, alfa);


  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}
