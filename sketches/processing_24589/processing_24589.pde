
import processing.pdf.*;

void setup(){
  size(400,400);
  background(255);
  smooth(); 

  colorMode(HSB, 100);
}

void draw(){
  float durchmesser = dist(pmouseX, pmouseY, mouseX, mouseY); 
  
  if (mousePressed == true) {

  
  if (durchmesser > 20){
  durchmesser = 20;
  }
  strokeWeight(20-durchmesser);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }  
  
}
 void mousePressed() {
   println("mouse gedrückt");
   stroke(random(100), 100, 100);
 }

void keyPressed(){
  if(key == 's'){
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }
  if(key == 'b'){
    background(100);
  }
  
  if(key == 'p'){
    beginRecord(PDF, "zeichnung.pdf");
    colorMode(HSB, 100);
    background(100);
  }

  if(key == 'e'){
    endRecord();
  }

}
  


