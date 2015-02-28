
import processing.pdf.*;

float x = 250; 
float y = 100;
float z = 250;
float w = 150;
float e = 250;
float r = 250;
float t = 150;
float q = 255;
float p = 0;
void setup(){
  size(500,500);
  background (0);
  
  
  
  
}



void draw (){
  stroke (255);
  while (y < 250){
  fill (q);
  q = q - 10;
    ellipse (x, y, z ,w );
 y = y + 5 ;
z = z - 0;
w = w - 0;
 }
  
while (e <400){
  fill (p);
  p = p + 7.5;
  ellipse(x, e ,r,t);
  e = e + 5;
  r = r + 0;
  t = t + 0;


}

}
  
  
 void keyPressed (){
   
  save ("image+frameCount.png");
   
   
 }
