
// Inspired by an image of polka dot pattern, 
// I wanted to create a dynamic version of it
// with multiple variables and ability to save an image
// if I stumbled upon an interest moment.

// Global Variables.
int stepX;
int stepY;

// Setup
void setup() {
  size(800, 600);
  background(100);
}

// Draw: Create dynamic polka dot pattern
void draw() {
  background(100);
  int stepX = mouseX+30;
  int stepY = mouseY+30;
  for(int gridX = 20; gridX < width; gridX += stepX){
   for(int gridY = 20; gridY < height; gridY += stepX){
     noStroke();
     fill(0);
     ellipse(gridX + (mouseX / 2), gridY + (mouseX / 2), mouseX, mouseX); 
     fill(#F0B216);
     float multiX = map(mouseY, 0, height, 1, 2);
     float multiX2 = map(mouseY, 0, height, 1, 3);
     ellipse(gridX + (mouseX / 2) +(mouseY / 5), gridY +(mouseX / 2) + (mouseY / 5), (mouseX /2) * multiX2 , (mouseX / 2) * multiX2);
   }
  }
}

// Key Pressed: Save image
void keyPressed() {
  if(key == 's' || key == 'S') saveFrame("Assignment_3-######.jpg");
}
