
//import processing.pdf.*;

size (600, 600);
  //beginRecord (PDF, "ccirculoscontinuos.pdf");
background (0);

stroke (234,21,21);      // color del trazo
 
strokeWeight (2);    // ancho del pincel
 
strokeWeight (2);
for (int i=0; i<600; i+= 20){
  line (300,i,0,300);     // linea line
}
 
for (int i=0; i<600; i+= 20){
  line (600,300,300,i);     // linea line
}
for (int d=600; d>10; d=d-15){
  fill (236,245,2,9);
  ellipse (300,300,d,d);
}
//endRecord ();

