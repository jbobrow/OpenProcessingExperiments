
void setup() { 
  size(600, 400);
}
void draw() { 

  background(0); 

  if ((mouseX<300) && (mouseY<200)) { 
    // if we're in the top left, set the fill colour to yellow
    fill(255, 255, 0);
  } 
  else if ((mouseX>300) && (mouseY<200)) { 
    // if we're in the top right, set the fill colour to blue
    fill(0, 0, 255);
  } 
  else if ((mouseX<200) && (mouseY>200)) {
    // if we're in the bottom left, set the fill colour the cyan
    fill(0, 255, 255);
  } 
  else if ((mouseX>200) && (mouseY>200)) {
    // if we're in the bottom right, set the fill colour to red
    fill(255, 0, 0);
  }
  
  // draw a rectangle 
  rect(200, 100, 200, 200);
}
