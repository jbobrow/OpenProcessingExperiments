
void setup(){
  size(500,500);
  background(100,230,180);
  smooth();
}

void draw (){
  fill(200,0,0,150);
  rectMode(CORNERS);
  rect(200,300,mouseX,mouseY);
}

void keyPressed(){
  colorMode(RGB,500);
  background(mouseX,mouseY-50,90);
}

void mousePressed(){
  noFill();
  stroke(0);
  strokeWeight(7);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,100,100);
}
 


