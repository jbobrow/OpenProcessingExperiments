
import peasy.*;
import toxi.geom.*;
import toxi.processing.*;
import controlP5.*;
//  import javax.media.opengl.*;
//  import processing.opengl.*;
//import processing.dxf.*;
ToxiclibsSupport gfx;


//Exporting Geometry
String cadSoftware, customerEmail, clockName, orderID , ext;
boolean record = false;

//Window Setup
int windowX = 800;
int windowY = 720;
int nonActiveZone = 150;

int nameCounter = 1;

//Curve Stuff
  float tempX1;
  float tempY1;
  float tempX2;
  float tempY2;
  float toolDepth;
  float centerToolDepth = 6;
  float minToolDepth = 4;
  float maxToolDepth;
  float handWidth = 3;

float X1;
float Y1;
float X2;
float Y2;
  
float outX;
float outY;
float inX;
float inY;

//Update Counters
int update = 0;
int firstRun = 0;


//Arrays for curves
ArrayList curvePTS;
Spline2D s;
Spline2D eS;




//resolution of geometry - lower number the higher the resolution
int resolution = 12;
int triangleResolution = 1;
float tightness = .1;
int resolutionExport = 8;
float Price;


PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3;
ControlP5 controlP5;
PImage vault;

Textlabel myTextlabelA;


//-------------Clock Dimention Variables----------

//PATTER ID - defines the order of connecting the control points into a curve.
float[] patternID = {0,0,1,0,1,4,6,2};

//NUMBER OF DIVISIONS
public int divisions = 24;

// default RADII OF EACH SET OF CONTROL POINTS - these are adjustable with sliders
float innerRadii = .25;
float middleRadii1 = 3;
float middleRadii2 = 7;
float outerRadii = 8;


//Storage for the points along a circle
float[][] innerPoints = new float[48][48];
float[][] middlePoints1 = new float[48][48];
float[][] middlePoints2 = new float[48][48];
float[][] outerPoints = new float[48][48];

//Storage for the points for an individual curve
float[][] curvePoints = new float[8][8];

//mediumFont
PFont pfont = createFont("Arial",11,true); // use true/false for smooth/no-smooth
ControlFont font = new ControlFont(pfont);

//biggerFont
PFont pfont2 = createFont("Arial Bold",11,true); // use true/false for smooth/no-smooth
ControlFont font2 = new ControlFont(pfont2); 
  



