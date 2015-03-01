
/*
by Adriano Parracciani
aka
CyberParra
*/



void setup() {
size(400,400);
noStroke();
frameRate(10);
}
int x=200;
int y=200;
int radius4=40;
int radius=70;
int radius2=100;
int radius3=130;
int tras=70;
float angle=1;

void draw() {
  background(0);
  
  //blob1
  float ty=radius*sin(radians(angle));
  float tx=radius*cos(radians(angle));
  strokeWeight(1);
  fill(150,tras);
  ellipse(200,200,x+tx,y+ty);
  
  //blob2 
  float ty2=radius2*sin(radians(angle/1.5));
  float tx2=radius2*cos(radians(angle/1.5));
  fill(#CD853F,tras);
  ellipse(200,200,x+tx2,y+ty2);
  
  
  //blob3  
  float ty3=radius3*sin(radians(angle/3));
  float tx3=radius3*cos(radians(angle/3));
  fill(#DA70D6,tras);
  ellipse(200,200,x+tx3,y+ty3);
  
  //blob4  
  float ty4=radius4*sin(radians(angle*1.5));
  float tx4=radius4*cos(radians(angle*1.5));
  fill(#FFD700,tras);
  ellipse(200,200,x+tx4,y+ty4);
  
  angle=angle+10;

}
