
import processing.opengl.*;

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
Bubble[] bubbles;
float zMove=-2000;

void setup() {
  //camera
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
  size(500,500,P3D);
  smooth();
  // Load text file as an array of Strings
  String[] data = loadStrings("vostok_delta.txt");
  //String[] data = loadStrings("vostok_deut.txt");
  // map the value to set the height of the bar 
  // The size of the array of Bubble objects is determined by the total number of lines in the text file.
  bubbles = new Bubble[data.length];
  for (int i = 0; i < bubbles.length; i ++ ) {
  // Each line is split into an array of floating point numbers.
  float[] values = float(split(data[i], " " )); 
  //The values in the array are passed into the Bubble class constructor.
  bubbles[i] = new Bubble(values[0]); 
        //println(data[i]);
        println("we have "+bubbles.length+ " bubbles");
  }
}

void draw() {
  //background(0);
  fill(255,20);
  //draw rectangle at beginning Z dimension
  pushMatrix();
  translate(0,0,-2000);
  noFill();
  strokeWeight(1);
  stroke(255);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  popMatrix();
  //position array of objects in 3D space, increment movement
  translate(0,0,zMove+=4);
  // Display and move all bubbles
  for (int i = 0; i < bubbles.length; i ++ ) {
    bubbles[i].display();
    bubbles[i].drift();
  }

}

