
//import processing.dxf.*;

float xoff = 0.0;
float x,y, xspeed, yspeed, angA;
//boolean recording;
//PGraphicsPDF pdf;
boolean record;

void setup() {
  size(1000,500);
  background(255);
 // pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "triangles.pdf");
 // camera(width/2, height/2, 800, width/2, height/2, 0, 0,1,0);
 
}

void draw() {
  
  
  noiseDetail(3,0.9);
 // z += .05;
  x += 10;
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  pushMatrix();
  stroke(0);
  translate(x-(n/5),y+(n/4));
  rotate(radians(n/1.5)+(y-x/10)/10);
  //rotate(radians(n*1.4)+(x-y/10));
  rectMode(CENTER);
  fill(255);
  stroke(0);
  rect(0,0, mouseX/4 , mouseY/2);
  //triangle(0,0,50, 0, mouseY/4,mouseX/2);
  fill(0);
  stroke(255);
  rect(0,0, mouseY/2 , mouseX/3);
  //triangle(mouseX/2,mouseY/4,50, 0, 0,50);
  fill(255);
  stroke(0);
  rect(0,15,mouseY/2,mouseX/4);
  //triangle(0,0,mouseX/3, mouseY/2, 0,50);
  //box(60,30,3);
  popMatrix();
  //line(n, 0, n, height);
  
  if (x >= width+200) {
      x = 0;
      y+= 15;
  }  
  
  if (y>= 300) {
      y = 0;
  }


}

void mousePressed() {
setup();
x=-50;
y = 0;
}
