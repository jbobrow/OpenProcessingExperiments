
import processing.pdf.*;
int x,y;
boolean p=false;

void setup(){
  size(800,800);
   background(255);
}

void draw(){

for (int i = 50; i < 800; i = i + 50) {
  point (10, i);
  point (60, i);
  point (110, i);
  point (160, i);
  point (210, i);
  point (260, i);
  point (310, i);
  point (360, i);
  point (410, i);
  point (460, i);
  point (510, i);
  point (560, i);
  point (610, i);
  point (660, i);
  point (710, i);
  point (760, i);
}

 if(mousePressed==true){
    strokeWeight(2);
    line(x,y,mouseX,mouseY);
    x=mouseX;
    y=mouseY;
  };

}

void mousePressed() {
  if(p==false){
    beginRecord(PDF, "Export#####.pdf"); 
    p=true;
  }
}


void keyPressed() {
  endRecord();
  background(255);
  p=false;
}



