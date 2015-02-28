
float[] rectangle = new float[width];


void setup(){
  size (500,500);
  background (255);
  smooth();
  
}

void draw() {
  if (mousePressed) {
   
  }
  strokeWeight(2);
  noFill();
  background(255);
  rectMode(CENTER);
  rect(mouseX, mouseY, 75, 75);
  quad(mouseX-50, mouseY, mouseX, mouseY-50, mouseX+50, mouseY, mouseX, mouseY+50);

  if (mousePressed == true)
  {

  ellipse(mouseX-38, mouseY-12, 10, 10);
  ellipse(mouseX-38, mouseY+12, 10, 10);
  
  ellipse(mouseX-12, mouseY-38, 10, 10);
  ellipse(mouseX+12, mouseY-38, 10, 10);
  
  ellipse(mouseX-13, mouseY+37, 10, 10);
  ellipse(mouseX+13, mouseY+37, 10, 10);
  
  ellipse(mouseX+37, mouseY-13, 10, 10);
  ellipse(mouseX+37, mouseY+13, 10, 10);
  }
  

if (mousePressed == true)
 {

 }

}
  

 
  


