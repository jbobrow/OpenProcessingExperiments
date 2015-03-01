
//lunghezze
float raggio1 = 200;  // 1Â° segmento
float raggio2 = 160;   // 2Â° segmento
float raggio3 = 25;   // 3Â° segmento
float raggio4 = 10;   // 4Â° segmento
  
//velocitÃ  di rotazione
float passoAngolo1 = PI/937;  // 1Â° segmento
float passoAngolo2 = PI/177;  // 2Â° segmento
float passoAngolo3 = PI/31;   // 3Â° segmento
float passoAngolo4 = PI/9;    // 4Â° segmento
 
// SGDM
int myGrey = 0;
int myHSB = 0;
int myGrow = 1;

void setup()
{
  size(720,720);
  stroke(0,40);
  background(0);
  frameRate(240);
  colorMode(HSB,360,100,100);

}
  
void draw ()
{
  // Centro dell'area di visualizzazione
  float c0x = 350;
  float c0y = 350;
    
  // Calcola l'estremita' finale
   
  //1Â° segmento
  float angolo1 = frameCount*passoAngolo1;
  float c1x = c0x + cos(angolo1)*raggio1;
  float c1y = c0y + sin(angolo1)*raggio1;
    
  //  2Â° segmento
  float angolo2 = frameCount*passoAngolo2;
  float c2x = c1x + cos(angolo2)*raggio2;
  float c2y = c1y + sin(angolo2)*raggio2;
    
  //  3Â° segmento
  float angolo3 = frameCount*passoAngolo3;
  float c3x = c2x + cos(angolo3)*raggio3;
  float c3y = c2y + sin(angolo3)*raggio3;
    
  //  4Â° segmento
  float angolo4 = frameCount*passoAngolo4;
  float c4x = c3x + cos(angolo4)*raggio4;
  float c4y = c3y + sin(angolo4)*raggio4;
    
  
    //++ Calcolare le coordinate cromatiche usando i valori
  //   presenti o ricavati da altre funzioni non randomiche
  //setupGrey();
  //stroke(myGrey);
  setupHSB();
  stroke(myHSB, 360, 100, 100);

  
  // Disegna il 2Â°, il 3Â° e il 4Â° segmento
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

