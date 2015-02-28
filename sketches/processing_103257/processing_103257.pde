
//Name : Liheng Zhang
//Date : 07/08/2013
//Project Name : Red/Green/Blue Dot Draw
//The default dot is red and press "a" to create green dot and press "s" to create blue dot. Have Fun.

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
  
  if (key == 'a') {
    fill (0,250,0); 
    ellipse(mouseX, mouseY, 10, 10);
  }
  
  if (key == 's') {
    fill(0,0,250);
    ellipse(mouseX, mouseY, 10, 10);
  }
}
