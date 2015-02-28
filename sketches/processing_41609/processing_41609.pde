
float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;
 
void setup(){
  size(700,400);
  noStroke();
  smooth();
}
 
void draw(){
  background(25);
  frameRate(20);
   
  noFill();
  ellipse(pmouseX, pmouseY, 100, 100); // center circle
   
  //
  noFill();
  strokeWeight(sw);
   
  // increasing variables
  x += 15;
  y += 15;
  x2 += 10;
  y2 += 10;
  x3 += 5;
  y3 += 5;
 
   
  //
  stroke(255, random(200,255));
  ellipse(pmouseX, pmouseY, x, y);
   
  stroke(255, random(200,255));
  ellipse(pmouseX, pmouseY, x2, y2);
   
  stroke(255, random(200,255));
  ellipse(pmouseX, pmouseY, x3, y3);
}
 
void mouseDragged(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
   
  sw += 1;
  
  if(sw > 150){
    sw = 5;}
}


