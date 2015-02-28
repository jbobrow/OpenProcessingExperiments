
//NCKU 2013-14 processing practice of peasyCam
//HorusWang, jan ,2014


import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;



import peasy.*;
PeasyCam horuscam ;

void setup() {
  size(500, 500, P3D);
  smooth();
  horuscam = new PeasyCam(this, 500);
  //telling the horuscam is a new object of peasyCam
}

void draw() {
  background(255, 30, 170);
  noStroke();
  fill(50,30,170);
  for (float i=0;i<1800;i+=15) {
    pushMatrix(); 
    translate(i, 50*sin(i*(PI/180)), 0);
      sphere(22);
    popMatrix();
  }
}



