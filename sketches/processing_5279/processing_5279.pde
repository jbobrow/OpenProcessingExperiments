
PImage clay;   //clay version of guy
PShape vec;     //svg version 
Boolean vector=true;  // holder for spacebar toggle
PImage space;    //background
PImage spacedumb; //background


int x=320;     //holder to help in illustrator coordinate conversion

void setup()
{
size(480,320);
clay = loadImage("clay2.png");  //load images
vec= loadShape("robit.svg");
space= loadImage("space.jpg");
spacedumb=loadImage("spacedumb.jpg");
smooth();
}

float counter;  // counter for mouse clicks


void draw() {
  
float xp = counter*1.2;   // red bar height tied to mouse click
float mgc =counter*1.4; //green bar height tied to mouse click
  
 background(spacedumb);  //cartooned background for true cartoon state
 if (vector == true) {
  
   shape(vec, 130, 40);  //draw image
 } else                  //in false clay state

 {
      background(space);  //draw photobackground
   image(clay, 2, 0);
 }
 
    fill(0,0,0);
  if (vector==false){  //if the state is false,change the power bars
 
   if (counter>=42){  //do not let reveal of power bars go above limit
     counter=42;}
   
      rect(220,80,40,40-counter);  //draw diminishing black rectangle to reveal power bars
    
  }
  
  
  else{
    
    fill(255,0,0);
  if (xp>=42){
    rect(220,x-256,10,42);  //if counter is full draw a static yellow rect
}
  else{                   // counter is being added to draw a red rect based on clicks
     rect(220,x-256,10, xp);
}
  
   fill(0,255,0);
  if(mgc>=42){
    
    rect(240,x-256,10,42);
  }
  else{
 
  rect(240,x-256,10,mgc);
  }
  }
 
 
   println(counter);
   counter-=.1;
   
   if (counter<=0){
     counter=0;
   }
   
 
      
  }


  void mousePressed(){  //add to powerbar counter on mouseclick
   
    counter+=2;
  }

void keyPressed() {      //casey's code to toggle state w/spacebar
 if (key == ' ') {
//   if (vector == true) {
//     vector = false;
//   } else {
//     vector = true;
//   }
   vector = !vector;  // This line is the same as the five above
 }
}


  







