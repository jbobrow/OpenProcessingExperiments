
//import processing.pdf.*;


size(800, 600);
//beginRecord(PDF,"fijo1.pdf");

float a=0.50;
smooth();
background (255);
fill(255,0,160,50);
smooth(10);
translate(400,300);
for(int x=300; x>=0;x=x-1){ 

  fill(random(245),random(123),random(89));
  rotate(PI/8);
  strokeWeight(1);
  fill(random(124),random(31),random(156));
 ellipse(100,100,x,x);
 strokeWeight(2);
  fill (random(150),random(31),random(52)); 
  ellipse(150,150,x,x);
  fill (random(125),random(123),random(234)); 
  ellipse(200,200,x,x); 
 fill (random(125),random(123),random(234)); 
ellipse(50,50,x,x);
fill (random(150),random(31),random(52)); 
ellipse(250,250,x,x);
}
//endRecord ();
