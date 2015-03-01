
Droplet[] drops; // Declare the array
int numDrops = 50;
int currentDrop = 0;
void setup() {
size(400,400);
smooth();
drops = new Droplet[numDrops]; // Create the array
for (int i = 0; i < numDrops; i++) {
drops[i] = new Droplet(); // Create each object
}
}
void draw() {
  fill(0,10);
  rect(0,0,400,400);
for (int i = 0; i < numDrops; i++) {
drops[i].grow();
drops[i].display();
}
}
// Click to create a new Ring
void mousePressed() {
drops[currentDrop].start(mouseX, mouseY);
currentDrop++;
if (currentDrop >= numDrops) {
currentDrop = 0;
}
}
class Droplet {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the droplet
  boolean on = false; // Turns the display on and off

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 360;
  }

  void grow() {
      if (on == true) {
        diameter -= 0.5;
      if (diameter < 1) {
        on = false;
      }
    }
  }

  void display() {
    if (on == true) {
      fill(200,100,80,10);
      strokeWeight(3);
      stroke(80,150,190, 70);
      ellipse(x, y, diameter, diameter);  
    }
  }
}


