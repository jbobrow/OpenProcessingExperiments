
float angle = 0.0;

void setup(){
  size(400,400);
  smooth();
  rectMode(CENTER);
}

void draw(){
  fill(mouseX,300,mouseY);
  ellipse(50,50,58,56);
  
  fill(mouseX,194,mouseY);
  pushMatrix();
    translate(mouseX,mouseY);
    rotate(angle);
    rect(12,12,100,20);
  popMatrix();
  
  fill(46,100,23);
  ellipse(50,50,20,20);
  
  angle += 0.1;
}


