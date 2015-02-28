
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp5.pdf"); //Keep it up here
//


size (400, 400);
smooth();
background(#F0A7CA);
noStroke();
for (int y = 0; y <height+100; y+=40) {
  
   fill(227,y-30,y+30);
  ellipse(y,y+10,y+190,y/14);
   ellipse(y-12,y+y/2, y/2,y);
  
  
  fill(224,14+y,91+y);
  ellipse(y+90,y+30,y,y/2);
  ellipse(y,y+30,y/16,y/2);
  
   fill(227,y,y);
  ellipse(y+80,y+30,y+90,y/4);
  ellipse(y+200,y+30,y-50,y/3);
  ellipse(y+300,y+30,y-30,y/5);
  
  

  
}
//endRecord();


