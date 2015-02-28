
// City Trail Exercise

// Intialising
void setup()  {
  size(600, 250);
  background(0);
  smooth();
}

float highrise1 = 0;
float highrise2 = 0;

// Starting image
void draw() {
  fill(255);
  rect(0, 150, 45, 100);
  rect(60, 120, 60, 150);
  rect(120, 60, 50, 200);
  rect(200, 140, 85, 120);
  rect(260, 200, 60, 100);
  rect(350, 120, 50, 150);
  rect(380, 80, 40, 200);
  rect(440, 160, 55, 110);
  rect(490, 180, 50, 180);
  rect(560, 200, 35, 160);   
}

// Click anywhere on screen and a high rise is placed on screen
// Left click = wide building, right click = thin building
// Maximum of 6 per building size to prevent overcrowding
// Creates a silhouette of a city skyline
void mouseClicked() {
  if (mouseButton == LEFT) {
    if (highrise1 < 6) {
      fill(255);
      rect(mouseX, mouseY, 60, 500);
      highrise1 = highrise1 + 1;
    }
  }
    else if (mouseButton == RIGHT)
      if (highrise2 < 6) {
      fill(255);
      rect(mouseX, mouseY, 40, 500);
      highrise2 = highrise2 + 1;
    }
}

