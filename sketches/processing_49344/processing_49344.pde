
class Reginald {
  float x;
  float y;
  color col;
  boolean hit = false;
   
  Reginald(float x_, float y_, color col_) {
    x = x_;
    y = y_;
    col = col_;
  }
   
  void display(float x_, float y_) {
    x = x_;
    y = y_;
    ellipseMode(CENTER);
    rectMode(CENTER);
    noStroke();
  
  //body
  if (hit) {
    fill(224,34,155);
  } else {
    fill (col); 
  } 
  ellipse(x,y,35,35);
  
  //ears
  fill(255);
  noStroke();
  ellipse(x-15,y-55,20,20);
  fill(255);
  noStroke();
  ellipse(x+25,y-40,20,20);

  //head
  if (hit) {
    fill(224,34,155);
  } else {
    fill (col); 
  } 
  ellipse(x,y-35,50,50);

  //black Pupils
  if (hit) {
    fill(255);
  } else {
    fill (0); 
  } 
  stroke(0,0,255);
  ellipse(x+13,y-37,20,20);
  if (hit) {
    fill(255);
  } else {
    fill (0); 
  } 
  stroke(0,0,255);
  ellipse(x-10,y-47,20,20);

  //eye glitters
  //right eye
  
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  noStroke();
  ellipse(x+10,y-43,5,5);
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  ellipse(x+14,y-40,2,2);
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  ellipse(x+10,y-35,8,8);
  //left eye
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  noStroke();
  ellipse(x-8,y-53,5,5);
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  ellipse(x-10,y-48,2,2);
  if (hit) {
    fill(0);
  } else {
    fill (255); 
  } 
  ellipse(x-8,y-45,8,8);

  //smile
  noFill();
  stroke(0);
  arc(x-5,y-30,10,10,0,radians(180));

  //feet
  fill(225);
  noStroke();
  ellipse(x-15,y+12,15,15);
  fill(225);
  noStroke();
  ellipse(x+15,y+12,15,15);

  //flower
  stroke(16,129,41);
  line(x-20,y-6,x+10,y+20);
  fill(255,255,0);
  stroke(47,206,247);
  ellipse(x-20,y-5,5,5);
  fill(0,x,y);
  ellipse(x-21,y-10,7,7);
  fill(0,x,y);
  ellipse(x-16,y-8,7,7);
  fill(0,x,y);
  ellipse(x-15,y-2,7,7);
  fill(0,x,y);
  ellipse(x-20,y+1,7,7);
  fill(0,x,y);
  ellipse(x-24,y-1,7,7);
  fill(47,x,y);
  ellipse(x-25,y-5,7,7);
  }
  
  void hitTest(Reginald reginald) {
     if (dist(x, y, reginald.x, reginald.y) <= 80) {
      reginald.hit = true;
      hit = true;
    } else {
      reginald.hit = false;
      hit = false;
    }
  }
}


