
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
   
   strokeWeight(r);
   stroke(255,255,0,200);
   ellipse(i, j, r,r);
   stroke(0,255,0);
   strokeWeight(4);
   ellipse(j, i, r, r);
   stroke(255,0,0);
   ellipse(i,j, r, r);
   stroke(0,0,255);
   strokeWeight(1);
   ellipse(i,j, r,r);
   
   
   
     }
 }


 

 
//endRecord(); //Keep this at the end

