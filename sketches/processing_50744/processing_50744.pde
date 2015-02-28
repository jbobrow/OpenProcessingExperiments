
//import processing.pdf.*;
size(500,500);
//beginRecord(PDF, "gray_waves.pdf");
smooth();
background(255,255);
for(int i=0; i<width; i+=5){
  for(int j=0; j<height; j+=20){
    noFill();
       
    fill(180,205,205);
    ellipse(i,j,5,15);
    fill(255,0,0);
    noStroke();
    rect(i,j,40,2);
    
  }
}
//endRecord();


