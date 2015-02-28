
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp4.pdf"); //Keep it up here
//

size (400, 400);
smooth();
background(#FFDD1A);
stroke(113, 219, 200);
strokeWeight(150);
line(0, 0, 400, 0);

for (int i = width; i<1000; i=i+20) {




  line(0, 0, i/2, 400);
  stroke(#E0E54F);
  strokeWeight(i/300);
  line(width-100, 0, i/5, 400);






  stroke(#FFF700);
  strokeWeight(1);

  line(0, i, i+i, i/101);
  line(0, i, i+i+i, i/102);


  line(i, 20, 85, 20);
  stroke(#2F7642);
  strokeWeight(i/350);

  line(0, 0, i/2, 400);
  stroke(#2F7642);
  strokeWeight(i/350);
  line(width, 0, i/5, 400);
}

//endRecord();

