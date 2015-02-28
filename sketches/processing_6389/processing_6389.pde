
//December 6th 2009
//Owaun Scantlebury

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

 import processing.opengl.*;
 void setup(){
  size(400,400,P3D);
  
   smooth(); // really helps
  cam = new PeasyCam (this,width);
 }



void draw(){
   
translate(-50,150,-800);

  strokeWeight(2);
  background(255);
  noStroke();
  noFill();
  for (float z = 0;z<45/8;z+=0.1){
     rotateX(radians(z));
     fill(233,23,23,23);
     // fill(random(400),random(400),random(400),23); // multi colour
     ellipse(width/2,height/2,50+z*100,50+z*100);
   }
translate(50,-150,800);
 } //end of draw - EOD
 
// void keyPressed(){
//   
//  if (key =='s'){
//   save("flutter.png");
//  } 
// }

