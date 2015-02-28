
/* 
 Konkuk University 
 SOS iDesign 
 Name: KIM Sun hyun
 ID: sion101627
 */

float x, y; 
void setup() { 
  size(600, 600); 
  smooth(); 
  textSize(30);
  x=width/2; 
  y=height/2;
} 

void draw() { 
  background(#05A6FA); 
  drawclock();
} 

void drawclock() { 
  strokeWeight(8);

  stroke(0);
  fill(30);  
  ellipse(300, 300, 500, 500); 

  strokeWeight(3);
  fill(150);
  ellipse(300, 300, 470, 470); 

  fill(255);
  strokeWeight(1);
  ellipse(300, 300, 455, 455); 

  fill(#3C4279);
  strokeWeight(3);
  ellipse(300, 300, 30, 30);

  fill(255);
  ellipse(300, 300, 15, 15); 

  drawNumbers(); 
  float s_angle=map(second(), 0, 60, 0, TWO_PI); 
  pushMatrix(); 

  translate(x, y); 
  rotate(s_angle); 
  stroke(7); 

  strokeWeight(1);
  line(0, 0, 0, -205); 
  popMatrix();

  float M_angle=map(minute(), 0, 60, 0, TWO_PI); 
  pushMatrix(); 
  translate(x, y); 

  rotate(M_angle); 
  strokeWeight(3);
  stroke(0);
  line(0, 0, 0, -195); 

  popMatrix(); 
  float h_angle=map(hour(), 0, 60, 0, TWO_PI); 
  pushMatrix(); 
  translate(x, y); 
  rotate(h_angle); 
  strokeWeight(4);
  stroke(#1FCE95);
  line(0, 0, -50, 160); 

  popMatrix();
} 
void drawNumbers() { 
  float r=201; 
  float inc=TWO_PI/12; 
  for (int i=1; i<=12; i++) { 
    float xn= x+cos(i*inc-HALF_PI)*r; 
    float yn= y+sin(i*inc-HALF_PI)*r; 
    fill(0); 
    text(i, xn-13, yn+12);
  }
} 

