

size (800,800);
beginRecord ();

background (0);


 for (int b=6; b<800; b+=70){
 for (int c=6; c<800; c+=70){

noFill();
   stroke (random (250), random (210), random (0), 150);
   beginShape();
   curveVertex (b,b);
   curveVertex (c,c);
   curveVertex (c,b);
   curveVertex (80,c);
   curveVertex (80,b);
   curveVertex (b,60);
   curveVertex (c,60);
   curveVertex (b,c);
  
 
 
   endShape();
  ellipse (c,b,20,20);


}}
 

