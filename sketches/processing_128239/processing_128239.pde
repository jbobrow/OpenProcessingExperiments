
//NCKU 2013-14 processing practice of PeasyCam 2.0 - Donuts from
//HorusWang ,jan ,2014



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
  //telling the gcam is a new object of peasyCam
}

void draw() {
  background(255, 30, 170);
  stroke(255);
  fill(50,30,170);
  
  for (float i=0;i<360;i+=16) {
    pushMatrix(); 
    translate(100*cos(i*(PI/180)), 100*sin(i*(PI/180)),0);// distance of each others
      sphere(10);
    popMatrix();
  }
}


