


//method - returns a value 
void setup() {
  size(600, 500);
 
  background(255);
  smooth();

}

//call a function
void draw() {
  background(20);
  stroke(100, 100, 100);
  vortex(200, 200, mouseX); // function
  vortex(100, 100, mouseX);
  vortex(200, 200, mouseX);
  vortex(100, 100, mouseY);

}


//function's method
void vortex(int x, int y, int d) {
  pushMatrix();
  translate(x, y);
  stroke(90, 190, 0);
  noFill();
  
  for(int i = 150; i < d; i +=20) {
    //line(mouseX, mouseY, i, i);
    //line(mouseX, mouseY, mouseX, mouseY);
   
    ellipse(0, 0, i, i);
    ellipse(mouseX, mouseY, i, i);
    //stroke(10, 0, 50);
    ellipse(mouseY, 100, i, i);
    ellipse(mouseX, 100, i, i);
    ellipse(200, mouseX, i, i);
    ellipse(200, mouseY, i, i);
    //stroke(100, 0, 150);
    ellipse(mouseX, 50, i, i);
    ellipse(mouseY, 50, i, i);
    stroke(0, 200, 0);
    ellipse(10, 10, mouseX, mouseY);
    ellipse(15, 15, mouseX, mouseY);
    ellipse(20, 20, mouseX, mouseY);
    stroke(0, 100, 250);
    //ellipse(mouseX, mouseY, 25, 25);
    ellipse(mouseX, mouseY, 150, 150);
  
  }
  popMatrix();
}







