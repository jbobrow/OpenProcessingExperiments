


ArrayList ripples;    // List of ripples.
int maxDrops = 100;   // Max number of rain drops.

void setup() {
  size(600, 400);
  background(0);
  smooth();
  ripples = new ArrayList();
}

void draw() {
  // Use filled rectable instead of background() for 
  // better graphic quality.
  fill(0, 15);
  rect(0, 0, width, height);

  // If mousePressed then add ripple at the cursor's location, otherwise
  // add random ripples over the canvas. Random(100) > 80 is used to
  // take probability into account.
  if (mousePressed == true) {
    ripples.add(new Ripple(mouseX, mouseY, random(50, 100)));
  } else if (ripples.size() < maxDrops && random(100) > 80) {
    ripples.add(new Ripple(random(0, width), random(0, height), random(50, 100)));
  }
  
  // For each ripple, update its shape or kill it if its dead,
  // then display it.
  for (int i = ripples.size() - 1; i >= 0; i--) {
    Ripple rip = (Ripple) ripples.get(i);
    rip.update();
    if (rip.finished()) {
      ripples.remove(i);
    } else {
      rip.display();
    }
  }
}

