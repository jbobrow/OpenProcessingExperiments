
//"Modern Decor"
//Valerie Nelkin
//Senior Honors Project 2010

import processing.pdf.*;

float margen, sp, r,g,b; 
boolean record;
void setup(){ 
  margen=20; 
  sp=30; 
  size(500,500); 
  smooth(); 
  strokeWeight(2);
  r = random(100,200);
  g = random(100,200);
  b = random(100,200);
background(r,g,b); 
} 
void draw(){
// if (record) {
  //beginRecord(PDF, "moderndecor-####.pdf");
 //} 
  background(r,g,b); 
 for(float y= margen; y <= height-margen; y += sp){ 
 for(float x= margen; x <= width-margen; x += sp){ 
 float d; 
   d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)); 
 
   stroke(b-30,g-30,r-30,80); 
   triangle(x, y , d, d, d, d); 
   stroke(r-30,b+30,g+30,80);
   line(d,d,mouseX,mouseY);
   stroke(g+30,r+30,b+30); 
   fill(100);
   ellipse(x, y, 400/d, 400/d);    
 
}
fill(r+40,g+20,b+60,50);
ellipse(mouseX,mouseY, r,r);
 }
 if (record) {
 endRecord();
 record = false;
 }
 } 
void mousePressed() {
  setup();
}
//void keyPressed() {
  //if (key == 's') {
    //record = true;
  //}
//}


