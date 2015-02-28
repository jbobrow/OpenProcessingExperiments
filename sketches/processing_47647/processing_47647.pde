
import controlP5.*;
import processing.dxf.*;

boolean record;
ControlP5 controlP5;
Slider circles_slider, slope_slider, expansion_slider, min_radius_slider, max_radius_slider, rotation_slider, type_slider, shape_slider, red_slider, green_slider, blue_slider;

 
int maxCircles;
float slope;
float expansion;
float r_min;
float r_max;

float global_rotation;
float rotation_factor;

float spiral_type;

int shape_type;

float previous_cx, previous_cy;

int count;

// PrintWriter output;

// controlP5.Slider circles_slider, slope_slider, expansion_slider, min_r_slider, max_r_slider;
// controlP5.Textlabel copyright_label;

/* SETUP WORLD */
void setup() {	
  
  global_rotation = 0.1;

  maxCircles = 1000;
  slope = -1.0;
  expansion = 9;
  r_min = 0.0;
  r_max = 5.0;
  rotation_factor = 0.0;
  spiral_type = 1.0;
  shape_type = 0;
  
  previous_cx = 130 + width/2;
  previous_cy = height/2;
  
  count = 0;

  
 
  	
  size(950,600);
  background(0);
  stroke(0);
  fill(0,0,0, 255);
  frameRate(5);
  controlP5 = new ControlP5(this);
  circles_slider = controlP5.addSlider("Elements",0,2000,1000,10,10,200,20);
  circles_slider.setId(1);
  circles_slider.setNumberOfTickMarks(41);
  circles_slider.snapToTickMarks(true);
  circles_slider.showTickMarks(false);
  
  
  slope_slider = controlP5.addSlider("Slope",-1,1,-1,10,40,200,20);
  slope_slider.setId(2);
  slope_slider.setNumberOfTickMarks(21);
  slope_slider.snapToTickMarks(true);
  slope_slider.showTickMarks(false);
  
  
  expansion_slider = controlP5.addSlider("Expansion",0,100,9,10,70,200,20);
  expansion_slider.setId(3);
  expansion_slider.setNumberOfTickMarks(101);
  expansion_slider.snapToTickMarks(true);
  expansion_slider.showTickMarks(false);
  
  
  min_radius_slider = controlP5.addSlider("Min Radius",0,20,0,10,100,200,20);
  min_radius_slider.setId(4);
  min_radius_slider.setNumberOfTickMarks(21);
  min_radius_slider.snapToTickMarks(true);
  min_radius_slider.showTickMarks(false);
  
  max_radius_slider = controlP5.addSlider("Max Radius",0,100,5,10,130,200,20);
  max_radius_slider.setId(5);
  max_radius_slider.setNumberOfTickMarks(21);
  max_radius_slider.snapToTickMarks(true);
  max_radius_slider.showTickMarks(false);
  
  rotation_slider = controlP5.addSlider("Rotation",-1,1,0.1,10,160,200,20);
  rotation_slider.setId(6);
  rotation_slider.setNumberOfTickMarks(21);
  rotation_slider.snapToTickMarks(true);
  rotation_slider.showTickMarks(false);
  
  type_slider = controlP5.addSlider("Type",0,360,0,10,190,200,20);
  type_slider.setId(7);
  type_slider.setNumberOfTickMarks(721);
  type_slider.snapToTickMarks(true);
  type_slider.showTickMarks(false);
  
  shape_slider = controlP5.addSlider("Shape",0,4,0,10,220,200,20);
  shape_slider.setId(8);
  shape_slider.setNumberOfTickMarks(5);
  shape_slider.snapToTickMarks(true);
  shape_slider.showTickMarks(false);
  
  
  red_slider = controlP5.addSlider("RED",0,255,255,10,250,200,20);
  red_slider.setId(9);
  red_slider.setNumberOfTickMarks(256);
  red_slider.snapToTickMarks(true);
  red_slider.showTickMarks(false);
  red_slider.setColorBackground(color(100,0,0));
  red_slider.setColorForeground(color(255,0,0));
  red_slider.setColorActive(color(255,0,0));
  
  green_slider = controlP5.addSlider("GREEN",0,255,255,10,280,200,20);
  green_slider.setId(10);
  green_slider.setNumberOfTickMarks(256);
  green_slider.snapToTickMarks(true);
  green_slider.showTickMarks(false);
  green_slider.setColorBackground(color(0,100,0));
  green_slider.setColorForeground(color(0,255,0));
  green_slider.setColorActive(color(0,255,0));
  
  blue_slider = controlP5.addSlider("BLUE",0,255,255,10,310,200,20);
  blue_slider.setId(11);
  blue_slider.setNumberOfTickMarks(256);
  blue_slider.snapToTickMarks(true);
  blue_slider.showTickMarks(false);
  blue_slider.setColorBackground(color(0,0,100));
  blue_slider.setColorForeground(color(0,0,255));
  blue_slider.setColorActive(color(0,0,255));
  
  // controlP5.addButton("OUTPUT DATA",10,10,160,70,20).setId(6);
  controlP5.addTextlabel("title","Fibonacci Phyllotaxis Pattern Generator", 10, height-40).setId(9);
  controlP5.addTextlabel("copyright","(c) Copyright 2011 - Wassim Jabi", 10, height-20).setId(10);
  
  // Create output file
  // output = createWriter("positions.txt");
  record = false;
}

