
import processing.pdf.*;


float x,y;
float angle =0;
float r = 200;
float diff =1; 

color c = color(100,50,200);

void setup() {
  size(600, 600);
  background(30,80,100);
}

void draw() {
 
  x = r * cos(angle)*2; 
  y = r * sin(angle)*2; 
 
 translate(width/2, height/2);
 rotate(r);

 noStroke(); 
 fill(50, 0, 135, 20);
 ellipse(x,0,x,0);

 noStroke(); 
rect(50, y, 50, y);
ellipse(width/2 +x, height/2, 5, 5);  

  noStroke(); 
fill(145,230,30,30);
 rect(x, y,50, 50);  


angle += 0.05;
  r = map(sin(angle/10), -1, 1, 10, 200);
  println(sin(angle));
}

void keyPressed(){if(key=='q'){endRecord();exit();}}
