
import processing.pdf.*;

void setup(){
size(800,800);
 beginRecord (PDF,"cuadraditos.pdf");
  background(0);
}
 void draw (){

 frameRate(50);
 for(int i=0;i<width;i+=20){
 for(int a=0;a<width;a+=20){
 
  fill(random(48), random (252), random(233),30);
  rect(a,i,100,100);

 } 
}
 endRecord();
 }

