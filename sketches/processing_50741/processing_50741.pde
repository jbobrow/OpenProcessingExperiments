
//import processing.pdf.*;

size(500,500);
//beginRecord(PDF, "circle_pattern.pdf");
background(255);
noFill();
smooth();

for(int i=10; i<width; i+=60)
 {
  for(int j=10; j<height; j+=60)
  {
     stroke(152,251,152); // green
     ellipse(i,j,2,2);
     
     stroke(255,140,0); // orange
     strokeWeight(2);
     ellipse(i,j,20,20);
     
     stroke(255,0,255); //red
     strokeWeight(1);
     ellipse(i,j,30,30);
     
     stroke(0,0,255,200);
     strokeWeight(3);
     line(i+15,j,i,j);
     
     stroke(0); 
     strokeWeight(4);
     ellipse(i,j,40,40);
  }
 }
 //endRecord();

