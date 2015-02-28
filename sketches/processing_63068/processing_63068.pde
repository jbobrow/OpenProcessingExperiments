
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp8.pdf"); //Keep it up here

size (400, 400);
smooth();
background(#CBC054);

for (int i = width; i>30; i=i-30) {



  stroke(i, 300-i, 100-i);
  strokeWeight(i/6);
  noFill();
  rect(0, 0, i, i);
rect(i, i, i, i);



  //    rect(i, i/19+i, i/2, i/4);
}
//endRecord();

