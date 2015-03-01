
//import processing.pdf.*;
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float x1;
float x2;
float x3;
float y1;
float y2;
float y3;

void setup(){
  size(500,500);
  background(255);
  //beginRecord(PDF,"everything.pdf");
  smooth();
}
void draw(){
  //each time through draw(), new random numbers are picked for a new ellipse.
  r= random(255);
  g= random(255);
  b= random(255);
  a=random(255);
  diam= random(20);
  x=random(width);
  y= random(height);
  x1= random(width);
  x2= random(width);
  x3= random(width);
  y1= random(height);
  y2= random(height);
  y3= random(height);
      
      //use values to draw an ellipse
    
  stroke(255,0,255,a);
  line(0,500,0,0);
  line(0,0,500,0);
  line(499,0,499,499);
  line(499,499,0,499);
  
  line(5,495,5,5);
  line(5,5,495,5);
  line(495,5,495,495);
  line(495,495,5,495);
  
  line(10,490,10,10);
  line(10,10,490,10);
  line(490,10,490,490);
  line(490,490,10,490);
  
  line(13,487,13,13);
  line(13,13,487,13);
  line(487,13,487,487);
  line(487,487,13,487);
  
  line(15,485,15,15);
  line(15,15,485,15);
  line(485,15,485,485);
  line(485,485,15,485);
  
  line(17,483,17,17);
  line(17,17,483,17);
  line(483,17,483,483);
  line(483,483,17,483);
  
  
  
  //line(250,1,1,250);
  //line(1,250,250,500);
  //line(250,500,500,250);
  //line(500,250,250,1);
  
  stroke(r,g,b,a);
  line(0,0,x2,y2);
  line(x1,y1,500,500);
  
  
   
  //noStroke();
  //fill(r,g,b,a);
  //ellipse(x,y,diam,diam);
  //triangle(x1,y1,x2,y2,x3,y3);
}

//void mouseClicked(){
  //endRecord();
  //noLoop();
  




