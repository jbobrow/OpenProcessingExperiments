
int radius;
float r = 1;


void setup(){
  
  size(500,500);
  background(144,24,221);
  fill(18,18,18);
 
}
void draw(){
  

    rotate(mouseY/2);
    rectMode(CENTER);
    
    rect(width/2,height,10,400);
    
    stroke(250,10,50);
    radius = mouseX;
    strokeWeight(10);
    ellipse(mouseY,frameCount,116,113);
    ellipse(mouseY,frameCount,250,40);
    ellipse(mouseX,r,r,r*40);
    
   
}



