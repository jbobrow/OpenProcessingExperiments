
import processing.opengl.*;

float theta1, theta2;
float x, y, z;
float r = 200;


void setup() {
  size(512, 512, OPENGL);
  background(100);
  frameRate(60000);
}

void draw() {
  theta1 = TWO_PI * (frameCount/240.0);
  theta2 = 0.6 * theta1;
  x = r * cos(theta1) * cos(theta2);
  y = r * sin(theta1);
  z = r * cos(theta1) * sin(theta2);

// background(100);
  lights();
  
 
  translate(width/2, height/2);
   rotateX(-radians(30));
  // rotateY(radians(frameCount/2));
   
 
   
   noFill();
 //fill(200, 40);
  stroke(110);
  sphere(r);
  
     pushMatrix();
   translate(x,y,z);
   fill(200);
  
   noStroke();
  sphere(5);
  popMatrix();
 
  
}


