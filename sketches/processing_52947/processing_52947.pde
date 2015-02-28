
// Rotated Polygon Generator
// Wassim Jabi  wassim.jabi@gmail.com


import controlP5.*;
import processing.pdf.*;

boolean record;
ControlP5 controlP5;
Slider polygons_slider, angle_slider, sides_slider, min_radius_slider, max_radius_slider, rotation_slider, red_slider, green_slider, blue_slider;
Textlabel pdf_label;

int windowWidth = 950;
int windowHeight = 600;

int polygons;
float angle;
int sides;
int density;
float r_min;
float r_max;
float global_rotation;
int rotation_factor;

int red_c;
int green_c;
int blue_c;

void setup() {
  size(windowWidth, windowHeight);            // specify a reasonable size for the graphic
  background(0,0,0);  // white opaque background
  // frameRate(5);
  // fill(0,0,0,0);        // use transparent fills (no fill)
  smooth();            // use smooth lines
  // noLoop();
  
  global_rotation = 0.0;

  polygons = 40;
  angle = 3.50;
  sides = 3;
  density = 40;
  r_min = 100.0;
  r_max = 275.0;
  rotation_factor = 1;

  red_c = 100;
  green_c = 100;
  blue_c = 255;
  
  controlP5 = new ControlP5(this);
  
  polygons_slider = controlP5.addSlider("Polygons",0,500,polygons,10,10,200,20);
  polygons_slider.setId(1);
  polygons_slider.setNumberOfTickMarks(501);
  polygons_slider.snapToTickMarks(true);
  polygons_slider.showTickMarks(false);
  
  angle_slider = controlP5.addSlider("Angle",0,180,angle,10,40,200,20);
  angle_slider.setId(2);
  angle_slider.setNumberOfTickMarks(361);
  angle_slider.snapToTickMarks(true);
  angle_slider.showTickMarks(false);
  
  sides_slider = controlP5.addSlider("Sides",3,36,sides,10,70,200,20);
  sides_slider.setId(3);
  sides_slider.setNumberOfTickMarks(34);
  sides_slider.snapToTickMarks(true);
  sides_slider.showTickMarks(false);
  
  min_radius_slider = controlP5.addSlider("Min Radius",0,500,r_min,10,100,200,20);
  min_radius_slider.setId(4);
  min_radius_slider.setNumberOfTickMarks(21);
  min_radius_slider.snapToTickMarks(true);
  min_radius_slider.showTickMarks(false);
  
  max_radius_slider = controlP5.addSlider("Max Radius",0,500,r_max,10,130,200,20);
  max_radius_slider.setId(5);
  max_radius_slider.setNumberOfTickMarks(21);
  max_radius_slider.snapToTickMarks(true);
  max_radius_slider.showTickMarks(false);
  
  rotation_slider = controlP5.addSlider("Rotation",-10,10,rotation_factor,10,160,200,20);
  rotation_slider.setId(6);
  rotation_slider.setNumberOfTickMarks(21);
  rotation_slider.snapToTickMarks(true);
  rotation_slider.showTickMarks(false);
 
 
  red_slider = controlP5.addSlider("RED",0,255,red_c,10,250,200,20);
  red_slider.setId(7);
  red_slider.setNumberOfTickMarks(256);
  red_slider.snapToTickMarks(true);
  red_slider.showTickMarks(false);
  red_slider.setColorBackground(color(100,0,0));
  red_slider.setColorForeground(color(255,0,0));
  red_slider.setColorActive(color(255,0,0));
  
  green_slider = controlP5.addSlider("GREEN",0,255,green_c,10,280,200,20);
  green_slider.setId(8);
  green_slider.setNumberOfTickMarks(256);
  green_slider.snapToTickMarks(true);
  green_slider.showTickMarks(false);
  green_slider.setColorBackground(color(0,100,0));
  green_slider.setColorForeground(color(0,255,0));
  green_slider.setColorActive(color(0,255,0));
  
  blue_slider = controlP5.addSlider("BLUE",0,255,blue_c,10,310,200,20);
  blue_slider.setId(9);
  blue_slider.setNumberOfTickMarks(256);
  blue_slider.snapToTickMarks(true);
  blue_slider.showTickMarks(false);
  blue_slider.setColorBackground(color(0,0,100));
  blue_slider.setColorForeground(color(0,0,255));
  blue_slider.setColorActive(color(0,0,255));
  
  controlP5.addButton("  SNAPSHOT",0,10,height-200,70,30).setId(10);
  pdf_label = controlP5.addTextlabel("pdf","", 100, height-190);
  controlP5.addTextlabel("title","Rotated Polygons Generator", 10, height-40).setId(12);
  controlP5.addTextlabel("copyright","(c) Copyright 2012 - Wassim Jabi", 10, height-20).setId(13);
  
}


