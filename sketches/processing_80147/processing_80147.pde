
import processing.pdf.*;

size(900,600);
beginRecord(PDF,"Trabajo n°1.pdf");
background(95,8,11);
noStroke();
smooth ();

for(int a=0; a<height; a+=100){
 for (int b=0; b< width; b+=100){
  fill(8,20,95,50);
  rect(a,b,height,200);
  //fill (85,8,95,50);
  //rect(a,b,width,200);
}
}
for(int a=50; a<height; a+=100){
 for (int b=50; b< width; b+=100){
  fill (85,8,95,50);
  rect(a,b,height,200);
 }
}

for(int x=450; x<width; x+=50){
  for(int y=200; y<500; y+=50){
fill(152,5,7,75);
 triangle(x,y,575,325,450,325);
 //triangle(575,325,450,450,450,325);
 //triangle(450,450,325,325,450,325);
 //triangle(325,325,x,y,450,325);
 
}
}
for(int x=450; x>0; x-=50){
for(int y=450; y>150; y-=50){
 triangle(x,y,325,325,450,325);
 }
}
endRecord();

