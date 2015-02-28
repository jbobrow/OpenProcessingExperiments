
import controlP5.*;
import processing.pdf.*;
 
 
float rad = 0;
ControlP5 controlP5;
  
public float amount=10; //wieviel kreise?
public float radius=180;
public float angle=450;
public float size=10;
 
float xpos = 0;
float ypos = 0;
  
   
void setup(){
  size(800,800);
  smooth();
    
  controlP5 = new ControlP5(this);
  controlP5.addSlider("amount", 0,10, 5, 10,10, 200, 10); //von, bis, initWert, xpos, ypos, width, height
  controlP5.addSlider("radius", 0,360, 180, 10,30, 200, 10);
  controlP5.addSlider("angle", 0,100, 50, 10,50, 200, 10);
  controlP5.addSlider("size", 0,50, 15, 10,70, 200, 10);
   
   
 
 
}
  
void draw(){
//  background(170);
 
 
stroke(0);
 
pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < amount; i++) {
    xpos = cos(radians(angle))*radius; //kreisfunktion
    ypos = sin(radians(angle))*radius;
    ellipse(xpos, ypos, size,size);
    angle += 360/amount;
  }
popMatrix();
  
}
  
  
void keyPressed(){
   //Save Frame
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }
   
  //Begin Record
  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
  }
   
  //End Record
  if (key=='e'||key=='E')
  {
    endRecord();
    exit();
  }
}


