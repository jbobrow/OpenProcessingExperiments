


void setup() {
  size(800,800,P3D);
}

void draw() {
  background(0);
  stroke(0);
  fill(255, 48, 218);
  translate(width/2,height/2);
  rotateX(PI*mouseY/height);
  rotateY(PI*mouseX/width);
  rectMode(CENTER);
  rect(0,0,100,100);
  
  translate(width/5,height/5);
  rotateX(PI*mouseY/height);
  rotateY(PI*mouseX/width);
  
 sphere (100);
 
 translate(width/6,height/6);
  rotateX(PI*mouseY/height);
  rotateY(PI*mouseX/width);
  
 sphere (200);
  
  
}


