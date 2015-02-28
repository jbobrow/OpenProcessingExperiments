

// Konkuk University 


// Department of Dynamic Media 


// SOS iDesign 


// Name:LEE Daeun


// ID: 201420095

float a = 0.0; 


float b = 60; 


float c = 50; 


float speed = 0.05; 


float e = 0.06; 


float x; 


float y; 

void setup() {
  size(displayWidth,displayHeight);
  smooth();
  background(0);
}

void draw() {
  fill(0,0,0,100);
  rect(0,0,width,height);

  float c = 500 + 5*dist(mouseX, mouseY, pmouseX, pmouseY);
  float q = mouseX + sin(a) * c;
  float w = mouseY + cos(a) * c;
  x += (q - x) * e;
  y += (w - y) * e;
  fill(0,0,255,255);
  ellipse( x, y, 40, 40);
  a += .5;
}


void keyPressed() { 


  if (key==' ')background(255); 


} 


  


void title() {  


  fill(255);  


  textAlign(RIGHT);  


  text("LEE Daeun, interactive mouse, Dynamic Media, 2014", width-50, height-20); 


}  

