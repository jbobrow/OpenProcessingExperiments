
float posX=1;
float posY=1;
 
void setup(){
  size(250,250);
  background(0,0,0);
}
 
void draw(){
  
  noFill();
  strokeWeight(0.5);
  stroke(255,255,255,30);
 
  if(mousePressed){
    ellipse(posX,posY,mouseX,mouseY);
 
  }
  }
 
void mousePressed(){
  posX = mouseX;
  posY = mouseY;
}


