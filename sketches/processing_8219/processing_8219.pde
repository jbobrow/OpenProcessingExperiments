
void setup(){
  size(400,400);
  background(0,0,0);
  smooth();
  strokeWeight(0.3);
  stroke(255);
  noFill();
}
int startX=200;
int startY=200;
void draw(){
  if(mousePressed == true){
  startX=mouseX+25;
  startY=mouseY+25;
  background(0,0,0);
 
  }
  rect(startX,startY,mouseX-startX,mouseY-startY);  
}

