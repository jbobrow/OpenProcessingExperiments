
////CREATED BY MIKE WIRTH ART ©2009///

int i;
float space=5.5;
import processing.pdf.*;
boolean saveOneFrame = false;
void setup() {

size(800,400);
smooth();
background(255,251,197);

}


void draw(){
 // beginRecord(PDF, "line" + second()+ ."pdf"); 
  background(255,251,197);
strokeCap(SQUARE);
for(i=0; i<3;i++){
  stroke(random(255),25,0,245);
  strokeWeight(random(12,190));
line(random(200,450)+space, random(100,250), random(100,550), random(200,350));

}

fill(random(255),25,0,245);
ellipse(random(150,500),random(100,300), 12,12);
noStroke();
triangle(random(200,400),random(200,300), random(300,400),random(100,300),random(100,400),random(200,300));
noLoop();
//endRecord();
}


