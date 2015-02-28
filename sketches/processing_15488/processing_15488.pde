
//"Layered Discs"
//Valerie Nelkin
//Senior Honors Project 2010

import processing.pdf.*;

float r; 
 boolean record;
void setup() 
{ 
  size(700, 700); 
  smooth();  
  strokeWeight(3); 
  background(196); 
 
} 
 
void draw() 
{
 // if (record) {
   // beginRecord(PDF, "layereddiscs-####.pdf");
  //}
 stroke(random(150)); 
  fill(random(100));   
 
 if (keyPressed) {
  if (key == ' ') 
  { 
    background(196); 
  } 
  if (key == 'b') {
    stroke(random(50),random(50),random(255)); 
    fill(random(50),random(50),random(255));  
 }
 if (key == 'r') {
    stroke(random(255),random(50),random(50)); 
    fill(random(255),random(50),random(50));  
 }
 if (key == 'g') {
    stroke(random(50),random(255),random(50)); 
    fill(random(50),random(255),random(50));  
 }
 if (key == 'a') {
    stroke(random(255),random(255),random(255)); 
    fill(random(255),random(255),random(255));  
 }
  
 }
 if (mousePressed) 
  {  r = random(0, 100); 
   if (mouseButton == LEFT) {
    ellipse(mouseX, mouseY, r, r); 
    ellipse(width-mouseX, mouseY, r, r);
    } 
  if (mouseButton == RIGHT) {
    ellipse(mouseX, mouseY, r, r); 
    ellipse(width-mouseX, mouseY, r, r); 
    ellipse(mouseX, height-mouseY, r, r);
    ellipse(width-mouseX, height-mouseY, r, r);
  }
  if (mouseButton == CENTER) {
    ellipse(mouseX, mouseY, r, r); 
    ellipse(mouseX, height-mouseY, r, r);
  }
}
if (record) {
  endRecord();
  record = false;
}
}

//void keyPressed() {
  //if (key == 's') {
  //saveFrame("layereddiscs-####.tiff");
 //}
//}
 



