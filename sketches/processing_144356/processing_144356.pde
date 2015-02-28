
import controlP5.*;

ControlP5 cp5;


// defining the table class
Table data;
  // calculates the number of rows in a data-set
int rowCount, month;
int callTimeHours, callTimeMinutes, callType;
int duration;
String callTime;


float r;
float theta = 0;
float x, y;


boolean out = true;
boolean inc = true;
boolean myo = true;
boolean myi = true;

PImage dotBlue;
PImage dotOrange;
PImage dotBluePressed;
PImage dotOrangePressed;

PFont f;

int monthMin = 1;
int monthMax = 12;
int i = 1;
color blue = color(115, 204, 208);
color orange = color(254, 190, 16);
Range months;

/*int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 10;
Slider abc;*/

void setup() {
  size(550,550);
  
  println(PFont.list());
  smooth();
  f = createFont("Helevtica",10);
  textFont(f);
  
  cp5 = new ControlP5(this);
  
 dotBlue = loadImage("dotBlue.png");
 dotOrange = loadImage("dotOrange.png");
 dotBluePressed = loadImage("dotBluePressed.png");
 dotOrangePressed = loadImage("dotOrangePressed.png");
 
  cp5.addToggle("out")
     .setPosition(10,510)
     .setSize(20,20)
     .setImages(loadImage("dotBluePressed.png"), loadImage("dotBlue.png"), loadImage("dotBlue.png"))
     ;
     
     cp5.addToggle("inc")
     .setPosition(40,510)
     .setSize(20,20)
    .setImages(loadImage("dotOrangePressed.png"), loadImage("dotOrange.png"), loadImage("dotOrange.png"))
     ;
     
     cp5.addToggle("myo")
     .setPosition(70,510)
     .setSize(20,20)
     .setImages(loadImage("dotBluePressed.png"), loadImage("dotBlue.png"), loadImage("dotBlue.png"))
     ;
     
      cp5.addToggle("myi")
     .setPosition(100,510)
     .setSize(20,20)
     .setImages(loadImage("dotOrangePressed.png"), loadImage("dotOrange.png"), loadImage("dotOrange.png"))
     ;
     
         months = cp5.addRange("months")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(300,510)
             .setSize(200,20)
             .setHandleSize(10)
             .setRange(1,12)
             .setRangeValues(1,12)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(115, 204, 208))
             .setColorBackground(color(255, 50))  
             ;
             

  /*cp5.addSlider("Months")
     .setPosition(150,525)
     .setWidth(250)
     .setRange(1,12) // values can range from big to small as well
     //.setValue(128)
     .setNumberOfTickMarks(12)
     .setSliderMode(Slider.FLEXIBLE)
     ;*/
     
     
  }
        


void draw() {
background(0);
  
  legend();
  
for(int i = 1; i < 13; i++) {
   println(i);
   data = loadTable(i + ".csv", "header");
  rowCount = data.getRowCount();


  for (int row = 0; row < rowCount; row++) {
    callTime = data.getString(row, "CallTime");
    String callTimeCheck = callTime.substring(1,2);
    String callType = data.getString(row, "CallType");
    
    month = data.getInt(row, "Month");

    if(callTimeCheck.equals(":") == true) {
       callTimeHours = int(callTime.substring(0,1));
       callTimeMinutes = int(callTime.substring(2));
    } else {
       callTimeHours = int(callTime.substring(0,2));
       callTimeMinutes = int(callTime.substring(3));
        }

    int calulatedTime = callTimeHours*60 + callTimeMinutes;
    
 duration = data.getInt(row, "Duration");
   
    duration = duration+10; 

    pushMatrix();
    translate(width/2, height/2);

   if (month >= monthMin && month <= monthMax){
   if(callType.equals("INC") && inc == true || callType.equals("OUT") && out== true) {
      r= 150;   
    }  else {
      r= 200;
    }
    
    theta = calulatedTime * (2*PI / 1439);
    x = (r * cos(theta));
    y = (r * sin(theta));

   if(callType.equals("OUT") && out == true) {    
     fill(115, 204, 208, 60);
      noStroke();
      ellipse(x, y, duration, duration); 
   } else if(callType.equals("MYO") && myo == true) {
     fill(115, 204, 208, 60);
      noStroke();
      ellipse(x, y, duration, duration);    
   }  else if(callType.equals("INC") && inc == true){
      fill(254, 190, 16, 60);
      noStroke();
      ellipse(x, y, duration, duration);
    } else if(callType.equals("MYI") && myi == true){
      fill(254, 190, 16, 60);
      noStroke();
      ellipse(x, y, duration, duration);
    }
   }
 
   /* float info = dist(x, y, mouseX - width/2, mouseY - height/2);
     if(info < 3){
     textAlign(CENTER);
     fill(255);
     text(callTime, mouseX - width/2 + 20, mouseY - height/2);
     text(callType, mouseX - width/2 + 20, mouseY - height/2- 20);
    }  */
  
  popMatrix();
 
  }
}
}


  
 void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.isFrom("range")) {
    monthMin = int(theControlEvent.getController().getArrayValue(0));
    monthMax = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
}


  
  
  
  
  
  
  
  
  
  
  


void legend() {

          strokeWeight(1);
          stroke(30);
          line(275, 25, 275, 490);
          line(10, 275, 540, 275);

          fill (255);
          smooth();
          text("12PM", 10, 270);
          text("12AM", 500, 270);
          text("OUT", 10, 540);
          text("INC", 40, 540);
          text("MYO", 70, 540);
          text("MYI", 100, 540);
          
         
        
}




