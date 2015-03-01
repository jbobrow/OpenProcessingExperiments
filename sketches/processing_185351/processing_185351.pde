
size(600,400);
background(255);

//Simple Background Pattern

noStroke();
fill(62,205,255,80);

for (int i=-50; i<=width; i+=50) {
  for (int j=-50; j<=height; j+=50) {
    rect(i,j,75,75);
  }
}

//Kirby Body Shadow
noFill();
stroke(0);
strokeWeight(12);

ellipse(width/2,height/2-15,211,211);

//--------------------------------
//Left Foot ["Foot1"] Outline
strokeWeight(12);
stroke(0);
noFill();

//Translation/Rotation Coordinates (x,y) and (r)
int xFoot1 = 245;
int yFoot1 = 275;
int rFoot1 = -27; //degrees

translate(xFoot1,yFoot1); //moves point of origin of the shape
rotate(radians(rFoot1)); //rotates shape

ellipse(0,0,150,75);

//Left Foot Color
noStroke();
for(int dx=150; dx>=0; dx-=1) { //diameter of x
  float dy = map(dx,150,0,75,0); //diameter of y
  
  float r = map(dx,150,0,177,233); //red value
  int g = 0; //green value
  float b = map(dx,150,0,46,64); //blue value
  
  fill(r,g,b);
  ellipse(0,0,dx,dy);
}

//Restoration [Foot1]
rotate(radians(-1*rFoot1)); //Resets rotation to 0 degrees
translate(-1*xFoot1,-1*yFoot1); //Resets origin point to (0,0)

//--------------------------------
//Right Foot ["Foot2"] Outline
strokeWeight(12);
stroke(0);
noFill();

//Translation/Rotation Coordinates (x,y) and (r)
int xFoot2 = width-xFoot1;
int yFoot2 = yFoot1;
int rFoot2 = -1*rFoot1; //degrees

translate(xFoot2,yFoot2); //moves point of origin of the shape
rotate(radians(rFoot2)); //rotates shape

ellipse(0,0,150,75);

//Right Foot Color
noStroke();
for(int dx=150; dx>=0; dx-=1) { //diameter of x
  float dy = map(dx,150,0,75,0); //diameter of y
  
  float r = map(dx,150,0,177,233); //red value
  int g = 0; //green value
  float b = map(dx,150,0,46,64); //blue value
  
  fill(r,g,b);
  ellipse(0,0,dx,dy);
}

//Restoration [Foot2]
rotate(radians(-1*rFoot2)); //Resets rotation to 0 degrees
translate(-1*xFoot2,-1*yFoot2); //Resets origin point to (0,0)
//--------------------------------

//Left Arm [Arm1]
strokeWeight(12);
stroke(0);
noFill();

//Translation/Rotation Coordinates (x,y) and (r)
int xArm1 = 210;
int yArm1 = 124;
int rArm1 = -19; //degrees

translate(xArm1,yArm1); //moves point of origin of the shape
rotate(radians(rArm1)); //rotates shape

ellipse(0,0,64,90);

//Left Arm Color
noStroke();
for (int dx=64; dx>=0; dx-=1) {
  float dy = map(dx,64,0,90,0);
  
  float r = map(dx,64,0,219,255);
  float g = map(dx,64,0,102,209);
  float b = map(dx,64,0,143,230);
  
  float x = map(dx,64,0,0,15); //ellipse's center coordinate shift on the x axis
  
  fill(r,g,b);
  ellipse(0+x,0,dx,dy);
}

//Restoration [Arm1]
rotate(radians(-1*rArm1));
translate(-1*xArm1,-1*yArm1);
//--------------------------------

//Right Arm [Arm2]
strokeWeight(12);
stroke(0);
noFill();

//Translation/Rotation Coordinates (x,y) and (r)
int xArm2 = 399;
int yArm2 = 210;
int rArm2 = -50; //degrees

translate(xArm2,yArm2); //moves point of origin of the shape
rotate(radians(rArm2)); //rotates shape

