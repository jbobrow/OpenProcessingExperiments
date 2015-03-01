
//import processing.pdf.*;
float a=3.50;
float b=0.1;
size(600,600);
//beginRecord(PDF,"juego de bolas.pdf");

background(#08FFF9);


for (int i=-10; i<height; i+=25) {
for (int j=-10;j<800;j+=25){
  fill(#FF4D71, random(200));
  strokeWeight (1);
  stroke(#B71F5F);
  smooth();
  ellipse (i,j,20,20);

}

}
//endRecord();






