
import processing.opengl.*;
//float x;
//float y;
//float speed = 2;
//int diameter = 20;

float angle = 30;
float offset = 100; 
float scalar = 30; 
float speed = 0.03;

void setup(){
//  size(600,600);
  size(600,600,OPENGL);
  background(0);
}

void draw(){
  lights();
  ambientLight(200, 200, 200);
  directionalLight(255, 255, 255, -1, 0, 0);
  pointLight(255, 255, 255, mouseX, 110, 50);
  spotLight(255, 255, 255, mouseX, 0, 200, 0, 0, -1, PI, 2);

  background(0);
  translate(width/2, height/2);
  fill(#78cdd1);
  rotateX(radians(mouseX));
  rotateY(radians(mouseY));
  sphere(40);
  
//  x += random(-speed, speed); 
//  y += random(-speed, speed); 
//  ellipse(x, y, diameter, diameter);

  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse( x, y, 40, 40);
  angle += speed;
  
}

