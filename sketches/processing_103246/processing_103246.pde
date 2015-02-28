
//Name : Liheng Zhang
//Date : 07/08/2013
//Project Name : Red/Green Dot Draw
//The default dot is red and click to create green dots. Have Fun.

void setup () {
  frameRate(60);
  background(255);
  size (400, 400);
  strokeWeight(0);
}

void draw() 
  {
  fill (250,0,0);
  ellipse(mouseX, mouseY, 10, 10);  // draw a circle at mouse location
  
  if (mousePressed == true) {
    fill (0,250,6); 
    ellipse(mouseX, mouseY, 10, 10);
  }

}
