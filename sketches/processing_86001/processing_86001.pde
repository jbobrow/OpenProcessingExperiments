
float x = 0;
//import processing.opengl.*;

void setup(){
  background(0);
  size(800,200);
  frameRate(60);
 // hint(ENABLE_OPENGL_4X_SMOOTH);
}


void draw(){
  // scale(2,2);
  fill(0,1);
  noStroke();
  rect(0,0,width,height);
  translate(x*100,100);
 
 
  stroke(#6F0108,70);
  line(sin(x)*80,cos(x)*80,-sin(x)*80,-cos(x)*80);
  fill(#6F0108,50);
  line(sin(x)*80-1,cos(x)*80,-sin(x)*80-1,-cos(x)*80);
  
//  line(sin(x+5)*80,-cos(x+5)*80,-sin(x+5)*80,cos(x+5)*80);
//  line(sin(x)*80,-cos(x)*80,-sin(x)*80,cos(x)*80);
//  line(sin(x+5)*80,cos(x+5)*80,-sin(x+5)*80,-cos(x+5)*80);
  
  x=x+0.01;
  println(x);
}

void mousePressed(){
  if(mousePressed == true){
    background(0);
    x = 0;
  }
}



