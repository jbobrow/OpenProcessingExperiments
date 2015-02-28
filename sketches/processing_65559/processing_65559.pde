
/*
ACCD Summer 2012
ID02
8//Classes & Objects 
Charlene Chen
07/20/2012
*/


class Desk {
 float xpos, ypos;
 
 float deskWidth;
 float deskHeight;
 float drawerHeight;
 float drawerWidth;
 
 color c;
 color st;
 float sw;
 
 float speed;
 
 Desk(float x, float y, float dw, float dh, float drw, float drh, float sd) {
// Desk(float x, float y, float sd) {
   xpos = x;
   ypos = y;
   
   deskWidth = dw;
   deskHeight = dh;
   drawerWidth = drw;
   drawerHeight = drh;
  
   c =  color( random(255), random(255), 255);
   st = color(random(255), random(255), random(255));
   sw = random(3);
   
   speed = sd;
 } 
 
 void update() {
   
//  float sx = random(-speed,speed);
//  float sy = random(-speed,speed);
  
  float sx = random(speed);
  float sy = random(-3,3);
    
  xpos += sx;
  ypos += sy; 
  
  //c =  color( random(255), random(255), 255);
  
//  deskWidth = random(50, 300);
//  deskHeight = random(100, 300);
//  drawerHeight = random(10, 50);
//  drawerWidth = random(20, 50);
  
 }
 
 void display() {
   
  pushMatrix();
 
  translate(xpos, ypos);
  
  //left legs
  strokeWeight(1);
  fill(c,100);
  stroke(c);
  quad(0,0, 10,20, 10, deskHeight, 0, deskHeight-20);
 
  //right legs
  fill(c);
  quad(deskWidth-drawerWidth,0+drawerHeight, deskWidth+10-drawerWidth,20, deskWidth+10-drawerWidth,deskHeight, deskWidth-drawerWidth, deskHeight-20);
 
  //top
  fill(c);
  strokeWeight(sw);
  quad(0,0, deskWidth,0, deskWidth+10,20, 10,20);
 
  //big drawer
  fill(255);
  quad(10,20, deskWidth+10,20, deskWidth+10, 20+drawerHeight, 10, 20+drawerHeight);
  line(10+deskWidth/4,20+drawerHeight/2, 10+deskWidth-deskWidth/4, 20+drawerHeight/2);
 
  //lower drawer
  strokeWeight(1);
  quad(deskWidth+10-drawerWidth,20+drawerHeight, deskWidth+10,20+drawerHeight, deskWidth+10,deskHeight, deskWidth+10-drawerWidth, deskHeight);
  line(deskWidth+10-drawerWidth,20+drawerHeight+drawerHeight*0.5, deskWidth+10,20+drawerHeight+drawerHeight*0.5);
 
  popMatrix();
 
 }
 
 void wrap() {
  if (xpos <= 0) {
    xpos = width; 
  } else if (xpos >= width) {
    xpos = 0; 
    c =  color( random(255), random(255), 255);
  } else if (ypos <= 0) {
    ypos = 0; 
  } else if (ypos >= height-deskHeight) {
    ypos = height-deskHeight; 
  }
 }
 
}

