
import controlP5.*; // we're using the controlP5 library

int skin_color = color(246, 206, 157);
float stroke_weight = 8;

PImage head;
ControlP5 cp5;

// initial values for facial expression parameters
float eye_diameter = 20;
float eye_distance = 110;
float eyebrow_offset_y = 0;
float unhappiness = -1.0;
float evilness = 0.0;


void setup() {
  size(640, 640);
  
  // load images file.
  // this must be done in setup() or after.
  head = loadImage("head.png"); 
  
  // initialize the controlP5 library
  cp5 = new ControlP5(this);
  
  // create sliders
  // parameters: name, minValue, maxValue, defaultValue, x, y, width, height
  cp5.addSlider("eye_distance", 50, 250, eye_distance, 10, 10, 100, 14);
  cp5.addSlider("eye_diameter", 2, 100, eye_diameter, 10, 10+14+10, 100, 14);
  cp5.addSlider("eyebrow_offset_y", 30, -75, eye_diameter, 10, 2*(10+14)+10, 100, 14);
  cp5.addSlider("unhappiness", -1.0, 1.0, unhappiness, 10, 3*(10+14)+10, 100, 14);
  cp5.addSlider("evilness", 0.0, 1.0, evilness, 10, 4*(10+14)+10, 100, 14);
}

void draw() {
  image(head, 0, 0);
  
  draw_eyes();
  draw_nose();
  draw_mouth();
}

void draw_eyes() {
  noStroke();
  fill(0);
  
  pushMatrix();
    translate(315, 287); // move the origin to the center point between the eyes
    // whatever the value of eye_distance is, draw the
    // eye (eye_distance/2) pixels left of the origin.
    // the size of the eye is determined by eye_diameter.
    ellipse(-eye_distance/2, 0, eye_diameter, eye_diameter);
    ellipse(eye_distance/2, 0, eye_diameter, eye_diameter);
    
    // introducing 'evilness' to the eye brows is a bit more difficult,
    // because we use the evilness factor to control 4 different visual
    // characteristics:
    // - eye brow thickness:
    float brow_weight = map(evilness, 0, 1, 3.5, 20);
    // - eye brow straightness / curvature:
    float brow_arc_height = map(evilness, 0, 1, 15, 0);
    // - eye brow width:
    float brow_arc_width_factor = map(evilness, 0, 1, 1, 1.5);
    // - eye brow angle:
    float brow_angle = map(evilness, 0, 1, 0, radians(45));
    
    // the map() function (http://processing.org/reference/map_.html)
    // is very handy to map a value from one range of values (in this case [0.0 .. 1.0])
    // to another range.
    
    strokeWeight(brow_weight);
    stroke(0);
    noFill();
    float left_eyebrow_x_offset = -(eye_distance/2) -8;
    float left_eyebrow_y_offset = -45 + eyebrow_offset_y;
    pushMatrix();
      translate(left_eyebrow_x_offset, left_eyebrow_y_offset);
      rotate(brow_angle);
      scale(1, -1);
      arc(0, 0, brow_arc_width_factor*30, brow_arc_height, radians(20), radians(180-20), OPEN);
    popMatrix();
    
    float right_eyebrow_x_offset = (eye_distance/2) - 5;
    float right_eyebrow_y_offset = left_eyebrow_y_offset + 3;
    pushMatrix();
      translate(right_eyebrow_x_offset, right_eyebrow_y_offset);
      rotate(-brow_angle);
      scale(1, -1);
      arc(0, 0, brow_arc_width_factor*25, brow_arc_height, radians(30), radians(180-30), OPEN);
    popMatrix();
  popMatrix();
}

void draw_nose() {
  fill(skin_color);
  stroke(0);
  strokeWeight(stroke_weight);
  
  beginShape();
    vertex(332, 262);
    quadraticVertex(285, 260, 279, 300);
    quadraticVertex(280, 340, 338, 326);
    vertex(338, 326);
  endShape();
}

void draw_mouth() {
  noFill();
  stroke(0);
  strokeWeight(stroke_weight);
  
  // as long as the unhappiness value is below zero,
  // we need to horisontally flip the mouth.
  int mirror = 1; // mirror will either be 1 or -1
  if (unhappiness < 0) {
    mirror = -1;
  }
  
  pushMatrix();
    translate(315, 391);
    scale(1, mirror); // automatically flip or don't flip — depending on what value mirror has
    // an ellipse can't have a negative height.
    // multiplying the desired height with mirror will always
    // produce a positive number.
    // we use unhappiness as a factor to scale the height.
    arc(0, 0, 236, mirror*unhappiness*128, radians(170), radians(360+10), OPEN);
  popMatrix();
  
  fill(255);
  textSize(32);
  textAlign(CENTER);
  if (unhappiness <= -0.25) {
    text("“Awkward is my specialty.”", width/2, height-32);
  } else if (unhappiness <= 0.25) {
    text("“why can't I have a normal dog?”", width/2, height-32);
  } else {
    text("“good grief.”", width/2, height-32);
  }
}


