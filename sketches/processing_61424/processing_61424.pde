
//Sara Humel @ copyright 2012
//shumel@andrew.cmu.edu

// press c to stop one set of rectangles from rotating.
// press c to make it rotate again
// press mouse to fade out background
// press L to change stroke weight
// press k to change it back
// change MAX to change number of boxes
// press v to invert colors.... or just hold it downkk

import processing.opengl.*;

final int MAX = 10;
color [] colors = new color [MAX];
float [] var = new float [MAX];
float [] rot = new float [MAX];
float [] rota = new float [MAX];


int count = 0;
int t = 0;
float xoff = 0.0;
float addon = 0.01;

void initializeColors(color [] array) {
   for (int i = 0; i < array.length; i++) {
    if (i % 2 == 0) {
       array[i] = color(255,255,255); 
    } else {
       array[i] = color(0,0,0); 
    }
   } 
   print(array);
}

void inverseColor(color [] array) {
   for (int i = 0; i < array.length; i++) {
    if (i % 2 == 0) {
       array[i] = color(0,0,0); 
    } else {
       array[i] = color(255,255,255); 
    }
   } 
}

void initializeVar( float [] array){
 for(int i = 0; i < array.length; i++) {
  array[i] = i+0.5;
 } 
}

void initializeRot (float [] array) {
  float x = array.length/360;
  for(int i = 0; i < array.length; i++) {
    array[i] = i*x;
  }
}

void rotChange (float [] array, float [] array2) {
 for(int i = 0; i < array.length; i++) {
  array[i] = array[i] + array2[i];
 } 
}

void initializeRota (float [] array){
  for(int i = 0; i < array.length; i++) {
   array[i] = 1; 
  }
}

void rotDirChange (float [] array) {
  for(int i = 0; i < array.length; i++) {
     if (i % 2 == 0) {
     array[i] = array[i]*-1;
    } 
  }
}



int x = 0;
int y = 1;


void setup() {
  background(100);
  size (600,600,OPENGL);
  noFill();
  initializeColors(colors);
  initializeVar(var);
  initializeRot(rot);
  initializeRota(rota);
}


void draw() {
  fill(100,t);
  rect(0,0,600,600);
  noFill();
  stroke(0);
  float n = noise(xoff) * 300;
  float m = n*-1;
  xoff = xoff + addon;
  translate(height/2,height/2);
  
  drawRect(colors,n,rot,var);
  rotChange(rot,rota);

  
}

void drawRect(color [] c, float w, float [] rot, float [] var){
  for (int i = 0; i < c.length; i++){
    stroke(c[i]);
    rotateZ(radians(rot[i]));
    rect(w/var[i],w/var[i],w/var[i],w/var[i]);
    
  }
}



void keyPressed() {
 if (key == 'c') {
   rotDirChange(rota);
 }
 if (key == 'v') {
   
   if (count % 2 == 0) {
   inverseColor(colors);
   } else {initializeColors(colors);
   }
   count++;
 }
 if (key == 'l') {
   strokeWeight(4);
 }
 if (key == 'k') {
   strokeWeight(1);
 }
}


void mousePressed( ) {
t+=20;
}

void mouseReleased( ){
  t=0;
}




