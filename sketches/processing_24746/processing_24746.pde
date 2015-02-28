
//import processing.pdf.*;


float x;
float y;
float x1;
float y1;
void setup(){
  
  size(500,1000);
  // beginRecord(PDF,"rorscachink.pdf");
  background(255);
  
  
}
int r =0;
int i =0;
void draw(){
  
  if(r<150){
x=random(0,1000);
y=random(0,1000);
x1=random(0,1000);
y1=random(0,1000);
stroke(0);
fill(0);
ellipse(x,y,60,60);
ellipse(width-x,y,60,60);

r=r+1;}
if(i<70){
 
   stroke(0);
  fill(0);
ellipse(x,y+10,60,30);
ellipse(width-x,y+10,60,30);

ellipse(x1,y1,20,20);
ellipse(width-x1,y1,20,20);
i=i+1; 
//endRecord();
}
}

