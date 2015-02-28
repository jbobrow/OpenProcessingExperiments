
import java.util.ArrayList;
ArrayList<Marker> markers = new ArrayList<Marker>();
Sight sight  = new Sight();
 
void setup() {
  size(500, 400);
  background(0);
  smooth();
  strokeCap(SQUARE);
  rectMode(CENTER);
  noCursor();
}
 
void draw() {
  background(0);
 
  sight.draw();
 
  for (int i = 0; i < markers.size();i++) {
    Marker marker = markers.get(i);
 
    if (mouseButton == RIGHT) {
      marker.locking();
      if (mousePressed == false) {
        markers.remove(i);
      }
    }
    else if (mouseButton == LEFT) {
      marker.init();
    }
 
    marker.display();
  }
}
 
void mousePressed() {
  if (mouseButton == LEFT) {
    markers.add(new Marker(mouseX, mouseY));
  }
}

class Sight{
  void draw() {
    pushMatrix();
    translate(mouseX, mouseY);
   
    //center circle
    stroke(0, 255, 0);
    strokeWeight(2);
    noFill();
    ellipse(0, 0, 30, 30);
   
    //outside cross
    fill(0, 255, 0);
    noStroke();
    rect(0, -30, 3, 10);
    rect(0, 30, 3, 10);
    rect(-40, 0, 15, 3);
    rect(40, 0, 15, 3);
   
    //inside cross
    rect(0, 0, 3, 10);
    rect(0, 0, 10, 3);
   
    popMatrix();
  }
}
 
class Marker {
  final int BIGARC_R_GOAL = 140;
  final int SMALLARC_R_GOAL = 120;
  final float THETA_INCREMENT = 0.25;
  final int SMALLARC_R_INCREMENT = 10;
  
  final color MULTI_LOCK_COLOR = color(255, 255, 0);
  final color LOCK_COLOR = color(255, 0, 0);
  
  float bigarc_r = 0;
  float smallarc_r = 0;

  float theta = 0;
 
  color c;
 
  boolean bigarc_flg = false;
  boolean smallarc_flg = false;
  boolean theta_flg = false;
 
  float x;
  float y;
 
  int life;
 
  Marker( float tmpX, float tmpY) {
    x = tmpX;
    y = tmpY;
 
    life = 400;
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
 
    //small arc
    noFill();
    stroke(c);
    strokeWeight(5);
    pushMatrix();
    translate(0, 0);
    rotate(theta);
    arc(0, 0, smallarc_r, smallarc_r, radians(-20), radians(20));
    arc(0, 0, smallarc_r, smallarc_r, radians(-20)+PI, radians(20)+PI);
    popMatrix();
 
    //big arc
    strokeWeight(10);
    arc(0, 0, bigarc_r, bigarc_r, radians(-40), radians(40));
    arc(0, 0, bigarc_r, bigarc_r, radians(-40)+PI, radians(40)+PI);
 
    //center circle
    strokeWeight(2);
    noFill();
    ellipse(0, 0, 30, 30);
 
    //outside cross
    fill(c);
    noStroke();
    rect(0, -30, 3, 10);
    rect(0, 30, 3, 10);
    rect(-40, 0, 15, 3);
    rect(40, 0, 15, 3);
 
    //inside cross
    rect(0, 0, 3, 10);
    rect(0, 0, 10, 3);
 
    popMatrix();
  }
 
 
  void locking() {
    bigarc_r += 10;
    if (bigarc_r > BIGARC_R_GOAL) {
      bigarc_r = BIGARC_R_GOAL;
      bigarc_flg = true;
    }
 
    smallarc_r += 10;
    if (smallarc_r > SMALLARC_R_GOAL) {
      smallarc_r = SMALLARC_R_GOAL;
      smallarc_flg = true;
    }
 
    theta+=THETA_INCREMENT;
    if (theta > TWO_PI) {
      theta = TWO_PI;
      theta_flg  = true;
    }
 
    if (bigarc_flg == true && smallarc_flg == true && theta_flg == true) {
      c = color(LOCK_COLOR);
    }
    else {
      c = color(MULTI_LOCK_COLOR);
    }
  }
 
  void init() {
    c = color(MULTI_LOCK_COLOR);
    bigarc_r = 0;
    smallarc_r = 0;
 
    theta = 0;
 
    bigarc_flg = false;
    smallarc_flg = false;
    theta_flg = false;
  }
}
