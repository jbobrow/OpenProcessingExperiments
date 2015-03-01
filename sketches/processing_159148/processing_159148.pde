
//import processing.pdf.*;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;

void setup(){
  size(700,700);
  //beginRecord(PDF,"everything.pdf");
  background(255);
  smooth();
frameRate(40);
}
  
void draw(){
  background(r);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam= random(100);
  x=random(width);
  y=random(height); 
  x1=random(width);
  y1=random(height); 
  x2=random(width);
  y2=random(height); 
  x3=random(width);
  y3=random(height);
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  triangle (x1,y1,x2,y2,x3,y3);
  stroke(r,g,a);
 strokeWeight(2);
  line(mouseX,mouseY,width/2,height/2);
  
    if (keyPressed){
      exit();}
//}

//void mouseClicked(){
 // endRecord();

}


