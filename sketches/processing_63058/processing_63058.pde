
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp3.pdf"); //Keep it up here


size (400,400);
smooth();
background(#cccbbb);

for (int i = 20; i<width; i+=20){
  
  strokeWeight(i/19);
  strokeCap(SQUARE);
  stroke(18, i+10, 255);
  line(i, 0, i-i/12, i);
  line(i-i/12, 80, i*1.2, 900);
  
    strokeWeight(i/50);
  strokeCap(SQUARE);
  line(i, 0, i, i);
  
  strokeWeight(i/50);
  stroke(18+i, i, 15+i);
  strokeCap(SQUARE);
  line(i*i, 0, i-i/5, i);
  line(width, 0, i-i/5, i);
  
}
//
//endRecord(); 

