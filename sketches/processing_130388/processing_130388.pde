
//Tomas de Camino
//push and pop Matrix Example

float x,y;

void setup(){
 size(600,600);
 smooth();
 noCursor();
 x= width/2;
 y= width/2;
 ellipseMode(CENTER);
 rectMode(CENTER);
}

void draw(){
  background(255);
  fill(255*sin(frameCount/8));
  noStroke();
  ellipse(mouseX, mouseY, 100,100);
  fill(100,114,200,255);
  pushMatrix();
    translate(x,y);
    rotate(frameCount);
    rect(0 ,0 ,100,100);
  popMatrix();
  x+=(mouseX-x)/50;
  y+=(mouseY-y)/50;
  
}
