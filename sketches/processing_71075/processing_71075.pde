
import processing.pdf.*;

size (800,800);

//beginRecord (PDF,"tipografia2.pdf");

background (0);


for (int a= 0; a< width; a+=random(50)){
  for (int b=0; b<width; b+=random(5)){
smooth();
    strokeWeight (1);
noFill();
   stroke (random (255), random (255), random (255), 40);
   beginShape();
   //curveVertex (a,b);
   curveVertex (a,50);
   curveVertex (b,300);
   curveVertex (a,b);
   //curveVertex (a,100);
   curveVertex (700,a);
   endShape();
//   ellipse (a, b, 30,30);
}}

//endRecord();

