
void setup(){

  size(400,400);
  background(255,255,255);
 
  
}


void draw(){
 
  float r;
r=random(2,100); 
  
  smooth();
 noStroke();
  
  //background(255,0,255);
  fill(255,0,255,54);
  rectMode(CENTER);
  rect(200,200,400,400);
  
   stroke(0);
  strokeWeight(5);
  line(200,200,mouseX,mouseY);
  
 noStroke();
 fill(mouseX,255,255);
  ellipse(100,100,r,r);
  fill(mouseX,255,255);
  colorMode(HSB);
  
  
 noStroke();
  fill(mouseX,255,255);
 ellipse(mouseX,mouseY,r,r);
 ellipseMode(CENTER);
  noStroke();
  colorMode(HSB);
  fill(mouseX,255,255);
  noStroke();
  
 
  
  
 
}
  




