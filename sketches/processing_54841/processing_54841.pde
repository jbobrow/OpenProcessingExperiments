
/* by: Gina Kim
YSDN 1006 Interactivity Design 3.0
Prof. Borzu
March4, 2012
Credit: http://switchboardonline.co.uk/?p=66
*/

int linea=0;
float angulo = 2.0;


void setup()
{
  background (0);
  size (250,250);
  smooth();
  frameRate (60); //speed of rectangles appearing
stroke (255, 0, 0);//stroke of rectangles
  strokeWeight (5);

}

void draw(){
     fill (random(255), random(255), random(255), random(0,255)); //random colors
     translate (random (400), random (400));
     rotate (angulo); //rotate the rectangles
    
  strokeWeight (random( 10) );//strokeweight is random
   stroke (random (255), random (255), random (255) );
   point ( random(width), random(height)); //circles randomly appearing
   

   rect( random (-50), random(-50), random(50),random(50)); //random rectangles appearing
 linea=linea+1;
   fill (random(255), random(255), random(255));//random colors
   if (linea==500){
     linea=0;
     
    background(random(0,255),random(0,255),random(0,255));// background color changes
  }
  
}
  

