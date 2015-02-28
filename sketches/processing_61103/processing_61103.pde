
import controlP5.*;
 
ControlP5 controlP5;
  
float part1 = 160;
float part2 = 100;
float part3 = 220;
float r = 0;
float g = 177;
float b = 230;
  
void setup() {
  frameRate(0.5);
  size(800,800);
  smooth();
    
  controlP5 = new ControlP5(this);
  controlP5.addSlider("part1", 0, 600, 100, 10, 20, 200, 10);
  controlP5.addSlider("part2", 0, 600, 300, 10, 40, 200, 10);
  controlP5.addSlider("part3", 0, 600, 500, 10, 60, 200, 10);
  controlP5.addSlider("r", 0, 255, 130, 10, 100, 200, 10);
  controlP5.addSlider("g", 0, 255, 130, 10, 120, 200, 10);
  controlP5.addSlider("b", 0, 255, 130, 10, 140, 200, 10);
   
 
 
}
  
void draw () {
  background(255);
  fill(r, 0, 0);
  noStroke();
  rect(500, part1, 50, part2);
  fill(0, g, 0);
  rect(400, part2, 50, part3);
  fill(0, 0, b);
  rect(300, part3, 50, part1);
   
   
}
  
void keyPressed(){
    
  if (key== 's' || key == 'S') {
    println("Frame abspeichern");
    saveFrame("rectangles.gif");
  }
  
  if(key == 'b' || key == 'B'){
    beginRecord(PDF,"rectangles.pdf");
  }
    
  if(key == 'e' || key == 'E'){
    endRecord();
  }
}

