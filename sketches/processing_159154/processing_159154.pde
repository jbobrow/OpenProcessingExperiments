
//import processing.pdf.*;

float r;
float g;
float b;
float a;
float x;
float y;
float diam;

void setup(){
  size(400,400);
  //beginRecord(PDF,"everything.pdf");
}

void draw(){
  r=random(10);
  g=random(255);
  b=random(255);
  a=random(255);
  x=random(800);
  y=random(800);
  diam=random(20);
  stroke(r,g,a);
  strokeWeight(5);
  line(mouseX,mouseY,width/2,height/2);
  strokeWeight(2);
  ellipse(x,y,diam,diam);
  fill(r,g,b,a);
}

//void mouseClicked(){
  //endRecord();
  //noLoop();
//}


