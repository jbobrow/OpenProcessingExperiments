
import processing.pdf.*;

boolean saveOneFrame = false;

float x,y,a;
float angle=0;
float r=0;
float diff=-1;

void setup(){
  size(600,600);
  background(0);

}


void draw(){
    if (saveOneFrame ==true){
      beginRecord(PDF,"wow.pdf");
    }
  for(int i=0; i<600; i=i+100){
    angle=angle+0.5;
  r=r-diff;
  x=r*cos(angle);
  y=r*sin(angle);
  a++;
  
  
  if(r==0 ||r==300){
    diff=diff*-1;
  }
  if(a>=20){
  a=a-20;
  a++;
  }
  

  fill(255,50);
  noStroke();
  translate(width/3, height/3);
  ellipse(x,y,5+a/10,5+a/10);
  }
  
  if(saveOneFrame == true){
    endRecord();
    saveOneFrame = false;
  }

}

void mousePressed(){
  saveOneFrame = true;
}

