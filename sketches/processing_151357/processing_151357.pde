
float raggio1 =200;  
float raggio2 = 120;  
float raggio3 = 50;   
float raggio4 = 90;   

float passoAngolo1 = PI/937;  
float passoAngolo2 = PI/177;  
float passoAngolo3 = PI/31;  
float passoAngolo4 = PI/9;   

void setup()
{
  size(720,720);
  stroke(0,40);
  background(255);
}

void draw () 
{
 
  float c0x = 360;
  float c0y = 360;
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
  float rosso =c1x/4;
  float verde = c1y/4;
float blu = 255-c2x/2;
stroke(rosso, verde, blu, 50);

  line(c1x,c1y, c2x,c2y);  
  line(c2x,c2y, c3x,c3y); 
  line(c3x,c3y, c4x,c4y);
}


