
void setup(){
 
   size(400,400);
   background(255,255,255);
    
}
 
 
void draw(){
 
float r;
r = random(10,400);
 
  
smooth();
noStroke();
 
background(r,r,255);
fill(255,0,255,224);
rectMode(CENTER);
rect(200,r,400,r);
 
stroke(0);
strokeWeight(r);
line(200,200,mouseX,mouseY);
noStroke();
colorMode(HSB);
fill(mouseX,255,255);
ellipseMode(CENTER);
 

ellipse(r,r,mouseY,mouseX);
 

  }

