
// hw6
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

/* Controls:
press the RIGHT key to start the marks
press any leter key to restart positions
*/

PVector loc1, loc2, loc3, loc4;
PVector vel1, vel2, vel3, vel4;
PVector bX, bY;
float r,g,b;

void setup(){
  size(500,500);
  background(0);
  smooth();
  
  // randomize locations
  loc1 = new PVector(random(width), random(height)); 
  loc2 = new PVector(random(width), random(height)); 
  loc3 = new PVector(random(width), random(height)); 
  loc4 = new PVector(random(width), random(height)); 
  
  //randomize velocities
  vel1 = new PVector(random(-5,5), random(-5,5));
  vel2 = new PVector(random(-5,5), random(-5,5));
  vel3 = new PVector(random(-5,5), random(-5,5));
  vel4 = new PVector(random(-5,5), random(-5,5));
  
  //
  bX = new PVector(-1,1); // for the x bounce
  bY = new PVector(1,-1); // for the y bounce
  
}

void draw(){
  
  if(keyPressed && keyCode == RIGHT){
    // make marks with end points that bounce
    marks(loc1, loc2);
    start1();
    bounce();
  
    // make marks with end points that wrap
    marks(loc3, loc4);
    start2();
    wrap();
    
    // isolate each one to see the individual effects of bounce or wrap
  }
  
  /* if(keyPressed && key == ' '){
    saveFrame("hw6.jpg"); // save image
  }*/ 
}

void marks(PVector v1, PVector v2){
  stroke(255,35);
  line(v1.x, v1.y, v2.x, v2.y);
  fill(255,7);
  noStroke();
  ellipse(v1.x, v1.y, 10, 10);
  ellipse(v2.x, v2.y, 10, 10);
}

void start1(){
  loc1.add(vel1);
  loc2.add(vel2);
}

void bounce(){
  if (loc1.x<0 || loc1.x>width){
    vel1.mult(bX);
  }
  if (loc2.x<0 || loc2.x>width){
    vel2.mult(bX);
  }
  if (loc1.y<0 || loc1.y>height){
    vel1.mult(bY);
  }
  if (loc2.y<0 || loc2.y>height){
    vel2.mult(bY);
  }
}

void start2(){
  loc3.add(vel3);
  loc4.add(vel4);
}

void wrap(){
  if (loc3.x<0){
    loc3.x = width;
  }else if (loc3.x>width){
    loc3.x = 0;
  }
  if (loc4.x<0){
    loc4.x = width;
  }else if (loc4.x>width){
    loc4.x = 0;
  }
  
  if (loc3.y<0){
    loc3.y = height;
  }else if (loc3.y>height){
    loc3.y = 0;
  }
  if (loc4.y<0){
    loc4.y = height;
  }else if (loc4.y>height){
    loc4.y = 0;
  }
}

void keyPressed(){
  if (key >= 'a' && key <= 'z'){
    fill(0);
    rect(0,0,width,height);
  
    // randomize locations
    loc1 = new PVector(random(width), random(height)); 
    loc2 = new PVector(random(width), random(height)); 
    loc3 = new PVector(random(width), random(height)); 
    loc4 = new PVector(random(width), random(height)); 
  
    //randomize velocities
    vel1 = new PVector(random(-5,5), random(-5,5));
    vel2 = new PVector(random(-5,5), random(-5,5));
    vel3 = new PVector(random(-5,5), random(-5,5));
    vel4 = new PVector(random(-5,5), random(-5,5));

  }
}

