
import processing.opengl.*;

int windowWidth = 500;
int windowHeight = 500;
int i = 0;
int j = 0;
int kolor = 1;
int richtung = 1;
int s = 1;

int m = 0;


void setup () {
 
  size(500, 500, P2D);
  smooth();
  background(0);
  
}

void draw() {
  
  // QUELLCODE FÜR DEN LOOP //
  
  noStroke();
  
  for(j = 0; j < windowHeight/10; j=j+1) {
   
    for(i = 0; i < windowHeight/10; i=i+1) {
      
      fill(kolor);
      //rect(i, j, i+1, j+1);
      
//      if(mouseButton == LEFT && s < 10) { ++s; }
//      if(mouseButton == RIGHT && s > 0) { --s; }
      
      ellipse(i*10, j*10, random(1, 10), random(1, 10));
      
      // Grauwert nach oben zählen und wieder hinunter
      
      if(kolor == 255 || kolor==0) { richtung *= -1; }
      kolor += richtung;
      
    }
    
  }
  
  if(m == 10) {
      
        fill (0, 10);
        noStroke();
        rect(0, 0, windowWidth, windowHeight);
        m = 0;
        
      } else { m = m + 1; }
  
}

