
float triX = width/2;
float triY = height + 100;
float x = 0;
float y = 0;
float xspeed = 1;
float yspeed = 5;

void setup(){
size(200,200);
frameRate(30);
smooth();
}

void draw(){
 background(255);

 
  triX = triX + random(-20,20);
  triY = triY - 1;
 
  //set rect and ellipses mode
  rectMode(CENTER);
  ellipseMode(CENTER);
 
  
 //location of rect by speed
  x = x + xspeed;
  y = y + yspeed;
  //bounce off edges
  if ((x > width) || (x < 0)){
    xspeed = xspeed * -1;
  }
  
  if ((y > height) || (y < 0)){
    yspeed = yspeed * -1;
  }
  
   //draw rect
  stroke(0);
  fill(50,100,100);
  rect(x,y,30,30);
  
  //draw triangle
  noStroke();
  fill(mouseX,30,mouseY);
  triangle(triX,triY,150,100,60,150);
  
  //draw ellipse
  stroke(255,0,0);
  noFill();
  ellipse(120,40,30,30);
  
}
   

