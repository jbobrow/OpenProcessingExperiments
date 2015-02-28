
import processing.pdf.*;

void setup () {
  size (800,800, P3D);

  
beginRecord (PDF, " CIRCULOS.pdf");
}

void draw (){
    background (255);
    
  noStroke ();
  fill (255,250,0);
  ellipse (200,500,250,250);
  
  noStroke ();
  fill (129,252,0);
  ellipse (700,600,180,200);
  
  noStroke ();
  fill (252,173,0);
  ellipse (200,480,120,120);
  
   noStroke ();
  fill (255,250,0);
  ellipse (500,200,200,200);
  
     noStroke ();
  fill (255,250,0);
  ellipse (700,600,100,100);
  
     noStroke ();
  fill (255,250,0);
  ellipse (100,200,80,80);
  
    noStroke ();
  fill (252,173,0);
  ellipse (700,80,120,120);
  
    noStroke ();
  fill (252,173,0);
  ellipse (200,100,100,100);
  
     noStroke ();
  fill (252,173,0);
  ellipse (400,600,140,140);
  
    
  noStroke ();
  fill (129,252,0);
  ellipse (600,500,80,80);
  
   noStroke ();
  fill (129,252,0);
  ellipse (350,300,80,80);
  
   noStroke ();
  fill (129,252,0,100);
  ellipse (700,80,80,80);

  for(int i=0; i<900; i+= 300) {
  for(int j=1; j<900; j+=300){
 strokeWeight (2);
fill (250,250,0,200);
 ellipse (i,j,mouseX,mouseY);
  }
  }
  
  for(int i=1; i<900; i+= 200) {
  for(int j=0; j<900; j+=200){
 strokeWeight (2);
    fill (250,0,255,100);
 ellipse (i,j,mouseX,mouseY);
  
  }
  }
  
  for(int i=2; i<900; i+= 100) {
  for(int j=2; j<900; j+=100){
 strokeWeight (2);
    fill (150,0,255,100);
rect (j,i,mouseX,mouseY);
  }
  }

endRecord ();
}

