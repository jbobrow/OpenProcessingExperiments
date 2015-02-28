
//"Stained Glass"
//Valerie Nelkin
//Senior Honors Project 2010

import processing.pdf.*;

float r,g,b,valor1, valor2; 

 boolean record;
 
void setup(){ 
  valor1 = 100; 
  valor2 = 15; 
  r = random(255);
  g = random(255);
  b = random(150);
  size(640, 480); 
  smooth(); 
  stroke(150,0,0,100); 
   
  } 
void drawTri() {
 
  stroke(50,200,90);
   fill(10,210);
  //triangle(mouseX, mouseY, 50, 15, 80, 60); 
}

void drawRect(float xPos,float yPos,  float aPos) {
  fill(random(255),random(255),random(255),100); 
      rect(xPos,yPos, aPos*0.5, aPos*0.5); 
}
 
void drawCircs(float aPos) {
  fill(r,g,b,150);
ellipse(mouseX, mouseY, aPos/1.5,aPos/1.5); 
}

void drawLines(float aPos) {
   stroke(r,g,b);
   
  line(mouseX , mouseY, aPos/1.5,aPos/1.5);
}
void draw(){
 /* if (record) {
    beginRecord(PDF, "redGeometryMine-####.pdf");
  } */
  background(10,100);
 strokeWeight(random(2,5)); 
  for(float y = valor1; y <= height-valor1; y += valor2){ 
    for(float x = valor1; x <= width-valor1; x += valor2){ 
     //translate(width/2.5, height/2.5); 
      rotate(PI/3.0); 
      drawTri();
      translate(width/6, height/6); 
      rotate(PI/2); 
      float a; 
      a = 200 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y)); 
      drawRect(x,y,a);
       
      translate(width/4, height/4); 
      rotate(PI/4.5); 
      drawCircs(a);
      drawLines(a);
     
      
}}
 /* if (record) {
    endRecord();
    record = false;
  }*/
}

void mousePressed() {
  setup();
}
/*void keyPressed() {
  if (key == 's') {
    record = true;
  }
}*/


