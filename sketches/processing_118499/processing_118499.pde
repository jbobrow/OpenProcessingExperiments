
class cell{

PVector loc = new PVector();
PVector velocity = new PVector ();
float diam;
boolean isseed;
float cellred;
float cellgreen;
float cellblue;
float lineWeight;


cell(){
loc = new PVector(random(500),random(500),random(500));
diam = 5 ;
isseed = false ;
cellred = 255;
cellgreen = 255;
cellblue = 255;

}

void display(){
stroke (0);


if(isseed == true)    { fill(255,0,0);}
if(isseed == false) {fill(cellred,cellgreen,cellblue);
}

line(loc.x,loc.y,loc.z,loc.x,(loc.y+3),loc.z);
}
void update(){
  if(isseed == false){
 velocity = new PVector (random(-50,50),random(-50,50),random(-50,50));
 loc.add(velocity);
  
}}}  

import processing.dxf.*;
boolean record;

cell[] mycells = new cell[10000];

void setup(){
size(500,500,P3D);
 background(255);
 for(int i =0; i<mycells.length; i++) {mycells[i] = new cell();}
 

  
}
void draw(){

 //camera(500, 500, 500, 0, 0, 0, 0,0, 1);   //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
 //-----------draw starts------------
if (record) {
    beginRaw(DXF, "structure.dxf");
}
//----------------------------------
 mycells[0].isseed = true;
 for(int i=0; i<mycells.length; i++){

  mycells[i]. update();

  if (mycells[i].isseed == false) {


    for(int j=0; j<mycells.length; j++) {
         
        if(mycells[j].isseed == true)  {

            float d;
            d = PVector.dist(mycells[i].loc, mycells [j].loc);
            
              if(d<25) {  mycells[i].isseed = true; 
stroke(0,random(150),random(255));
strokeWeight(random(1,3));
          line(mycells[i].loc.x, mycells[i].loc.y, mycells[i].loc.z , mycells[j].loc.x, mycells[j].loc.y, mycells[j].loc.z);
        
      }}}}}
  //---------------draw ends----------------
  if (record) {
    endRaw();
    record = false;
  }}

//---------------------------------------  
  

 void keyPressed() {if (key == 'I' || key == 'i') {
      save("structure.png"); loop(); }  
 if (key == 'r'|| key=='R') {
    record = true;
  }
}
