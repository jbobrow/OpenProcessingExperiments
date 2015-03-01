
//import processing.pdf.*;


size(800,800);
background(0);
//beginRecord(PDF, "sketch_140417a.pdf");
noStroke();
fill(23,212,55);
for(int x=0;x <height; x = x+800){
 for(int y=0; y<width; y=y+80){
rect(x,y,800,80);
 }}
 fill(225,45,8);
for (int a=0; a<height; a=a+160){
for (int i=0; i<width; i=i+80){
beginShape();
curveVertex(a,i);
curveVertex(10+a,i+10);
curveVertex(80+a,i+60);
curveVertex(10+a,i+80);
curveVertex(10+a,i+50);
curveVertex(0+a,i+80);
endShape();
for (int g=0; g<height; g=g+180){
 for (int j=0; j<width; j=j+80){
beginShape();
curveVertex(g+160,j+1);
curveVertex(g+150,j+11);
curveVertex(g+80,j+61);
curveVertex(g+140,j+81);
curveVertex(g+150,j+51);
curveVertex(g+160,j+81);
endShape();
}}}}

//endRecord();
