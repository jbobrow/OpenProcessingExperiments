
void setup(){
  
  size(500, 500);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  noCursor();
}

float angle;

void draw(){
    fill(0, 10);
   rect(0, 0, 1000, 1000);
  angle += PI*mouseX/width;
  
  translate(mouseX, mouseY);

  rotate(angle);

  noStroke();
  fill(255, 80);
 
  ellipse(mouseX, mouseY, 20, 50);
  ellipse(mouseX, mouseY, 50, 20);
  
 
}
