
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp10.pdf"); //Keep it up here
size (400, 400);
smooth();
background(#FCB04C);

float xpos = 10;
for (int i = 0; i < 100; i++)
{



  noFill();
  stroke(#DE830B);
  strokeWeight(i/9);
  beginShape();
  vertex(i, xpos);
  vertex(510, (i/12)+200);
  vertex(160, i/2);
  vertex(20, 9*i);
  vertex(i/2, 300);

  endShape();



  noFill();
  stroke(#D8987A);
  strokeWeight(i/9);
  beginShape();
  vertex(i/2, 290);
  vertex(0, (i/13)+20);
  vertex(10, i/5);
  vertex(200, 13*i);
  vertex(i/2, xpos);

  endShape();


  noFill();
  stroke(#D8987A);
  strokeWeight(i/9);
  beginShape();
  vertex(i/2, 290);
  vertex(0, (i/13)+20);
  vertex(10, i/5);
  vertex(200, 13*i);
  vertex(i/2, 900);

  endShape();





  //  line(xpos, 20, xpos, 480);
  //  xpos= xpos + 4;
  //
}
//endRecord();

