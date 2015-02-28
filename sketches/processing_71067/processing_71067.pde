
import processing.pdf.*;


size (800,800);

beginRecord (PDF, "lineas.pdf");
background (191,15,15);


for (int a= 10; a<= width; a+=50){
for (int b=20; b<=width; b+=40){


smooth();
noFill();
  stroke (0, 40);
   beginShape();
   curveVertex (a, 200);
   curveVertex (400, b);
   curveVertex (a, 300);
   curveVertex (400, 15);
   curveVertex (b, a);
   curveVertex (200, b);
   endShape();
   
}
}

endRecord ();