ellipse(0,0,64,90);

//Right Arm Color
noStroke();
for (int dx=64; dx>=0; dx-=1) {
  float dy = map(dx,64,0,90,0);
  
  float r = map(dx,64,0,219,255);
  float g = map(dx,64,0,102,209);
  float b = map(dx,64,0,143,230);
  
  float x = map(dx,64,0,0,15); //ellipse's center coordinate shift on the x axis
  
  fill(r,g,b);
  ellipse(0+x,0,dx,dy);
}

//Restoration [Arm2]
rotate(radians(-1*rArm2));
translate(-1*xArm2,-1*yArm2);
//--------------------------------

//Kirby Body Outline
noFill();
stroke(0);
strokeWeight(2);

ellipse(width/2,height/2-15,211,211);

//Kirby Body Color
noStroke();
for (int i=210; i>=0; i-=1) {
  
  float r = map(i,210,0,219,255); //changes red color value from 219 to 255
  float g = map(i,210,0,102,209); //changes green color value from 102 to 209
  float b = map(i,210,0,143,230); //changes blue color value from 143 to 230
  
  float yi = map(i,210,0,0,50); //ellipse's center coordinate shift on the y axis
 
  fill(r,g,b);
  ellipse(width/2,height/2-15-yi,i,i);
}

//--------------------------------
//Left Eye ["Eye1"] Base
strokeWeight(3);
stroke(0);
fill(0);

//Translation/Rotation Coordinates (x,y) and (r)
int xEye1 = 273;
int yEye1 = 155;
int rEye1 = 2; //degrees

translate(xEye1,yEye1); //moves point of origin of the shape
rotate(radians(rEye1)); //rotates shape

ellipse(0,0,25,62);

//Left Eye Color
noStroke();
for(int y=61; y>=10; y-=1){
  
  float r = map(y,61,10,46,0);
  float g = map(y,61,10,86,0);
  float b = map(y,61,10,227,0);
  
  fill(r,g,b);
  arc(0,0,25,y,radians(0),radians(180));
}

fill(255);
ellipse(0,-12,15,28); //Eye White

//Left Cheek
fill(255,80,150);
stroke(222,54,121);
strokeWeight(1);
ellipse(-36,34,32,20);

//Restoration [Eye1 + Left Cheek]
rotate(radians(-1*rEye1)); //Resets rotation to 0 degrees
translate(-1*xEye1,-1*yEye1); //Resets origin point to (0,0)

//--------------------------------
//Right Eye ["Eye2"] Base
strokeWeight(3);
stroke(0);
fill(0);

//Translation/Rotation Coordinates (x,y) and (r)
int xEye2 = width-xEye1;
int yEye2 = yEye1;
int rEye2 = -1*rEye1; //degrees

translate(xEye2,yEye2); //moves point of origin of the shape
rotate(radians(rEye2)); //rotates shape

ellipse(0,0,25,62);

//Right Eye Color
noStroke();
for(int y=61; y>=10; y-=1){
  
  float r = map(y,61,10,46,0);
  float g = map(y,61,10,86,0);
  float b = map(y,61,10,227,0);
  
  fill(r,g,b);
  arc(0,0,25,y,radians(0),radians(180));
}

fill(255);
ellipse(0,-12,15,28); //Eye White

//Right Cheek
fill(255,80,150);
stroke(222,54,121);
strokeWeight(1);
ellipse(36,34,32,20);

//Restoration [Eye2 + Right Cheek]
rotate(radians(-1*rEye2)); //Resets rotation to 0 degrees
translate(-1*xEye2,-1*yEye2); //Resets origin point to (0,0)
//--------------------------------

//Mouth
stroke(0);
strokeWeight(2);

fill(100,9,19);
arc(300,198,30,36,radians(0),radians(180));
arc(300,198,30,16,radians(180),radians(360));

//Tongue (2 Layers)
noStroke();

fill(183,15,19);
ellipse(300,205,24,18);

fill(244,27,40);
ellipse(300,208,18,15);


