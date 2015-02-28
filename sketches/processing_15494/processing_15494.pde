
//"Spin Wheels"
//Valerie Nelkin
//Senior Honors Project 2010

import processing.pdf.*;

float rotation;
float ypoint; 
int spokes = 20;  
DrawLines[] lines = {};
int xPos = mouseX;
int yPos = mouseY;
boolean record;
void setup(){ 
  size (800,600); 
  background(34,7,62); 
  smooth(); 
} 
 
void draw(){ 
 /* if (record) {
    beginRecord(PDF, "spinwheels-####.pdf");
  }*/
if (mousePressed == true){ 
 translate(mouseX,mouseY);
    rotation += 0.05;
    rotate(rotation);   
  lines = (DrawLines[])append(lines, new DrawLines(xPos,yPos));
  }
 /*if (record) {
  endRecord();
 record = false;
 }*/ 
}

void clear() {
  background(random(150),random(150),random(150));
}

class DrawLines {
  int x,y;


DrawLines(int x, int y) { 
 
  translate(x,y);
  strokeWeight(random(10));
  stroke(random(255),random(255),random(255),random(100)); 
    for (int i=0; i< spokes; i++){  //draws wheels of lines
     rotate(random(3.0));  
      DrawLines();  
   }

}

void DrawLines(){ //draw each individual line 

  ypoint = 0;  
  noFill(); 
 
  beginShape();  
  for (int xStart=0; xStart<150; xStart++){  
     float yVariation= random(0,xStart*0.005);  
     vertex(xStart*1.5,ypoint);  
     ypoint = ypoint+yVariation;   
   }   
  endShape();  
} 
}
void keyPressed() {
  /*if (key == 's') {
    record = true;
  }*/
  if (key == 'c') {
  clear();
  }
}

 



