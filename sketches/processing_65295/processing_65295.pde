
import controlP5.*;
PFont font;

ControlP5 cp5;

int value = 0;


void setup(){
  size(500,300);
  background(0,0,0);
  gui();
  font = loadFont("Eurostile-ExtendedTwo-12.vlw"); 
  
}

void gui(){
  
  cp5 = new ControlP5(this);
  cp5.addSlider("Width")
     .setPosition(20,20)
     .setSize(150,20)
     .setRange(0,460)
     .setValue(300)
     ;
     
  cp5.addSlider("Height")
     .setPosition(20,40)
     .setSize(150,20)
     .setRange(0,170)
     .setValue(50)
     ;
     
  cp5.addSlider("Trusses")
     .setPosition(20,60)
     .setSize(150,20)
     .setRange(0,20)
     .setValue(6)
     .setNumberOfTickMarks(21)
     ;   
}

void draw(){
   background(0);
   textFont(font); 
   text("Single truss unit", 335, 20);
   float s1 = cp5.getController("Width").getValue();
   float s2 = cp5.getController("Height").getValue();
   float s3 = cp5.getController("Trusses").getValue();
   truss pop2 = new truss(s1,s2,s3,20,110);
   truss pop3 = new truss(s1/s3,s2,1,380,30);
   pop2.drawthetruss();
   pop3.drawthetruss();
  }