void draw () {
  if(record)
  {
    draw2PDF();
    record = false;
    return;
  }
  global_rotation = global_rotation + 2*PI*((float)rotation_factor/1000);

  if (global_rotation > 2*PI) {
    global_rotation = 0.0;
  }
    background(0);
 
    pushMatrix();
    translate(300 + (width-300)/2, height/2);
    rotate(global_rotation);
      pushMatrix();
        for(int i = 0; i<polygons; i++)
        {
          stroke(red_c*i/polygons,green_c*i/polygons,blue_c*i/polygons);
          rotate(PI*angle/180.0);
          drawPolygon (sides, (float) r_min + i*(r_max-r_min)/polygons);
        }
     popMatrix();
    popMatrix();
       fill(20,20,20,200);
       stroke(0);
    rect(0,0,300,height);
}

void draw2PDF () {
  beginRecord(PDF, "RotatedPolygons.pdf");
    background(255,255,255,255);
 
    pushMatrix();
    translate(width/2, height/2);
      pushMatrix();
        for(int i = 0; i<polygons; i++)
        {
          stroke(255-(255*i/polygons),255-(255*i/polygons),255-(255*i/polygons));
          rotate(PI*angle/180.0);
          drawPolygon (sides, (float) r_min + i*(r_max-r_min)/polygons);
        }
     popMatrix();
    popMatrix();
    endRecord();
    pdf_label.setValue("OUTPUT FILE: RotatedPolygons.pdf");
}


public void controlEvent(ControlEvent theEvent) {
  // println("got a control event from controller with id "+theEvent.controller().id());
  switch(theEvent.controller().id()) {
    case(1):
    polygons = int(theEvent.controller().value());
    draw();
    break;
    case(2):
    angle = (theEvent.controller().value());
    break;  
    case(3):
    sides = (int) (theEvent.controller().value());
    break;
    case(4):
    r_min = (theEvent.controller().value());
    if(r_max < r_min) {
      r_max = r_min;
      max_radius_slider.setValue(r_max);
    }
    break;
    case(5):
    r_max = (theEvent.controller().value());
    if(r_min > r_max) {
      r_min = r_max;
      min_radius_slider.setValue(r_min);
    }
    break;
    case(6):
    rotation_factor = (int) (theEvent.controller().value());
    break;
    case(7):
    red_c = (int) (theEvent.controller().value());
    break;
    case(8):
    green_c = (int) (theEvent.controller().value());
    break;
    case(9):
    blue_c = (int) (theEvent.controller().value());
    break;
    case(10):
    record = true;
    break;
  }
  // drawSunFlower();
}

void keyPressed() {
  if(record)
  {
   record = false;
  }
  else
  {
    record = true;
  }
}




void drawPolygon(int numVerts, float sideLength) {
  float vxorig = 0.0;
  float vyorig = 0.0;
float vxa = 0.0;
float vya = 0.0;
float vxb = 0.0;
float vyb = 0.0;
    vxorig = cos(0.0 * TWO_PI) * sideLength;
    vyorig = sin(0.0 * TWO_PI) * sideLength;
// println("Number of Vertices: " + numVerts);
  for(int i = 0; i < (numVerts-1); i++) {
    vxa = cos((float)i / numVerts * TWO_PI) * sideLength;
    vya = sin((float)i / numVerts * TWO_PI) * sideLength;
    vxb = cos((float)(i+1) / numVerts * TWO_PI) * sideLength;
    vyb = sin((float)(i+1) / numVerts * TWO_PI) * sideLength;
    // println("Line: (" + vxa+", "+vya+") , ("+vxb+", "+vyb+")");
    line(vxa, vya, vxb, vyb);
}
line(vxb,vyb,vxorig, vyorig);
}

