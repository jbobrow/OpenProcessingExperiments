
 // int y = 15; //"global"
 size(500,500);
//import processing.pdf.*;

//beginRecord(PDF, "500_bandaids.pdf");

smooth();
background(255);
fill(0,12);
stroke(50,100);


for(int i=10; i<width; i+=20) // "local"
{
  for(int j=10; j<height; j+=20)
{
  //fill(20,0,0,20);
  //ellipse(i,j, 60,60);
  float r = random(50);
  strokeCap(ROUND);
  strokeWeight(4);
  stroke(0,0,255);
  line(i,j,i+10,j+10);
  strokeWeight(4);
  stroke(199,21,133);
  line(i+10,j,i, j+10);
 }
}
//endRecord();



