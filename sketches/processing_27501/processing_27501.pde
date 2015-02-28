
ArrayList<Creature> creature;


void setup() {
  size(
    368, 
    368, JAVA2D);
  frameRate = 60;
  smooth();
  creature = new ArrayList<Creature>();
  
  // Populate creature list
  for (int i = 0; i < pow(GRID_SIZE, 2); i ++) {
    creature.add(new Creature());
  }
}

void draw() {
  // Draw
  // background(random(8));
  background(0);
  
  // Draw Creatures
  int i = 0;
  for (int y = 0; y < GRID_SIZE; y ++) {
    for (int x = 0; x < GRID_SIZE; x ++) {
      creature.get(i).Draw(MARGIN + x * SPACING, MARGIN + y * SPACING);
      i ++;
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
}

void mouseClicked() {
  int xIndex, yIndex;
  xIndex = (mouseX - MARGIN + SPACING / 2) / SPACING;
  yIndex = (mouseY - MARGIN + SPACING / 2) / SPACING;
  print("Clicking on creature " + xIndex + ", " + yIndex + "\n");
  Repopulate(creature.get(xIndex + yIndex * GRID_SIZE));
}

Creature Breed(Creature parent) {
  Creature child = new Creature();
  float randomness = 0.1;
  child.elementCount = 0;
  child.point1 = new ArrayList<PVector>();
  child.point2 = new ArrayList<PVector>();
  child.point3 = new ArrayList<PVector>();
  
  // sometimes drop an element
  boolean removeElement = false;
  if (random(1) < 0.25) {
    removeElement = true;
  }

  int limit = parent.elementCount;
  if ((limit > 3) && (removeElement)) {
    limit -= 1;
  }
  
  for (int i = 0; i < limit; i ++) {
    child.elementCount ++;
    child.point1.add(new PVector());
    child.point1.get(i).x = parent.point1.get(i).x + randomness * (1 - random(2));
    child.point1.get(i).y = parent.point1.get(i).y + randomness * (1 - random(2));
    child.point2.add(new PVector());
    child.point2.get(i).x = parent.point2.get(i).x + randomness * (1 - random(2));
    child.point2.get(i).y = parent.point2.get(i).y + randomness * (1 - random(2));
    child.point3.add(new PVector());
    child.point3.get(i).x = parent.point3.get(i).x + randomness * (1 - random(2));
    child.point3.get(i).y = parent.point3.get(i).y + randomness * (1 - random(2));
  }
  
  if (random(1) < 0.25) {
    if (limit < 7) {
      child.elementCount ++;
      child.point1.add(new PVector(0.5 - random(1), 0.5 - random(1)));
      child.point2.add(new PVector(0.5 - random(1), 0.5 - random(1)));
      child.point3.add(new PVector(0.5 - random(1), 0.5 - random(1)));
    }
  }
  
  float nudge = 0.2;
  for (int i = 0; i < child.elementCount; i ++) {
    if (child.point1.get(i).x < -0.5) {
      child.point1.get(i).x += random(nudge);
    }
    if (child.point1.get(i).x > 0.5) {
      child.point1.get(i).x -= random(nudge);
    }
    if (child.point1.get(i).y < -0.5) {
      child.point1.get(i).y += random(nudge);
    }
    if (child.point1.get(i).y > 0.5) {
      child.point1.get(i).y -= random(nudge);
    }
    if (child.point2.get(i).x < -0.5) {
      child.point2.get(i).x += random(nudge);
    }
    if (child.point2.get(i).x > 0.5) {
      child.point2.get(i).x -= random(nudge);
    }
    if (child.point2.get(i).y < -0.5) {
      child.point2.get(i).y += random(nudge);
    }
    if (child.point2.get(i).y > 0.5) {
      child.point2.get(i).y -= random(nudge);
    }
    if (child.point3.get(i).x < -0.5) {
      child.point3.get(i).x += random(nudge);
    }
    if (child.point3.get(i).x > 0.5) {
      child.point3.get(i).x -= random(nudge);
    }
    if (child.point3.get(i).y < -0.5) {
      child.point3.get(i).y += random(nudge);
    }
    if (child.point3.get(i).y > 0.5) {
      child.point3.get(i).y -= random(nudge);
    }
  }
  
  return child;
}

// Repopulate the entire grid using the specified creature
// as a parent. The parent goes in slot 0;
void Repopulate(Creature parent) {
  creature.clear();
  creature.add(parent);
  for (int i = 0; i < pow(GRID_SIZE, 2) - 1; i ++) {
    creature.add(Breed(parent));
  }
}

