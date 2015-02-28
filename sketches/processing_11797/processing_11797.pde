
// Assignment #1
// Name: Caitlin Fregoe
// E-mail: cfregoe@brynmawr.edu
// Date: 9/6/2010

// Setting up size of frame
void setup() {
  size(500, 500);
  smooth();
  
}

// Kirby's feet
  void draw() {
  background(21, 229, 43);
  strokeWeight(3);
  stroke(0);
  fill(252, 5, 55);
  ellipse(170, 390, 150, 80);
  
  strokeWeight(3);
  stroke(0);
  fill(252, 5, 55);
  ellipse(330, 390, 150, 80);

// Kirby's arms (make the first one mouseY?)
  strokeWeight(3);
  stroke(0);
  fill(255, 108, 135);
  ellipse(100, 200, 100, 100);
  
  strokeWeight(3);
  stroke(0);
  fill(255, 108, 135);
  ellipse(390, 270, 100, 100);
  
// Kirby's body 
  strokeWeight(3);
  stroke(0);
  ellipseMode(CENTER);
  fill(242, 115, 138);
  ellipse(250, 250, 300, 300);
  
// Blue part of Kirby's eyes
  strokeWeight(1);
  stroke(0);
  fill(7, 6, 237);
  ellipse(210, 200, 40, 90);
  
  strokeWeight(1);
  stroke(0);
  fill(7, 6, 237);
  ellipse(290, 200, 40, 90);
  
// Black part (middle) of Kirby's eyes
  noStroke();
  fill(0);
  ellipse(210, 190, 40, 50);
  
  noStroke();
  fill(0);
  ellipse(290, 190, 40, 50);
  
// White part of Kirby's eyes
  strokeWeight(2);
  stroke(0);
  fill(255);
  ellipse(210, 180, 30, 50);
  
  strokeWeight(2);
  stroke(0);
  fill(255);
  ellipse(290, 180, 30, 50);
  
// Kirby's cheeks
  noStroke();
  fill(245, 44, 131);
  ellipse(170, 260, 45, 20);
  
  noStroke();
  fill(245, 44, 131);
  ellipse(330, 260, 45, 20);
  
// Kirby's mouth 
  strokeWeight(1);
  stroke(0);
  fill(255, 0, 0);
  ellipse(250, 280, 40, 40);
  
}

