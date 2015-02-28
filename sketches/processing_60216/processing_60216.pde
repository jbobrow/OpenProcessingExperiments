
void setup(){

  size(400,400);
  background(255,255,255);
 
}
  

void draw(){
 
float r;
r=random(100,200);
  
smooth();
  
 //background(255,255,255);
 
fill(255,0,255,50);
rectMode(CENTER);
rect(200,200,400,400);  

stroke(0);
strokeWeight(3);
line(200,200,mouseX,mouseY);

noStroke();
colorMode(HSB);
fill(mouseX,255,255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,r,r);


}

