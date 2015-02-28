
import processing.pdf.*;

void setup(){
size (800,800);
beginRecord (PDF, "lineas 2.pdf");
background (0);

}
void draw (){
for (int a= 10; a<= width; a+=50){
for (int b=10; b<=width; b+=50){
 

noFill();
  stroke (random (55), random (155), random (155), 10);
   beginShape();
   curveVertex (a, 400);
   curveVertex (b,400);
   curveVertex (400, b);
   curveVertex (400,a);
   curveVertex (a,b);
   curveVertex (b,b);
   curveVertex (b,a);
   curveVertex (b,b);
   endShape();

}}
endRecord();
}

