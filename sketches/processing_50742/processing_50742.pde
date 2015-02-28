
//import processing.pdf.*;

size(500,500);
//beginRecord(PDF, "flat_ellipses.pdf"); //Keep it up here
background(255);
noFill();
smooth();

for(int i=0; i<width; i+=40)
 {
  for(int j=0; j<height; j+=40)
  {
   float r = random(5);
   
   strokeWeight(3);
   stroke(255,255,0,200);
   ellipse(i, j, r,20);
   stroke(0,255,0);
   strokeWeight(1);
   ellipse(j, i, r, 5);
   stroke(255,0,0);
   ellipse(i,j, i, 10);
   stroke(0,0,255);
   strokeWeight(1);
   ellipse(i,j, r,10);
   
   
   
     }
 }


 

 
//endRecord(); //Keep this at the end

