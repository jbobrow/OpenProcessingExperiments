
void setup () {
  size(720, 480);
  fill(0, 500);
  smooth();
  noStroke();
}


void draw() {
  background(204);
  if (mousePressed) {
     stroke(0);
  } else {
       stroke(255);
     }
  rect(mouseX,mouseY,162,266);
  fill(0);
  ellipse(mouseX,mouseY,200,200);  //Large eye
  rect(mouseX,mouseY,162,266);
  fill(100);
  ellipse(mouseX,mouseY,200,200); 
  ellipse(mouseX,mouseY,200,200);
  fill(0);
  ellipse(mouseX,mouseY,100,100);
  fill(100);
  ellipse(mouseX,mouseY,20,20);
  fill(255);
  
}





