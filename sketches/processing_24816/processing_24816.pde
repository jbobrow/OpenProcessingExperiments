
//import processing.pdf.*;
int x=400;
int h=45;
int g=50;
int c=1000;
int r=300;
void setup(){
size(400,800);
//beginRecord(PDF,"tutu.pdf");
background(0);
smooth();
}
void draw(){
  fill(0);
  stroke(255);
  strokeWeight(3);
 triangle(x, x,58, 20, 86, 75);
 triangle(x,x,86,75,89,123);
 triangle(x,x,96,123,82,130);
 triangle(x,x,109,145,92,150);
 triangle(x,x,149,162,102,140);
 triangle(x,x,129,182,112,180);
 triangle(x,x,179,192,122,160);
 triangle(x,x,139,232,132,170);
 triangle(x,x,109,242,142,190);
 triangle(x,x,9,202,152,200);
 triangle(x,x,89,212,162,210);
 triangle(x,x,89,272,172,230);
 triangle(x,x,56,180,182,240);
 stroke(255);
 strokeWeight(0.2);
fill(0);
bezier(h, r, 100, 90, 25, 100, 100, c);
fill(0);
bezier(h, r, 70, 90, 25, 100, 80, c);
bezier(h,r,150,50,20,39,250,c);


bezier(h,r,20,19,38,29,500,c);
bezier(45,90,90,10,15,25,50,c);
bezier(55,30,90,30,30,25,20,c);
bezier(65,19,90,30,43,25,10,c);
bezier(75,250,90,50,15,25,30,c);
endRecord();
 
}

void keyPressed(){
  if(key=='s'||key=='S');
  {
    
  }
}

