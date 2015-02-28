
import processing.pdf.*;


float x,y;
float angle=0;
float r=400;

float diff=1;

void setup(){
  size(600,600);  
  background(120,193,174);
 //pdf

}

void draw(){
 
  x= r*cos(angle);
  y= r*sin(angle);
 
  noFill();
  stroke(0.66,5);
  //gai yuan dian
  translate(300,300);
  rotate(r);
 

  ellipse(0,0,x,y);
  ellipse(x/2,y/2,30,30);
 
  ellipse(0,0,x,y);

  ellipse(x/2,y/2,30,30);
 
 
  angle= angle +0.1;
  r= r- diff;
 
  if(r==0||r==400){
    diff=diff*-1;
  }  
   
    println(x);  
}


//pdf
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
