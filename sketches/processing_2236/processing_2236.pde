
// PolarToCartesian
// Daniel Shiffman <http://www.shiffman.net>

// Convert a polar coordinate (r,theta) to cartesian (x,y)
// x = r * cos(theta)
// y = r * sin(theta)

float r;
import pARToolKit.*;
import net.sourceforge.jartoolkit.core.*;
import processing.video.*;
import sms.*;
float matiz=random(245); 

// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(1000,800);
  smooth();
 // background(95,57,84,50,20);
  // Initialize all values
  r = 40.0;
  theta = 0.0;
  theta_vel = 0.0;
  theta_acc = 0.0001;
}

void draw() {
  noStroke();
  fill(95,57,84,20);
  rect(0,0,width,height);
  //background(95,57,84,50);
  // Translate the origin point to the center of the screen
  translate(width/2,height/2);
 // framerate
  // Convert polar to cartesian
 float x = r * cos(theta);
  float y = r * sin(theta);
  float r = random (10);
  
  
  color c1=  #E0C45D;
  color c2=  #1AAAA2;
  color c3= #8DCE7F;
  
  if(theta < 35) {  //When "i" is less than "35"...
   stroke(c3);
    fill(c1,r);  //Set the color to white
  }else{
  stroke(#FFFA62); 
    fill(c2,r);  //Set the color to white
}
 
 
 
 
 
 
  
  
  
  
  
  
  smooth();
  //noStroke();
   ellipse(x*6,y*8,14*r,120+r);
  
  int[] vals = Unimotion.getSMSArray();
  println(vals[0] + " " + vals[1] + " " + vals[2]);
  //color bola= vals[2]-100;
  //noStroke();
  //fill(bola);
  //ellipse(vals[0],vals[1],vals[2]/5,vals[2]/5);
 
   line(vals[0],vals[1],x*6-r,y*8-r); 
   
  // Draw the rectangle at the cartesian coordinate
  //ellipseMode(CENTER);
  //stroke(0);
 // fill(c1,r);
  //line(0,0,x,y);
  //line(0,0,-x,-y);
  //ellipse(x,y,16*r,16);
//  ellipse(-x,-y,16,16);
 // line(x+50,y,0,height/2);
 // line(50,0,-x+8,-y);
  //ellipse(x+r,y+70,17,17);
  //ellipse(x+40,y+40,50,18);
  //ellipse(-x+40,-y+40,18,80);
  //ellipse(-x+20,-y+20,17,17);
  
  //ellipse(x*2-20,y*2-20,100,13+r); 
 
   
   // ellipse(x/2,y/2,2,2); 
  
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
  println(theta);
  
//if(theta>15){
// fill(c2);
 
 
 
 
 
 

 
 
 
 
 
  
}