void draw() {
  // background(0);
  // fill(0,0,0,0);

  // do all your drawing here
  // drawSunFlower();
  // controlP5.draw();
  frameRate(24);
  global_rotation = global_rotation + (2*PI/180)*rotation_factor;
  if (global_rotation > 2*PI) {
    global_rotation = 0.0;
  }
  drawSunFlower();
}


public void controlEvent(ControlEvent theEvent) {
  // println("got a control event from controller with id "+theEvent.controller().id());
  switch(theEvent.controller().id()) {
    case(1):
    maxCircles = int(theEvent.controller().value());
    break;
    case(2):
    slope = (theEvent.controller().value());
    break;  
    case(3):
    expansion = (theEvent.controller().value());
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
    rotation_factor = (theEvent.controller().value());
    break;
    case(7):
    spiral_type = (theEvent.controller().value());
    break;
    case(8):
    shape_type = (int) (theEvent.controller().value());
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

void drawCircle(float distance, float angle, float radius, float rmax, int i) {
  float cx, cy;
  
  stroke(red_slider.value()*radius/rmax, green_slider.value()*radius/rmax, (255 - blue_slider.value()*radius/rmax));
  fill(red_slider.value()*radius/rmax, green_slider.value()*radius/rmax, (255 - blue_slider.value()*radius/rmax));
  
  cx = 130 + width/2 + distance*cos(angle);
  cy = height/2 + distance*sin(angle);

  // println(radius);
  // println(rmax);


  switch(shape_type) {
    case 0:
      pushMatrix();
  translate(cx, cy);
  rotate(angle);
    ellipse(0, 0, radius*2, radius*2);
      popMatrix();
    break;
    case 1:
          pushMatrix();
  translate(cx, cy);
  rotate(angle);
    quad(0, -radius, -radius, 0, 0, radius, radius, 0);
      popMatrix();
    break;
    case 2:
          pushMatrix();
  translate(cx, cy);
  rotate(angle);
    rect(-radius,-radius, radius*2,radius*2);
          popMatrix();
    break;
    case 3:
          pushMatrix();
  translate(cx, cy);
  rotate(angle);
    quad(0, -(radius*2), -radius, 0, 0, radius*2, radius, 0);
          popMatrix();
    break;
    case 4:
    if(i>1)
    {
          line(previous_cx, previous_cy, cx,cy);
    }
    previous_cx = cx;
    previous_cy = cy;
    break;
  }

}

void outputCircle(float distance, float angle, float radius, float rmax) {
  float cx, cy;
  cx = distance*cos(angle);
  cy = distance*sin(angle);
  // output.println("Circle radius:"+radius+" pos:["+cx+","+cy+",0.00]");
}

void drawSunFlower()  {
  int i;
  // float radius;
  float phi, distance, increment;
  float d_min, d_max;
  float result_radius;
  // float packing;  // how closely packed should they be? 0 to 10 where 0 is very packed and 10 is very loosely packed.
  // int maxCircles; //maximum number of circles.
  float c;
  // float slope;
  float r_avg;
  float d_avg;

  c = 100;
  r_avg = (r_min + r_max)/2.0;
  d_min = 1.0;
  d_max = sqrt(maxCircles)*expansion;
  d_avg = (d_min + d_max)/2.0;
  phi = (1+sqrt(5.0))/2.0;
  
  if(spiral_type <= 1)
  {
    increment = 2*PI*phi;
  }
  else
  {
    increment = 2*PI*phi + (2*PI/spiral_type);
  }

  fill(0,0,0,255);
  rect(0,0,width,height);
  for(i=1;i<maxCircles;i++) {
     distance = sqrt(i)*expansion;
     result_radius = r_avg + slope*(distance-d_avg)/(d_max-d_avg)*(r_max-r_avg);
     drawCircle(distance, (increment*i + global_rotation), result_radius, r_max, i);
     if(record) {
       // outputCircle(distance, increment*i, result_radius, r_max);
     }
   }
   /*
   if(record) {
     output.flush(); // Writes the remaining data to the file
     output.close(); // Finishes the file
     record = false;
   }*/
}

