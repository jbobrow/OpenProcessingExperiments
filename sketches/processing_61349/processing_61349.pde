
import controlP5.*;



 

ControlP5 controlP5;
 
public float form1 = 160;
public float form2 = 100;
public float form3 = 220;
public float farbe = 255;
public float r = 0;
public float g = 177;
public float b = 230;
 
void setup() {
  size(600,600);
  smooth();
   
  controlP5 = new ControlP5(this);
  controlP5.addSlider("form1", 30, 550, 205, 10, 10, 200, 10);
  controlP5.addSlider("form2", 30, 550, 390, 10, 50, 200, 10);
  controlP5.addSlider("form3", 30, 550, 509, 10, 70, 200, 10);
  controlP5.addSlider("farbe", 0, 255, 255, 10, 90, 200, 10);
  controlP5.addSlider("r", 0, 255, 0, 10, 110, 200, 10);
  controlP5.addSlider("g", 0, 255, 177, 10, 130, 200, 10);
  controlP5.addSlider("b", 0, 255, 230, 10, 150, 200, 10);
  


}
 
void draw () {
  background(r, g, b);
  fill(mouseY, 140, 200);
  ellipse(width/2, form3, 50, 50);
  ellipse(width/2, form2, 50, 50);
  ellipse(width/2, form1, 50, 50);
  
  
}
 
void keyPressed(){
   
  if (key== 's' || key == 'S') {
    println("Frame abspeichern");
    saveFrame("dotwork.gif");
  }
 
  if(key == 'b' || key == 'B'){
    beginRecord(PDF,"dotwork.pdf");
  }
   
  if(key == 'e' || key == 'E'){
    endRecord();
  }
}


