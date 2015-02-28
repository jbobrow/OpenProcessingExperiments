

void setup(){
  size(700,600);
}

void draw(){
  background(200,4,50);
  smooth();

  // body
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(pmouseX,pmouseY,mouseX,mouseY);

  // left eye
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY,80,40);
  ellipse(mouseX +100,mouseY +0,80,40);
  
  // right eye
  stroke(100,4,50);
  fill(0);
  ellipse(mouseX,mouseY,16,32);
  ellipse(mouseX + 100,mouseY +0,16,32);
  
}



