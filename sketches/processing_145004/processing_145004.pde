
// Konkuk University  
// Department of Dynamic Media  
// SOS iDesign  
// Name: KIM Young ji  
// ID: 201420069  

float x,y;  

void setup(){  
  size(600,600);  
  smooth();  
  strokeWeight(2);  
  x = width/2;  
  y = height/2;    
}  

void draw(){  
  background(0,87,102);  
  drawClock();  
  time(300, 300);
}  
void drawClock(){  
  fill(255);  
  float s_angle = map(second(),0,59,0,TWO_PI);  
  pushMatrix();  
  translate(x,y);  
  rotate(s_angle);  
  fill(134,0,0);
  noStroke();
  ellipse(150,150,230,230);
  popMatrix(); 
  
  float m_angle = map(minute(),0,59,0,TWO_PI);  
  pushMatrix();  
  translate(x,y);  
  rotate(m_angle);  
  fill(241,95,95);
  ellipse(150,150,180,180);
  popMatrix();  

  float h_angle = map(hour(),0,12,0,TWO_PI);  
  pushMatrix();  
  translate(x,y);  
  rotate(h_angle);  
  fill(242,150,97);
  ellipse(150,150,140,140);
  popMatrix();  
}  

void time(float A, float B) 
{ 
  fill(255);
  textSize(20);
  text(second(), A+60, B+10);
  fill(255); 
  text(minute(), A-10, B+10); 
  fill(255);
  text(hour(), A-80, B+10); 
 } 

