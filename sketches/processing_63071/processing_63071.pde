
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp11.pdf"); //Keep it up here


size (400, 400);
smooth();
background(#B2AB87);


noFill();
for (int i=1; i<900; i=i+4)
{
  stroke(255,68,i);
  beginShape();
  vertex(width/2, height/4);
  vertex(i, -i);
  vertex(i/2,i);
  endShape();
  

  stroke(15,i,i);
  beginShape();
  
  vertex(i/2,i);
  vertex(width/3, height/i);
  vertex(-i, -i);
  vertex(height, width);
  endShape();





  
}
//endRecord();

