
// Setup the Processing Canvas
void setup() {
  size(400, 400);
  noStroke();
  smooth();
  frameRate(15);
}

// Main draw loop
void draw() {

  // Fill the floor
  background(161, 100, 3);
  for(int i = 0; i < width; i+=40) {
    stroke(136, 84, 3);
    line(i, 0, i, height);
  }
  
  // Call the method to in order to create cheese slices 
  createCheese();
  
  // Draw the mouse nose
  fill(149, 139, 138);
  triangle(mouseX - 15, mouseY, mouseX, mouseY - 15, mouseX + 15, mouseY);
  ellipse(mouseX, mouseY + 10, 25, 25);
  fill(0);
  ellipse(mouseX, mouseY - 15, 7, 7);
  fill(255, 184, 160);
  triangle(mouseX - 2, mouseY + 23, mouseX, mouseY + 60, mouseX + 2, mouseY + 23);
}

// Draw cheese slices  
void createCheese() {
  noStroke();
  fill(255, 187, 0);
  if (mouseX > 30 || mouseY > 30) { 
    ellipse(0, 0, 50, 50);
  } 

  if (mouseX < 370 || mouseY > 30) { 
    ellipse(400, 0, 50, 50);
  }

  if (mouseX > 30 || mouseY < 370) { 
    ellipse(0, 400, 50, 50);
  }

  if (mouseX < 370 || mouseY < 370) { 
    ellipse(400, 400, 50, 50);
  }
}


