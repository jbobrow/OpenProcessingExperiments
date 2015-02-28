
//import processing.pdf.*;
void setup(){
size(200,400);
smooth();
PImage b;
b=loadImage("material.jpg");



 
image(b, 50, 0);
b.resize(200,400);
background(b);
 noLoop();
//  beginRecord(PDF, "wallpapfinal1.pdf");
}
void draw(){
  strokeWeight(2);
PImage b; 
b = loadImage("material.jpg"); 
image(b, 0, 0); 

tint(185,185,163); 
image(b, 50, 0);
 endRecord();

}


