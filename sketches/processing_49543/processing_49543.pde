
// Simon
// Pull-Up-Man-Creature

void setup() {
 
  size(400, 400);
  smooth();
  
}

void draw() {
 
  background(200);
 
  // Pull-up bar
  noStroke();
  fill(100);
  rect(0, 100, width, 10);
  
  // Arms
  fill(50);
  stroke(50);
  strokeWeight(3);
  line(mouseX, mouseY, 150, 110);
  line(mouseX, mouseY, 250, 110);
  
  // Legs
  fill(50);
  strokeWeight(3);
  line(mouseX - 5, mouseY, mouseX - 15, mouseY + 60);
  line(mouseX + 5, mouseY, mouseX + 15, mouseY + 60);
  
  // Head
  noStroke();
  fill(225);
  ellipse(mouseX, mouseY, 100, 100);
  fill(255);
  ellipse(mouseX - 1, mouseY - 1, 95, 95);
  
  // Eyes
  fill(50);
  ellipse(mouseX - 15, mouseY - 15, 20, 20);
  ellipse(mouseX + 15, mouseY - 15, 20, 20);
  fill(255);
  ellipse(mouseX - 15, mouseY - 20, 5, 5);
  ellipse(mouseX + 15, mouseY - 20, 5, 5);
  
  // Mouth
  stroke(50);
  strokeWeight(1);
  ellipse(mouseX, mouseY + 20, 20, 10);
  
}
                                                
