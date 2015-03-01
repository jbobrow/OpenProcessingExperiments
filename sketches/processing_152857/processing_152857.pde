

 
float raggio1 = 55;  
float raggio2 = 55;   
float raggio3 = 10;   
float raggio4 = 20;   
  
float passoAngolo1 = PI/515;  
float passoAngolo2 = PI/200;  
float passoAngolo3 = PI/20;   
float passoAngolo4 = PI/10;    
  
color verde = color(0, 200, 250);
color giallo = color(200, 255, 0);
 
void setup()
{
  size(600,480);
  stroke(255,50);
  background(0);
}
  
void draw ()
{
 
  float c0x = 300;
  float c0y = 200;
    
 
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
    
 
 
color middlecolor = lerpColor (verde, giallo, cos(angolo4)*0.5+0.5);
  stroke (middlecolor, 30);
   

  line(c1x,c1y, c2x,c2y);
  line(c2x,c2y, c3x,c3y);
  line(c3x,c3y, c4x,c4y);
}


