
// Copyright Christopher Henley 2014
// 257/757  Spring 2014
// Homework #6
/* By pressing an uppercase X the x axis rotation is increased. 
   By pressing a lowercase X the x axis rotation is decreased.
   By pressing an uppercase Y the y axis rotation is increased. 
   By pressing a lowercase Y the y axis rotation is decreased.
   By pressing an uppercase Z the z axis rotation is increased. 
   By pressing a lowercase Z the z axis rotation is decreased.
   If the left mouse button is pressed and the mouse is moved
   the initial moves in the same direction. 
   If the right mouse button is pressed and the mouse is moved
   up the initial zooms in, and if the mouse is moved down the 
   initial zooms out.
   By pressing the a button the axis toggle on and off, and by
   pressing the f button the fill of the intial is toggled on 
   and off.
*/

// global variables
color fontCol=color(255,255,255);
boolean axisToggle=true;
boolean fillStyle=true;

float transX; // X axis translation amounts
float transY; // Y axis translation amounts
float transZ; // Z axis translation amounts
float transFact; // sets global translation factor

float rotX; // X axis rotation amounts
float rotY; // Y axis rotation amounts
float rotZ; // Z axis rotation amounts
float rotDeltaX; // amount of X axis rotation change for each input
float rotDeltaY; // amount of Y axis rotation change for each input
float rotDeltaZ; // amount of Z axis rotation change for each input

float rotFact; // sets global rotation factor

void setup(){
 size(600,600,P3D);
 textSize(24);
 textAlign(CENTER);
 rotDeltaX=0;  // intially there is no rotation
 rotDeltaY=0;
 rotDeltaZ=0;
 transFact=3;
 rotFact=1;
}

void draw(){
 pushMatrix();
   jimsPrepareWindow();
   yourPrepareWindow();
   drawInitial();
 popMatrix();
 showStats();   
}

void drawInitial(){  
  if (fillStyle==true){
    noFill();
    stroke(255);
    strokeWeight(1);
  }
  if (fillStyle==false){
    fill(255);
    noStroke();
  }
  
  //crossbar
  box(100,50,50); 
  
  //leftside
  pushMatrix();
  translate(-75,0,0);
  box(50,200,100);
  popMatrix();
  pushMatrix();
  translate(-75,105,0);
  box(70,10,120);
  popMatrix();
  pushMatrix();
  translate(-75,-105,0);
  box(70,10,120);
  popMatrix();
  
  //rightside
  pushMatrix();
  translate(75,0,0);
  box(50,200,100);
  popMatrix();
  pushMatrix();
  translate(75,105,0);
  box(70,10,120);
  popMatrix();
  pushMatrix();
  translate(75,-105,0);
  box(70,10,120);
  popMatrix();
  
  //axis lines
  if (axisToggle==true){
    strokeWeight(3);
    stroke(200,200,0); 
    line(0,0,200,0,0,-200);  // Z axis line
    stroke(0,200,200);
    line(0,200,0,0,-200,0);  // Y axis line
    stroke(200,0,200);
    line(200,0,0,-200,0,0);  // X axis line 
  }
} 

void yourPrepareWindow(){
  translate(transX,transY,transZ);
  rotX+=rotDeltaX;
  rotY+=rotDeltaY;
  rotZ+=rotDeltaZ;
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
}

void mouseDragged(){
  if (mouseButton==LEFT){
     if (pmouseX<mouseX){
       transX+=transFact;
     }
     if (pmouseX>mouseX){
       transX-=transFact;
     }
     if (pmouseY<mouseY){
       transY+=transFact;
     }
     if (pmouseY>mouseY){
       transY-=transFact;
     }
  }
  else if (mouseButton==RIGHT){
    if (pmouseY>mouseY){
      transZ+=transFact;
    }
    else if (pmouseY<mouseY){
      transZ-=transFact;
    }
  }
} 

void keyPressed(){
  if (key=='X'){
     rotDeltaX+=rotFact;
  }
  if (key=='x'){
    rotDeltaX-=rotFact;
  }
  if (key=='Y'){
    rotDeltaY+=rotFact;
  }
  if (key=='y'){
    rotDeltaY-=rotFact;
  }
  if (key=='Z'){
    rotDeltaZ+=rotFact;
  }
  if (key=='z'){
    rotDeltaZ-=rotFact;
  }
  if (key==' '){
    transX=0;
    transY=0;
    transZ=0;
  }
  if (key=='s'){
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }
  if (key=='a'){
    axisToggle=!axisToggle;
  }
  if (key=='f'){
    fillStyle=!fillStyle;
  }
}  

void showStats(){
 fill(fontCol);
 //bottom translation
 text("Translations",width/2,height-65);
 text("X: "+transX+"    Y: "+transY+"    Z: "+transZ,width/2,height-40);
 //top rotation
 text("Rotations",width/2,40);
 text("    X: "+rotX+"    Y: "+rotY+"    Z: "+rotZ,width/2,65);
 text("Delta-X: "+rotDeltaX+"    Delta-Y "+rotDeltaY+"    Delta-Z "+rotDeltaZ,width/2,95);
}


void jimsPrepareWindow(){
  background(0);  
  translate(width/2,height/2,0);
  
  directionalLight(255,200,200,0,0,-1);
  directionalLight(200,255,200,1,0,0);
  directionalLight(200,200,255,0,1,0);
  
}


