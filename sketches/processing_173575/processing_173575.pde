
//import processing.pdf.*;

size(750,500);
//beginRecord(PDF,"DIBUJO FIJO 3.pdf");
background(248,252,120);


for(int x=30;x<height;x=x+2){
  
  noFill();
  stroke(random(250),random(250),random(250),120);
  strokeWeight(random(5));
  
  rect(random(950),random(920),random(x-500),random(x+350));
 
 strokeWeight(random( 150));
 fill(random(255),random(255),random(255),20);
 point(random(150),random(x+500));
 

}
//endRecord();
