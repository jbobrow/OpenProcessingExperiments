
 // int y = 15; //"global"
 size(500,500);
//import processing.pdf.*;

//beginRecord(PDF, "500_bandaids.pdf");

smooth();
background(255);
fill(0,12);
stroke(50,100);


for(int i=10; i<width; i+=10) // "local"
{
  for(int j=10; j<height; j+=10)
{
  smooth();
//translate(70, 70);
rotate(HALF_PI);
//rect(j, i, 20, 52);
stroke(#ffa07a);

rect(i, j, 2, 12);
fill(0,0,255);
noFill();
rect(j, i, 12, 2);
 }
}
//endRecord();



