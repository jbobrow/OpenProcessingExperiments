
void setup() {
  size(320,240); //Makes the window
  background(242); //Makes the sky
  
  fill(255,187,0); // Orange
  ellipse(270, 30, 30, 30); //Makes the Sun
  
  fill(50); // Grey
  rect(0, 200, width, 40); //Makes the Floor
  
  noStroke(); //Gets rid of outline.
  fill(100); //Lighter grey
  rect(0, 160, width, 40); //Skyline
  
  stroke(0); //Puts outline back.
  fill(20); //Dark Grey
  rect(20, 40, 40, 180); //Left tower
  rect(60, 80, 40, 140); //Middle Left Tower
  rect(150, 30, 40, 190); //Middle Right Tower
  rect(250, 40, 40, 180); //Right Tower
  
}


