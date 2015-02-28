
/*
ACCD Summer 2012
ID02
6//Parameterized Form 
Charlene Chen
06/29/2012
*/


void setup() {
  size(1050, 450);
  smooth(); 
  noLoop();
}

void draw() {
  background(230);
  
  for (int i = 40; i < width-10; i = i + 200) {
    for (int j = 40; j< height-10; j = j + 200) {
   
  float sw = random(3);
  float rs = random(0.6, 1.1);
  color c = color( random(255), random(255), 255);
  color st = color(random(255), random(255), random(255));
  
  float deskWidth = random(50, 200);
  float deskHeight = random(100, 200);
  float drawerHeight = random(10, 50);
  float drawerWidth = random(20, 50);
  
  desk(i, j, deskWidth, deskHeight, c, drawerHeight, sw, drawerWidth); 
    }
 }
}


void desk(float x, float y, float deskWidth, float deskHeight, color c, float drawerHeight, float sw, float drawerWidth) {
 //strokeWeight(sw);
 
 pushMatrix();
 
 translate(x, y);
 //rotate(angle);
 //scale(scaler);

 strokeWeight(1);
 
 fill(c, 50);
 stroke(c);
 //left legs
 quad(0,0, 10,20, 10, deskHeight, 0, deskHeight-20);
 
 fill(c, 100);
 //right legs
 //quad(deskWidth,0, deskWidth+10,20, deskWidth+10,deskHeight, deskWidth, deskHeight-20);
 //noFill();
 //right legs
 quad(deskWidth-drawerWidth,0+drawerHeight, deskWidth+10-drawerWidth,20, deskWidth+10-drawerWidth,deskHeight, deskWidth-drawerWidth, deskHeight-20);
 
 fill(c);
 strokeWeight(sw);
 //top
 quad(0,0, deskWidth,0, deskWidth+10,20, 10,20);
 
 fill(255);
 //big drawer
 quad(10,20, deskWidth+10,20, deskWidth+10, 20+drawerHeight, 10, 20+drawerHeight);
 
 line(10+deskWidth/4,20+drawerHeight/2, 10+deskWidth-deskWidth/4, 20+drawerHeight/2);
 
 strokeWeight(1);
 //lower drawer
 quad(deskWidth+10-drawerWidth,20+drawerHeight, deskWidth+10,20+drawerHeight, deskWidth+10,deskHeight, deskWidth+10-drawerWidth, deskHeight);
 
 line(deskWidth+10-drawerWidth,20+drawerHeight+drawerHeight*0.5, deskWidth+10,20+drawerHeight+drawerHeight*0.5);
 popMatrix();
  
}


void mousePressed() {
 redraw(); 
}

