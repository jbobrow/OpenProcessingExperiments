
import processing.pdf.*;

float t= random(50,100);
float y= random(50,100);

size (800,600);

beginRecord (PDF,"dibujo_fijo_1_exportado_4.pdf");

background (0);

for ( int i = 400; i <1600; i +=t){
  for ( int s = 300; s <1200; s+=y){
smooth ();
  stroke(255,128,64);
  strokeWeight(1);
  fill(64,128,255,50);
  
  beginShape();
  curveVertex (i-500,s-400);
  curveVertex (i-400,s-350); 
  curveVertex (i-300,s-250);
  curveVertex (i-250,s-200);
  curveVertex (i-150,s-150);
  curveVertex (i-50,s-50);
  curveVertex ( i , s );
  curveVertex (i+50,s+50);
  curveVertex (i+150,s+150);
  curveVertex (i+250,s+200);
  curveVertex (i+300,s+250);
  endShape ();
  
  }
}

endRecord();

