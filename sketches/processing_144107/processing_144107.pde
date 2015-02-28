
import processing.pdf.*;

int x = 0;

void setup(){
  size(3525,5325);
  background(100,100,100);
  noStroke();
  beginRecord(PDF, "snapbacks.pdf");
  translate(146.87,146.87);
  repeatShape();
  endRecord();
}

void draw(){
  
}

void makeShape(){
  float shapeColor[] = {random(0,255), random(0,255), random(0,255)};
  fill(shapeColor[0], shapeColor[1], shapeColor[2]);
  noStroke();
  ellipse(0,0,200,200);
rect(-100,-100,200,200,0,0,50,50);
  
  //hair
  float stuff[] = {random(0,255), random(0,255), random(0,255)};
  fill(stuff[0], stuff[1], stuff[2]);
  rect(-100,-120,200,50,50,50,0,0);
  
  //hair extra
  triangle(-30,-95,-58,-40,-100,-70);
  
  //hair extra
  triangle(30,-95,58,-40,100,-70);
  
  //eye
  fill(255,255,255);
  ellipse(-30,-5,40,40);
  
  //eye2
  fill(255,255,255);
  ellipse(30,-5,40,40);
  
  //strap
  fill(stuff[0], stuff[1], stuff[2]);
  rect(-60,-55.8,120,15);
  
  //pupil
  fill(0,0,0);
  ellipse(-30,-5,10,10);
  
  //pupil2
  fill(0,0,0);
  ellipse(30,-5,10,10);
  
  //eyebrow
  fill(15,255,231);
  rect(-55,-24.8,50,15,10,10,10,10);
  
  //eyebrow2
  fill(15,255,231);
  rect(6,-30,50,15,10,10,10,10);
  
  //nose
  fill(224,175,144);
  ellipse(0,10,40,30);
  
  //top lip
  fill(242,206,203);
  ellipse(0,30,30,5);
  
  //bottom lip
   fill(242,206,203);
   ellipse(0,33,30,5);
}
void repeatShape(){
  for (int i=0; i < 260; i++){
    //println("MEH" + i);
    makeShape();
    translate(293.75,0);
    x++;
    if (x==12){
     x=0;
    translate(-3525,293.75); 
    }
  }
}



