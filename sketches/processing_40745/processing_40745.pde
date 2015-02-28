
void setup() {
  size(300,300);
  background(255);
  smooth();
}

void draw() {
  
  fill(255, 70);
  noStroke();
  rect(0,0,width,height);
  
  //colorati
  fill(210);
  ellipse(50,50,mouseX/4-20,mouseX/4-20);
  ellipse(250,250,mouseX/4-20,mouseX/4-20);
  ellipse(250,50,mouseY/4-20,mouseY/4-20);
  ellipse(50,250,mouseY/4-20,mouseY/4-20);
  
  noFill();
  stroke(40);
  strokeWeight(2);
  ellipse(150,150,mouseX,mouseX);
  ellipse(50,50,mouseX/4,mouseX/4);
  ellipse(250,250,mouseX/4,mouseX/4);
  ellipse(250,50,mouseY/4,mouseY/4);
  ellipse(50,250,mouseY/4,mouseY/4);
  //interni
  strokeWeight(1);
  stroke(180);
  ellipse(150,150,mouseX-10,mouseX-10);
  ellipse(50,250,mouseY/4-10,mouseY/4-10);
  ellipse(250,50,mouseY/4-10,mouseY/4-10);
  
  //mouse
  ellipse(mouseX,mouseY,mouseY,mouseX);
  
  
}

