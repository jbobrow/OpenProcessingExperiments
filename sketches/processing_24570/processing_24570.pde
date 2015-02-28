
import processing.pdf.*;

float angel;

void setup() {
  size(1260,500);
  smooth();
  background(255);
}





void draw() {
 if(mousePressed == true){
  float getbigger = dist(pmouseX, pmouseY, mouseX, mouseY);
    if(getbigger > 10) {
     
      //fill(0,255,0,70);
    
   }
 // else{
   // fill(0,250,0,0);
 //}
 
  
  ellipse(mouseX,mouseY,getbigger,getbigger);
  line(mouseX,mouseY,getbigger*5, getbigger*2);
  
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(0.1);
   
  }
  
 
}
void mousePressed() {
  println("mouse gedrückt");
  fill(0,random(255),0,10);
  
}

void keyPressed() {
  if (key == 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  
  }

  
  if ( key == 'b') {
    background(255);
  }
  
  if ( key == 'p') {
    beginRecord(PDF, "zeichnung.pdf");
    background (255);
  }
  
  if (key == 'e') {
    endRecord();
  }
}


