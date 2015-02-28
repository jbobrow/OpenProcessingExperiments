
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/28849*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import processing.pdf.*;
import controlP5.*;
ControlP5 controlP5;

public int k=10;
public int l=0;

boolean record;
Slider[] sliders;
 
void setup(){
  size(1800, 600);
  background(255);
  noStroke();
  smooth();
 // frameRate(1);
/*   
  for(int i=0; i<3; i++){
    int mg = ( (int)random(50, 100));
    switch(i){
      case 0:
        k = mg;
        break;
      case 1:
        l = mg;
        break;
      case 2:
        j = k+l;
        break;
    }   
  }
  */
 

   
  controlP5 = new ControlP5(this);
  controlP5.setColorActive(color(80, 200));
  controlP5.setColorBackground(color(170, 200));
  controlP5.setColorForeground(color(80, 200));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));
   
  sliders = new Slider[2];
  int sl = 0;
   
  sliders[sl] = controlP5.addSlider("k", 0, 200, k, 10, 10, 200, 20);
  sliders[sl++].setLabel("Kasterl");
  sliders[sl] = controlP5.addSlider("l", 0, 200, l, 10, 35, 200, 20);
  sliders[sl++].setLabel("Abstand");
}
void draw(){
  int j=k+l;
  if(record==true){
    //String dateiname = words + ".pdf";
    beginRecord(PDF, "####.pdf");
  }
   
  background(0);
  for (int i = l; i <= width; i+=j) {
     for (int y = l; y <= height-l; y+=j) { 
      fill(51,182, 204, random(0,255));
      rect(i, y, k, k);
      
     }
  }
  
  fill(255,255,255);
  //j
  rect(2*j+l, l, k,k);
  rect(3*j+l, l, k,k);
  rect(4*j+l, l, k,k);
  rect(5*j+l, l, k,k);
  rect(6*j+l, l, k, k);
  rect(6*j+l, j+l, k, k);
  rect(6*j+l, 2*j+l, k, k);
  rect(6*j+l, 3*j+l, k, k);
  rect(6*j+l, 4*j+l, k, k);
  rect(5*j+l, 4*j+l, k,k);
  rect(4*j+l, 4*j+l, k,k);
  rect(3*j+l, 4*j+l, k,k);
  rect(2*j+l, 4*j+l, k,k);
  rect(1*j+l, 4*j+l, k, k);
  rect(j+l, 4*j+l, k, k);
  rect(l, 4*j+l, k, k);
  rect(l, 3*j+l, k, k);
  
  //a
  rect(8*j+l, l, k, k);
  rect(8*j+l, j+l, k, k);
  rect(8*j+l, 2*j+l, k, k);
  rect(8*j+l, 3*j+l, k, k);
  rect(8*j+l, 4*j+l, k, k);
  rect(9*j+l, l, k,k);
  rect(10*j+l, l, k,k);
  rect(11*j+l, l, k,k);
  rect(12*j+l, l, k,k);
  rect(13*j+l, l, k,k);
  rect(9*j+l, 3*j+l, k,k);
  rect(10*j+l, 3*j+l, k,k);
  rect(11*j+l, 3*j+l, k,k);
  rect(12*j+l, 3*j+l, k,k);
  rect(13*j+l, 3*j+l, k,k);
  rect(14*j+l, l, k, k);
  rect(14*j+l, j+l, k, k);
  rect(14*j+l, 2*j+l, k, k);
  rect(14*j+l, 3*j+l, k, k);
  rect(14*j+l, 4*j+l, k, k);
  
  //n
  rect(16*j+l, l, k, k);
  rect(16*j+l, j+l, k, k);
  rect(16*j+l, 2*j+l, k, k);
  rect(16*j+l, 3*j+l, k, k);
  rect(16*j+l, 4*j+l, k, k);
  rect(17*j+l, l, k, k);
  rect(18*j+l, j+l, k, k);
  rect(19*j+l, 2*j+l, k, k);
  rect(20*j+l, 3*j+l, k, k);
  rect(21*j+l, 4*j+l, k, k);
  
  rect(22*j+l, l, k, k);
  rect(22*j+l, j+l, k, k);
  rect(22*j+l, 2*j+l, k, k);
  rect(22*j+l, 3*j+l, k, k);
  rect(22*j+l, 4*j+l, k, k);
  
  
   
  if(record == true){
    endRecord();
    record=false;
  }
}
/*
void mousePressed() {
  
}

void mouseReleased() {
  noLoop();
}
*/
 
void keyPressed(){
  if(key == 's' || key == 'S'){
    record = true;
  }
  if(key == 'r' || key == 'R'){
    loop();
  }
}
void keyReleased() {
  if(key == 'r' || key == 'R'){
    noLoop();
  }
}