void setup() {
  size(800,720,P3D);
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(500);
  cam.pan(0,-30);
  gfx=new ToxiclibsSupport(this);
 
  
//Logo image
vault = loadImage("ParaClocks_Logo.png");
 

//--------------------------------------- CONTROLP5
  controlP5 = new ControlP5(this);
  
  controlP5.addTextlabel("label")
     .setText("BASIC PARAMETERS")
     .setPosition(8,10)
     .setColorValue(0xff444444)
     .setFont(createFont("Arial Bold",15))
     ;
  
  controlP5.addTextlabel("label2")
     .setText("CURVE ADJUSTER")
     .setPosition(265,10)
     .setColorValue(0xff444444)
     .setFont(createFont("Arial Bold",15))
     ;
     
  controlP5.addTextlabel("label3")
     .setText("PRESETS")
     .setPosition(460,10)
     .setColorValue(0xff444444)
     .setFont(createFont("Arial Bold",15))
     ;
   controlP5.addTextlabel("label4")
     .setText("SEND YOUR DESIGN!")
     .setPosition(555,10)
     .setColorValue(color(#6F1BDE))
     .setFont(createFont("Arial Bold",15))
     ;
     

  controlP5.addSlider("Outer_Diameter")
     .setPosition(10,35)
     .setWidth(150)
     .setHeight(10)
     .setRange(8,16) // values can range from big to small as well
     .setValue(16)
     .setNumberOfTickMarks(9)
     .setSliderMode(Slider.FIX)
     .captionLabel().setText("Size (Inches)")
     .setControlFont(font2)
     .toUpperCase(false)
     ;
     
  controlP5.addSlider("Divs")
     .setPosition(10,55)
     .setWidth(150)
     .setHeight(10)
     .setRange(12,48) // values can range from big to small as well
     .setValue(24)
     .setNumberOfTickMarks(4)
     .setSliderMode(Slider.FLEXIBLE)
     .captionLabel().setText("# of Divisions")
     .setControlFont(font)
     .toUpperCase(false)
     ;
  
  controlP5.addSlider("Middle_Radius_1", 5, 95, (middleRadii1/middleRadii2)*100, 10 , 85, 150, 10)
     .captionLabel().setText("Mid Adjustment 1")
     .setControlFont(font)
     .toUpperCase(false);
      
  
     
  controlP5.addSlider("Middle_Radius_2", 5, 95, (middleRadii2/outerRadii)*100, 10 , 105, 150, 10)
     .captionLabel().setText("Mid Adjustment 2")
     .setControlFont(font)
     .toUpperCase(false);
  
  controlP5.addSlider("Tightness", 0, .25, .1, 10 , 125, 150, 10)
     .captionLabel().setText("Curvy-ness")
     .setControlFont(font)
     .toUpperCase(false);
     
  controlP5.addSlider("1")
     .setPosition(270,35)
     .setValue(0)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ;
  controlP5.addSlider("2")
     .setPosition(300,35)
     .setValue(1)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ; 
   controlP5.addSlider("3")
     .setPosition(330,35)
     .setValue(0)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ;
   controlP5.addSlider("4")
     .setPosition(360,35)
     .setValue(1)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ;
   controlP5.addSlider("5")
     .setPosition(390,35)
     .setValue(0)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ;
   controlP5.addSlider("6")
     .setPosition(420,35)
     .setValue(1)
     .setSize(10,100)
     .setRange(0,11)
     .setNumberOfTickMarks(12)
     ;  
     
 
   
// create a new button with name 'buttonA'

controlP5.addButton("  Bloom")
.setPosition(465,35)
.setSize(10,10)
;

controlP5.addButton("  Stella")
.setPosition(465,48)
.setSize(10,10)
;

controlP5.addButton("  Rose")
.setPosition(465,61)
.setSize(10,10)
;

controlP5.addButton("  Ruffle")
.setPosition(465,74)
.setSize(10,10)
;

controlP5.addButton("  Vault")
.setPosition(465,87)
.setSize(10,10)
;

controlP5.addButton("  Warpweft1")
.setPosition(465,100)
.setSize(10,10)
;

controlP5.addButton("  Warpweft2")
.setPosition(465,113)
.setSize(10,10)
;

controlP5.addButton("  Random Curve")
.setPosition(465,126)
.setColorLabel(color(160,64,245))
.setSize(10,10)
;

 controlP5.addTextfield("Clock Name")
     .setPosition(560,35)
     .setSize(150,15)
     .setFocus(true)
     .setColor(color(255,0,0))
     .captionLabel().setText("Clock Name")
     .setControlFont(font)
     .toUpperCase(false)
     ;
                 
 controlP5.addTextfield("Order ID#")
     .setPosition(560,70)
     .setSize(150,15)
     .setAutoClear(false)
     .captionLabel().setText("Order ID#")
     .setControlFont(font)
     .toUpperCase(false)
     ;
     
  controlP5.addTextfield("Your Email Address")
     .setPosition(560,105)
     .setSize(150,15)
     .setAutoClear(false)
     .captionLabel().setText("Your Email Address")
     .setControlFont(font)
     .toUpperCase(false)
     ;
       
 controlP5.addBang("Submit")
     .setPosition(727,105)
     .setSize(60,15)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    


 
  //------------------------------------------------

curvePTS = new ArrayList(); 

controlP5.setAutoDraw(false);
}



void draw() {
  
  rotateX(-.5);
  rotateY(-.5);
  background(255);
  fill(255,0,0);
   directionalLight(126, 126, 126, -1, -1, -1);
  ambientLight(102, 102, 102);

  for (update = 0; update < 1; update++){
  createControlPoints();
  createSplines();
  createGeometry();
  createClockHands();
  firstRun = 1;
  update = 1;
}


gui();
}






public void Submit() {

    orderID = controlP5.get(Textfield.class,"Order ID#").getText(); 
    clockName = controlP5.get(Textfield.class,"Clock Name").getText(); 
    customerEmail = controlP5.get(Textfield.class,"Your Email Address").getText(); 
    
    saveFrame(orderID+clockName+".jpg");
//    
//    beginRaw(DXF, orderID + clockName + ".dxf");  

    
    exportGeometry();
     
    endRaw();
    
    link("http://www.paraclocks.com/thankyou/", "_new"); 
   
}




//--------------------------------------- CONTROLP5 DISPLAY
void gui() {      //displays sliders 2d while having 3d camera view

  cam.beginHUD();


    pushStyle();
      noLights();
      noStroke();
      fill(0,50);
      rect(0, 0, width, nonActiveZone);
     
      image(vault, 0, windowY-70, 800, 70);
      
      
    
      controlP5.getController("Middle_Radius_1").getValueLabel().setText(" ");
      controlP5.getController("Middle_Radius_2").getValueLabel().setText(" ");
 


      
      controlP5.setColorForeground(#6F1BDE);
      controlP5.setColorBackground(#320032);
      controlP5.draw();
      
      


pushMatrix();

scale(.8);
translate(110,295);

//line diagram
beginShape();
strokeWeight(1);
noFill();
stroke(#6F1BDE);
for(Iterator Count=s.computeVertices(resolutionExport).iterator(); Count.hasNext();) {

Vec2D dV=(Vec2D)Count.next();

curveVertex(dV.x, dV.y);

}
endShape();

//outer circles
beginShape();
fill(230,10);
strokeWeight(.5);
stroke(200,200);
ellipse(0,0,outerRadii*24,outerRadii*24);
ellipse(0,0,innerRadii*24,innerRadii*24);
ellipse(0,0,middleRadii1*24,middleRadii1*24);
ellipse(0,0,middleRadii2*24,middleRadii2*24);
endShape();


beginShape();
fill(230,10,200);
strokeWeight(.5);
stroke(200,200);
//diagram dots
for (int i = 0; i < divisions; i++){
ellipse(innerPoints[i][0],innerPoints[i][1],4,4);
  }
for (int i = 0; i < divisions; i++){
ellipse(middlePoints1[i][0],middlePoints1[i][1],4,4);   
  }  
for (int i = 0; i < divisions; i++){
ellipse(middlePoints2[i][0],middlePoints2[i][1],4,4);
  }
for (int i = 0; i < divisions; i++){
ellipse(outerPoints[i][0],outerPoints[i][1],4,4);
  }
endShape();


//text labels
beginShape();
fill(0);
textSize(12);
for (int j = 1; j < patternID.length-1; j++){
  
String curveLabel = ""+j;
text(curveLabel, curvePoints[j][0]+3,curvePoints[j][1]-3);
}

endShape();
noStroke();
popMatrix();

//Displays the Price
//text("$" + Price, 725,100); 

 popStyle();

  cam.endHUD();
}
 
 
 
//Event area for GUI------------------------

void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to
     the controlEvent method. by checking the name of a controller one can
     distinguish which of the controllers has been changed.
  */
  
  /* check if the event is from a controller otherwise you'll get an error
     when clicking other interface elements like Radiobutton that don't support
     the controller() methods
  */
   
  if(theEvent.isController()) {
     
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
     
    if(theEvent.controller().name()=="Middle_Radius_1") {
    
     update = 0;
     firstRun = 0;
     middleRadii1 = (theEvent.controller().value()/100)*middleRadii2;
     clearPTSArray();
   
    }
     
    if(theEvent.controller().name()=="Middle_Radius_2") {
        update = 0;
     firstRun = 0;

     middleRadii2 = (theEvent.controller().value()/100)*outerRadii;
     middleRadii1 = (controlP5.controller("Middle_Radius_1").getValue()/100)*middleRadii2;
     clearPTSArray();
    }
         
    if(theEvent.controller().name()=="Outer_Diameter") {
      update = 0;
      firstRun = 0;
      outerRadii = theEvent.controller().value()/2;
      middleRadii2 = (controlP5.controller("Middle_Radius_2").getValue()/100)*outerRadii;
      middleRadii1 = (controlP5.controller("Middle_Radius_1").getValue()/100)*middleRadii2;
     
     //Controls the Price
//      Price = 250 + theEvent.controller().value();
      
      
      if (theEvent.controller().value() <= 12){
      centerToolDepth = 3;
      minToolDepth = 2.5; 
      handWidth = 2.5;
    }else{
      centerToolDepth = 6;
      minToolDepth = 3.5;
      handWidth = 3;
      }
  
      clearPTSArray();
    }   
    if(theEvent.controller().name()=="Divs") {
      update = 0;
      firstRun = 0;
      divisions = int(theEvent.controller().value());
      clearPTSArray();
    } 
    
     if(theEvent.controller().name()=="Tightness") {
     update = 0;
     firstRun = 0;
     tightness = theEvent.controller().value();
     clearPTSArray();
    }
    
    if(theEvent.controller().name()=="1") {
      update = 0;
      firstRun = 0;
      patternID[0] = int(theEvent.controller().value());
      patternID[1] = int(theEvent.controller().value());
      clearPTSArray();
    } 
    if(theEvent.controller().name()=="2") {
      update = 0;
      firstRun = 0;
      patternID[2] = int(theEvent.controller().value());
      clearPTSArray();
    } 
    if(theEvent.controller().name()=="3") {
      update = 0;
      firstRun = 0;
      patternID[3] = int(theEvent.controller().value());
      clearPTSArray();
    } 
    if(theEvent.controller().name()=="4") {
      update = 0;
      firstRun = 0;
      patternID[4] = int(theEvent.controller().value());
      clearPTSArray();
    } 
    if(theEvent.controller().name()=="5") {
      update = 0;
      firstRun = 0;
      patternID[5] = int(theEvent.controller().value());
      clearPTSArray();
    } 
    if(theEvent.controller().name()=="6") {
      update = 0;
      firstRun = 0;
      patternID[7] = int(theEvent.controller().value());
      patternID[6] = int(theEvent.controller().value());
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Bloom") {
      update = 0;
      firstRun = 0;
      divisions = 24;
      
      controlP5.controller("Divs").setValue(24);
      
      middleRadii2 = .35*outerRadii; 
      middleRadii1 = .05*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(35);
      controlP5.controller("Middle_Radius_1").setValue(05);
      
      tightness = .2;
      controlP5.controller("Tightness").setValue(.2);
      
      patternID[0] = 1;
      patternID[1] = 1;
      patternID[2] = 1;
      patternID[3] = 1;
      patternID[4] = 0;
      patternID[5] = 0;
      patternID[6] = 0;
      patternID[7] = 0;
      
      controlP5.controller("1").setValue(1);
      controlP5.controller("2").setValue(1);
      controlP5.controller("3").setValue(1);
      controlP5.controller("4").setValue(0);
      controlP5.controller("5").setValue(0);
      controlP5.controller("6").setValue(0);
      
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Rose") {
      update = 0;
      firstRun = 0;
      divisions = 12;
      controlP5.controller("Divs").setValue(12);
      
      middleRadii2 = .9*outerRadii; 
      middleRadii1 = .7*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(90);
      controlP5.controller("Middle_Radius_1").setValue(70);
      
      tightness = .25;
      controlP5.controller("Tightness").setValue(.25);
      
      patternID[0] = 2;
      patternID[1] = 2;
      patternID[2] = 3;
      patternID[3] = 4;
      patternID[4] = 5;
      patternID[5] = 6;
      patternID[6] = 7;
      patternID[7] = 7;
      
      controlP5.controller("1").setValue(2);
      controlP5.controller("2").setValue(3);
      controlP5.controller("3").setValue(4);
      controlP5.controller("4").setValue(5);
      controlP5.controller("5").setValue(6);
      controlP5.controller("6").setValue(7);
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Ruffle") {
      update = 0;
      firstRun = 0;
       
      divisions = 24;
      controlP5.controller("Divs").setValue(24);
      
      middleRadii2 = .6*outerRadii; 
      middleRadii1 = .05*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(60);
      controlP5.controller("Middle_Radius_1").setValue(05);
      
      tightness = .25;
      controlP5.controller("Tightness").setValue(.25);
      
      patternID[0] = 5;
      patternID[1] = 5;
      patternID[2] = 4;
      patternID[3] = 3;
      patternID[4] = 2;
      patternID[5] = 1;
      patternID[6] = 0;
      patternID[7] = 0;
      
      controlP5.controller("1").setValue(5);
      controlP5.controller("2").setValue(4);
      controlP5.controller("3").setValue(3);
      controlP5.controller("4").setValue(2);
      controlP5.controller("5").setValue(1);
      controlP5.controller("6").setValue(0);
      
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Stella") {
      update = 0;
      firstRun = 0;
      
      divisions = 12;
      controlP5.controller("Divs").setValue(12);
      
      middleRadii2 = .5*outerRadii; 
      middleRadii1 = .05*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(50);
      controlP5.controller("Middle_Radius_1").setValue(05);
      
      tightness = 0;
      controlP5.controller("Tightness").setValue(0);
      
      patternID[0] = 2;
      patternID[1] = 2;
      patternID[2] = 2;
      patternID[3] = 0;
      patternID[4] = 2;
      patternID[5] = 0;
      patternID[6] = 2;
      patternID[7] = 2;
      
      controlP5.controller("1").setValue(0);
      controlP5.controller("2").setValue(2);
      controlP5.controller("3").setValue(0);
      controlP5.controller("4").setValue(2);
      controlP5.controller("5").setValue(0);
      controlP5.controller("6").setValue(2);
      
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Vault") {
      update = 0;
      firstRun = 0;
      
      divisions = 24;
      controlP5.controller("Divs").setValue(24);
      
      middleRadii2 = .5*outerRadii; 
      middleRadii1 = .5*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(50);
      controlP5.controller("Middle_Radius_1").setValue(50);
      
      tightness = 0.25;
      controlP5.controller("Tightness").setValue(.25);
      
      patternID[0] = 5;
      patternID[1] = 5;
      patternID[2] = 5;
      patternID[3] = 3;
      patternID[4] = 2;
      patternID[5] = 0;
      patternID[6] = 0;
      patternID[7] = 0;
      
      controlP5.controller("1").setValue(5);
      controlP5.controller("2").setValue(5);
      controlP5.controller("3").setValue(3);
      controlP5.controller("4").setValue(2);
      controlP5.controller("5").setValue(0);
      controlP5.controller("6").setValue(0);
      
      clearPTSArray();
    } 
     if(theEvent.controller().name()=="  Warpweft1") {
      update = 0;
      firstRun = 0;
      
      divisions = 24;
      controlP5.controller("Divs").setValue(24);
      
      middleRadii2 = .45*outerRadii; 
      middleRadii1 = .05*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(45);
      controlP5.controller("Middle_Radius_1").setValue(5);
      
      tightness = 0.25;
      controlP5.controller("Tightness").setValue(.25);
      
      patternID[0] = 0;
      patternID[1] = 0;
      patternID[2] = 2;
      patternID[3] = 0;
      patternID[4] = 2;
      patternID[5] = 0;
      patternID[6] = 2;
      patternID[7] = 2;
      
      controlP5.controller("1").setValue(0);
      controlP5.controller("2").setValue(2);
      controlP5.controller("3").setValue(0);
      controlP5.controller("4").setValue(2);
      controlP5.controller("5").setValue(0);
      controlP5.controller("6").setValue(2);
      
      clearPTSArray();
    } 
    
     if(theEvent.controller().name()=="  Warpweft2") {
      update = 0;
      firstRun = 0;
    
      middleRadii2 = .55*outerRadii; 
      middleRadii1 = .45*middleRadii2;

      controlP5.controller("Middle_Radius_2").setValue(55);
      controlP5.controller("Middle_Radius_1").setValue(45);
      
      tightness = 0.25;
      controlP5.controller("Tightness").setValue(.25);
      
      patternID[0] = 0;
      patternID[1] = 0;
      patternID[2] = 1;
      patternID[3] = 0;
      patternID[4] = 1;
      patternID[5] = 0;
      patternID[6] = 1;
      patternID[7] = 1;
      
      controlP5.controller("1").setValue(0);
      controlP5.controller("2").setValue(1);
      controlP5.controller("3").setValue(0);
      controlP5.controller("4").setValue(1);
      controlP5.controller("5").setValue(0);
      controlP5.controller("6").setValue(1);
      
      
      
      clearPTSArray();
    } 
    
    if(theEvent.controller().name()=="  Random Curve") {
      update = 0;
      firstRun = 0;
      
      tightness = random(0,.25);
      controlP5.controller("Tightness").setValue(tightness);
      
      middleRadii2 = random(.05,.95)*outerRadii; 
      middleRadii1 = random(.05,.95)*middleRadii2;
      

      controlP5.controller("Middle_Radius_2").setValue(random(45,95));
      controlP5.controller("Middle_Radius_1").setValue(random(30,75));
      
      middleRadii2 = (controlP5.controller("Middle_Radius_2").getValue()/100)*outerRadii; 
      middleRadii1 = (controlP5.controller("Middle_Radius_1").getValue()/100)*middleRadii2;
      
      patternID[0] = int(random(0,11));
      patternID[1] = int(random(0,11));
      patternID[2] = int(random(0,11));
      patternID[3] = int(random(0,11));
      patternID[4] = int(random(0,11));
      patternID[5] = int(random(0,11));
      patternID[6] = int(random(0,11));
      patternID[7] = int(random(0,11));
      
      controlP5.controller("1").setValue(patternID[1]);
      controlP5.controller("2").setValue(patternID[2]);
      controlP5.controller("3").setValue(patternID[3]);
      controlP5.controller("4").setValue(patternID[4]);
      controlP5.controller("5").setValue(patternID[5]);
      controlP5.controller("6").setValue(patternID[6]);
      
      
      
      clearPTSArray();
    }
    
  } 
}

//--------------------------------------------
void vertex(Vec3D v) {
  vertex(v.x,v.y,v.z);
}


void createControlPoints(){
  
  
  // Creating Inner Points List
  for (int i = 0; i < divisions; i++){
    
outX = (innerRadii*12)*cos(i*((2*PI)/divisions));
outY = (innerRadii*12)*sin(i*((2*PI)/divisions));
ellipse(outX,outY,3,3);
    innerPoints[i][0] = outX;                                                                      
    innerPoints[i][1] = outY;  
   
  }
  
  // Creating Middle Points List
    for (int i = 0; i < divisions; i++){
    
outX = (middleRadii1*12)*cos(i*((2*PI)/divisions));
outY = (middleRadii1*12)*sin(i*((2*PI)/divisions));
ellipse(outX,outY,3,3);
    middlePoints1[i][0] = outX;                                                                      
    middlePoints1[i][1] = outY;  
   
  }
  
     for (int i = 0; i < divisions; i++){
    
outX = (middleRadii2*12)*cos(i*((2*PI)/divisions));
outY = (middleRadii2*12)*sin(i*((2*PI)/divisions));
ellipse(outX,outY,3,3);
    middlePoints2[i][0] = outX;                                                                      
    middlePoints2[i][1] = outY;  
   
  }
  
  
  // Creating Outer Points List
    for (int i = 0; i < divisions; i++){
    
outX = (outerRadii*12)*cos(i*((2*PI)/divisions));
outY = (outerRadii*12)*sin(i*((2*PI)/divisions));
ellipse(outX,outY,3,3);
    outerPoints[i][0] = outX;                                                                      
    outerPoints[i][1] = outY;  
   
  }
  
  }
  
  //----------------------------------
  
  
  void createSplines(){
    
//for (int i = 0; i < patternID.length; i++){      
//int idNUM =  int(patternID[i]); 

curvePoints[0][0] = innerPoints[int(patternID[0])][0];
curvePoints[0][1] = innerPoints[int(patternID[0])][1];

curvePoints[1][0] = middlePoints1[int(patternID[1])][0];
curvePoints[1][1] = middlePoints1[int(patternID[1])][1];

curvePoints[2][0] = middlePoints2[int(patternID[2])][0];
curvePoints[2][1] = middlePoints2[int(patternID[2])][1];

curvePoints[3][0] = outerPoints[int(patternID[3])][0];
curvePoints[3][1] = outerPoints[int(patternID[3])][1];

curvePoints[4][0] = outerPoints[int(patternID[4])][0];
curvePoints[4][1] = outerPoints[int(patternID[4])][1];

curvePoints[5][0] = middlePoints2[int(patternID[5])][0];
curvePoints[5][1] = middlePoints2[int(patternID[5])][1];

curvePoints[6][0] = middlePoints1[int(patternID[6])][0];
curvePoints[6][1] = middlePoints1[int(patternID[6])][1];

curvePoints[7][0] = innerPoints[int(patternID[7])][0];
curvePoints[7][1] = innerPoints[int(patternID[7])][1];


//}
 
// creating the spline by adding all the points from the curve Points storage.
s=new Spline2D();


// using a bezier curve 
stroke(0);
beginShape();
noFill();
vertex(0,0,0);

for (int j = 0; j < patternID.length; j++){
  s.setTightness(tightness);
  s.add(new Vec2D(curvePoints[j][0],curvePoints[j][1]));

}
vertex(0,0,0);
endShape();


// Divinding the curve into more points and put into an array list    
beginShape();
for(Iterator i=s.computeVertices(resolution).iterator(); i.hasNext();) {


Vec2D p=(Vec2D)i.next();
float x = p.x;
float y = p.y;

if (firstRun == 0){
curvePTS.add(new PTS(x,y));

}
curveVertex(p.x,p.y);

}
endShape();

}        


void exportGeometry(){

for (int w = 0;w < divisions; w++){ 
  
pushMatrix();
rotate(w*((2*PI)/divisions));
 
strokeWeight(2);
stroke(2);
noFill();
beginShape();



for(Iterator Count=s.computeVertices(resolutionExport).iterator(); Count.hasNext();) {


Vec2D eV=(Vec2D)Count.next();
float exportX = eV.x;
float exportY = eV.y;

float toolDepth4 = (maxToolDepth-centerToolDepth*(dist(0,0,exportX,exportY)/(outerRadii*12)));

curveVertex(exportX, exportY, toolDepth4);


}

endShape();
popMatrix();

}

}



void createGeometry(){

for (int w = 0;w < divisions; w++){ 

  pushMatrix();
  rotate(w*((2*PI)/divisions));
  
for (int i = 0; i < curvePTS.size()-4; i++) {

float tempX1 = X1;
float tempY1 = Y1;
float tempX2 = X2;
float tempY2 = Y2;


for (int b = 0; b <= triangleResolution; b++) {
        PTS p = (PTS) curvePTS.get(i); 
        PTS p2 = (PTS) curvePTS.get(i+1);
        PTS p3 = (PTS) curvePTS.get(i+2);
        PTS p4 = (PTS) curvePTS.get(i+3);
        
  float t = triangleResolution / float(b);
  float x = curvePoint(p.xPos, p2.xPos, p3.xPos, p4.xPos, t);
  float y = curvePoint(p.yPos, p2.yPos, p3.yPos, p4.yPos, t);
  //ellipse(x, y, 5, 5);
  float tx = curveTangent(p.xPos, p2.xPos, p3.xPos, p4.xPos, t);
  float ty = curveTangent(p.yPos, p2.yPos, p3.yPos, p4.yPos, t);

  
  float a = atan2(ty, tx);
  a -= PI/2.0;
  
  maxToolDepth = centerToolDepth + minToolDepth;
  
  float toolDepth =  (maxToolDepth-centerToolDepth*(dist(0,0,x,y)/(outerRadii*12)));
  float toolDepth2 = (maxToolDepth-centerToolDepth*(dist(0,0,p2.xPos,p2.yPos)/(outerRadii*12)));
  float toolDepth3 = (maxToolDepth-centerToolDepth*(dist(0,0,p.xPos,p.yPos)/(outerRadii*12)));
  float toolDepth5 = (maxToolDepth-centerToolDepth*(dist(0,0,p3.xPos,p3.yPos)/(outerRadii*12)));
  float toolDepth6 = (maxToolDepth-centerToolDepth*(dist(0,0,p4.xPos,p4.yPos)/(outerRadii*12)));
  
//   float toolDepth =  9-dist(0,0,x,y)/15;
//  float toolDepth2 =  9-dist(0,0,p2.xPos,p2.yPos)/15;
//  float toolDepth3 =  9-dist(0,0,p.xPos,p.yPos)/15;
  
  float toolWidth = toolDepth;
  float toolWidth2 = -1*toolDepth;

X1 = cos(a)*toolWidth + x;
Y1 = sin(a)*toolWidth + y;
X2 = cos(a)*toolWidth2 + x;
Y2 = sin(a)*toolWidth2 + y;

  float Z = 0;

stroke(230);
strokeWeight(3);
noFill();
//  line(x, y, toolDepth, X1, Y1, 0);
//  line(x, y, toolDepth, X2, Y2, 0);



//  line(p2.xPos, p2.yPos, toolDepth2, X2, Y2, 0);
//  line(p2.xPos, p2.yPos, toolDepth2, X1, Y1, 0);
//  
//  line(X1 , Y1, 0, tempX1, tempY1,0);
//  line(X2 , Y2, 0, tempX2, tempY2,0);


line(p4.xPos, p4.yPos, toolDepth6, p3.xPos, p3.yPos,toolDepth5);

noStroke();
  
beginShape();
fill(200);
vertex(p2.xPos, p2.yPos, toolDepth2);
vertex(tempX1, tempY1,0);
vertex(X1, Y1, 0);
endShape();

beginShape();
fill(200);
vertex(p.xPos, p.yPos,toolDepth3);
vertex(p2.xPos, p2.yPos, toolDepth2);
vertex(tempX1, tempY1,0);
endShape();

beginShape();
fill(200);
vertex(p2.xPos, p2.yPos, toolDepth2);
vertex(tempX2, tempY2,0);
vertex(X2, Y2, 0);
endShape();

beginShape();
fill(200);
vertex(p.xPos, p.yPos,toolDepth3);
vertex(p2.xPos, p2.yPos, toolDepth2);
vertex(tempX2, tempY2,0);
endShape();
} 
}

  popMatrix();

}
}

void createClockHands(){


//vertex(p.xPos, p.yPos, HandDepth);
stroke(0);
fill(20);
strokeWeight(0);
float MinuteHandOuterX = (outerRadii*12)*cos(1*((2*PI)/12));
float MinuteHandOuterY = (outerRadii*12)*sin(1*((2*PI)/12));
float MinuteHandSlope = (MinuteHandOuterY/MinuteHandOuterX);
float MinuteHandBackSpan = (outerRadii*1/3)*12;
float HourHandBackSpan = (outerRadii*1/5)*12;
//line(0,0, 20, MinuteHandOuterX,MinuteHandOuterY, 20);

float HandOffset = (centerToolDepth+minToolDepth)+1;

pushMatrix();
rotate(1.5*(3.14));
translate(0,0,HandOffset+1);
translate(-1*MinuteHandBackSpan,0,0);
quad((outerRadii*12)+MinuteHandBackSpan,-1, (outerRadii*12)+MinuteHandBackSpan,1, 0,handWidth,0,-handWidth);
popMatrix();

pushMatrix();
rotate(1.5*(3.14));
translate(0,0,HandOffset);
translate(0,-1*HourHandBackSpan,0);
quad(-1,((outerRadii*12)+HourHandBackSpan)*.7,1, ((outerRadii*12)+HourHandBackSpan)*.7, handWidth,0,-handWidth,0);
popMatrix();

fill(200);
AxisAlignedCylinder cyl;
cyl=new ZAxisCylinder(new Vec3D(0,0,HandOffset-3),1.5,6);
gfx.cylinder(cyl,20,false);

fill(255,200,50);
Sphere nut;
nut=new Sphere(new Vec3D(0,0,HandOffset+1),1.25);
gfx.sphere(nut,10);

strokeWeight(2);
}


void mousePressed() {
  if(mouseY < nonActiveZone) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}



void clearPTSArray(){

curvePTS.clear();
float[][] innerPoints = new float[divisions][divisions];
float[][] middlePoints = new float[divisions][divisions];
float[][] outerPoints = new float[divisions][divisions];
}


// -----------------Constructor for the higher resolution point storage----------
class PTS
{
  float xPos; 
  float yPos; 

 
  PTS(float x, float y) {
    xPos = x;
    yPos = y;
  
}
}

// ----------------------------------------------------------------------------------

  


