
/*
  
 */
import processing.video.*;
import java.util.Calendar;


float x, y, z;

float t1=0;
float t2=0;

int p, q, r;

Sphere sph;

void setup() {
  size(800, 800, OPENGL);
  //size(1920, 1080, P3D);
  background(0);
  stroke(255);
  strokeWeight(3);
  smooth();

  sph=new Sphere(250, PI/6);
}

void draw() {

  background(0);
  fill(0,16);
  //noStroke();
  //rect(0,0,width, height);

  //camera();
  pushMatrix();
  translate(width/2, height/2);
  rotateX(map(mouseY, 0, height, 0, PI));
  //rotateX(t1);
  rotateX(HALF_PI);
  //t1+=0.001;
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateZ(t2);
  t2+=0.001;
  
  sph.display();
  
  popMatrix();
  
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}











/*
Wolfram Alpha

x(u, v) = a cos(u) sin(v)
y(u, v) = a sin(u) sin(v)
z(u, v) = a cos(v)

for 0<=u<=TWO_PI, 0<=v<=PI), a= radius

*/

class Sphere {
  int r;
  float x,y,z;
  float d;
  float v1=0.0;
  float easing=0.05;
  float step=0.075;
    
  Sphere (int _radius, float _density) {
    r = _radius;
    d = _density;
  }
  
  void display() {
    int count=0;
    //fill(0,0,255);
    noStroke();
    lights();
    fill(255);
    sphere(r*0.5);
    for (float u=0; u<TWO_PI; u+=d) {    
      for (float v=0; v<PI; v+=d) {
        
        x=r * cos(u) * sin(v);
        y=r * sin(u) * sin(v);
        z=r * cos(v);
        
        //stroke(255*cos(v), 207*cos(u),105*sin(u));
        
        //strokeWeight(2);
        strokeWeight(1.5);
        
        stroke(255);
        
        //point(x,y,z);
        pushMatrix();
        translate(x*1.1,y*1.1,z*1.1);
        //box(20* (0.86 + (v-PI)/PI));
        stroke(0);
        fill(255);
        
        float re=22;
        re = re * sin(v);
/*        if (v<HALF_PI) {
          re = 24 * (1.01 + (v-PI)/PI); //GOOD for PI to 0 - increment goes from x0 to x1
        } else {
          re = 24 * (PI-v)/PI; // GOOD for 0 to PI - increment goes from x1 to x0     
        }
  */      
        //ellipse(0,0,re,re);
        box(re);
        popMatrix();
        
        //stroke(255,0,0);
        //strokeWeight(12);
        //point(r*cos(u)*sin(0.02),r*sin(u)*sin(0.02),r*cos(0.02));
      }
      
      // draw sweeping rings/dots
      /*if (count%16==0) {
        //v1=map(mouseX, 0, width, 0, PI);
        
        x=r * cos(u) * sin(v1);
        y=r * sin(u) * sin(v1);
        z=r * cos(v1);
        strokeWeight(16);
        stroke(255,5,5);
        point(x,y,z);
      }*/
      count +=1;
      
    }
    
    //v1+=map(mouseX,0,width,0.0001,0.25);
    if (v1>(PI-0.01) || v1<(0.01)) { 
      step = step*-1; 
    }

    if (step > 0) { // going up from 0 to PI
      if (v1<HALF_PI) {
        v1 += step * (1.01 + (v1-PI)/PI); //GOOD for PI to 0 - increment goes from x0 to x1
      } else {
        v1 += step * (PI-v1)/PI; // GOOD for 0 to PI - increment goes from x1 to x0     
      }
    }
    
    if (step < 0) { // going down from PI to 0
      if (v1<HALF_PI) {
        v1 += step * (1 + (v1-PI)/PI); //GOOD for PI to 0 - increment goes from x0 to x1
      } else {
        v1 += step * (PI-v1)/PI; // GOOD for 0 to PI - increment goes from x1 to x0
      }
      
      
    }  //for 
  } // display()
} // class Sphere


