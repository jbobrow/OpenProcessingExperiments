
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;

PeasyCam cam;
float arr1[] = new float[0];
int t = 360;

void setup(){
  smooth();
  size(800,400,OPENGL); 
  cam = new PeasyCam(this,700);
  cam.lookAt(t/2,t/2,t/2);
  colorMode(HSB, 360);


}

void tekenVierkant(){
   noFill();
  stroke(0,0,0);
  strokeWeight(5);
  line(0,0,0,0,0,t);  
  line(0,0,0,0,t,0);
  line(0,0,0,t,0,0);
  
  line(0,0,t,0,t,t);
  line(t,0,0,t,t,0);
  line(0,t,0,t,t,0);
  
  line(0,t,0,0,t,t);
  line(0,0,t,t,0,t);
  line(t,t,t,0,t,t);  
  
  line(t,t,t,t,0,t);
  line(t,t,t,t,t,0);
  line(t,0,t,t,0,0);
  
}

void draw(){
 //cam.rotateY(.01);
  background(255);
  float a = random(t);
  float b = random(t);
  float c = random(t);
  arr1 = append(arr1,a);
  arr1 = append(arr1,b);
  arr1 = append(arr1,c);
  tekenVierkant();
 
    
  for(int i=0;i<arr1.length;i+=3){

    float x = arr1[i];
    float y = arr1[i+1];
    float z = arr1[i+2];
    
    stroke(x,y,z);
    
    bezier(
    x,y,z,
    z,y,x,
    y,z,x,
    x,z,y
    );
  }
}










