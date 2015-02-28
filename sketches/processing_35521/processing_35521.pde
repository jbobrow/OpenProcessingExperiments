
ScrollPanel[] dog; // Array of panels

void setup() {
  size(600, 400);
  smooth();
  
  dog = new ScrollPanel[4]; // Create array
  
  dog[0] = new ScrollPanel("dog0.jpg",  20,  20, 300, 200); // Create panels
  dog[1] = new ScrollPanel("dog1.jpg",  20, 240, 180, 140);
  dog[2] = new ScrollPanel("dog2.jpg", 220, 240, 100, 140);
  dog[3] = new ScrollPanel("dog3.jpg", 340,  20, 240, 360);
  
  dog[0].setUpperLeft(365, 150); // Set starting positions
  dog[1].setUpperLeft(125, 70);
  dog[2].setUpperLeft(200, 100);
  dog[3].setUpperLeft(55, 30);
}

void draw() {
  background(0);
  for (ScrollPanel panel: dog) { // Run all of the panels
    panel.draw();
  }
}

void mousePressed() {
  for (ScrollPanel panel: dog) { // Have panels respond to mousePressed event
    panel.mousePressed();
  }
}

void mouseReleased() {
  for (ScrollPanel panel: dog) { // Have panels respond to mouseReleased event
    panel.mouseReleased();
  }
}

