
final static int CELL_SIZE = 90;
final static int CELLS_X   = 9;
final static int CELLS_Y   = 9;
final static int N_VICTIMS = 200;

Victim[] victims;
ArrayList<Victim>[][] neighbors;
int numSick, numImmune, numDead;
float sumHealth, sumImmunity, sumInfection;
int num = 5;
boolean showRange = false;
Victim hover = null;

void setup() {
  size(810, 810);
  smooth();
  victims   = new Victim[N_VICTIMS];
  neighbors = new VictimList[CELLS_X][CELLS_Y];
  for(int i = 0; i < victims.length; i++)
    victims[i] = new Victim();
  for(int i = 0; i < neighbors.length; i++)
    for(int j = 0; j < neighbors[i].length; j++)
      neighbors[i][j] = new VictimList();
}

void mouseMoved() {
  PVector m = new PVector(mouseX, mouseY);
  int x = constrain(floor(mouseX / CELL_SIZE), 0, CELLS_X - 1);
  int y = constrain(floor(mouseY / CELL_SIZE), 0, CELLS_Y - 1);
  hover = null;
  float closest = -1;
  cursor(ARROW);
  for(Victim v : neighbors[x][y]) {
    float d = PVector.dist(v.position, m);
    if(d < 20 && (hover == null || d < closest)) {
      hover = v;
      closest = d;
      cursor(HAND);
    }
  }
}

void mousePressed() {
  if(num == 0) return;
  if(hover == null) return;
  if(hover.infection > 0) return;
  hover.infection = 0.01;
  num--;
}

void keyPressed() {
  if(keyCode == SHIFT)
    showRange = true;
}

void keyReleased() {
  if(keyCode == SHIFT)
    showRange = false; 
}

void draw() {
  // Clean out values from last tick.
  background(50);
  numSick = numImmune = numDead = 0;
  sumHealth = sumImmunity = sumInfection = 0;

  // Welcome to the neighborhood.
  if(frameCount % 10 == 0)
  {
    for(int i = 0; i < neighbors.length; i++)
      for(int j = 0; j < neighbors[i].length; j++)
        neighbors[i][j].clear();
    for(int i = 0; i < victims.length; i++) {
      Victim v = victims[i];
      int x = constrain(floor(v.position.x / CELL_SIZE), 0, CELLS_X - 1);
      int y = constrain(floor(v.position.y / CELL_SIZE), 0, CELLS_Y - 1);
      neighbors[x][y].add(v);
      if(y < CELLS_Y - 1) neighbors[x][y + 1].add(v);
      if(y > 0) neighbors[x][y - 1].add(v);
      if(x < CELLS_X - 1) {
        neighbors[x + 1][y].add(v);
        if(y < CELLS_Y - 1) neighbors[x + 1][y + 1].add(v);
        if(y > 0) neighbors[x + 1][y - 1].add(v);
      }
      if(x > 0) {
        neighbors[x - 1][y].add(v);
        if(y < CELLS_Y - 1) neighbors[x - 1][y + 1].add(v);
        if(y > 0) neighbors[x - 1][y - 1].add(v);
      }
    }
  }

  // Draw victims.
  for(int i = 0; i < victims.length; i++) {
    Victim v = victims[i];
    v.tick();
    if(v.infection > 0) {
      if(showRange) {
        float r = 10 + sqrt(1000 * v.infection);
        noStroke();
        fill(v.infection * 255, 0, 0, 100);
        ellipse(v.position.x, v.position.y, r, r);
      }
      fill(v.infection * 255, 0, 0);
    }
    else {
      fill(200, 100);
    }
    stroke(255);
    ellipse(v.position.x, v.position.y, 10, 10);
    if(v.health == 0) {
      line(v.position.x + 7, v.position.y + 7, v.position.x - 7, v.position.y - 7);
      line(v.position.x + 7, v.position.y - 7, v.position.x - 7, v.position.y + 7);
    }
/*  else if(v.health < 0.95) {
      strokeWeight(2.5);
      stroke(255, 0, 0);
      noFill();
      arc(v.position.x, v.position.y, 10, 10, 0, TWO_PI * (1 - v.health));
      strokeWeight(1);
    }
*/}

  // Show details when you hover over one victim.
  if(hover != null) {
    if(showRange)
      for(Victim v : hover.getNeighbors()) {
        stroke(0, 255, 0, 100);
        noFill();
        rect(v.position.x - 9, v.position.y - 8, 17, 16);
      }   
    fill(0, 100);
    noStroke();
    rect(hover.position.x + 14, hover.position.y - 23, 52, 45);
    if(num > 0) {
      stroke(255, 0, 0);
      fill(255, 0, 0);
    }
    else {
      stroke(200);
      fill(200);
    }
    crosshair(hover.position);
    text(join(new String[] {
      nf(hover.health,    0, 3) + " \u2661",
      nf(hover.immunity,  0, 3) + " \u2629",
      nf(hover.infection, 0, 3) + " \u2623",
    }, "\n"), hover.position.x + 15, hover.position.y - 10);
  }

  // Draw heads up display.
  fill(0, 100);
  noStroke();
  rect(0, 0, 150, 150);
  fill(255);
  text(join(new String[] {
    "Time: "         + frameCount,
    "FPS: "          + round(frameRate),
    "Clicks: "       + num,
    "People: "       + victims.length,
    "Dead: "         + formatPercent(numDead),
    "Sick: "         + formatPercent(numSick),
    "Immune: "       + formatPercent(numImmune),
    "\u03A3\u2661: " + formatPercent(int(sumHealth)),
    "\u03A3\u2629: " + formatPercent(int(sumImmunity)),
    "\u03A3\u2623: " + formatPercent(int(sumInfection)),
  }, "\n"), 7, 16);
}

String formatPercent(int i) {
  return i + " (" + int(100.0 * i / victims.length) + "%)";
}

void crosshair(PVector v) {
  line(v.x + 10, v.y + 10, v.x +  5, v.y + 10);
  line(v.x + 10, v.y + 10, v.x + 10, v.y +  5);
  line(v.x - 10, v.y - 10, v.x -  5, v.y - 10);
  line(v.x - 10, v.y - 10, v.x - 10, v.y -  5);
  line(v.x + 10, v.y - 10, v.x +  5, v.y - 10);
  line(v.x + 10, v.y - 10, v.x + 10, v.y -  5);
  line(v.x - 10, v.y + 10, v.x -  5, v.y + 10);
  line(v.x - 10, v.y + 10, v.x - 10, v.y +  5);
}

class Victim {
  PVector position, velocity;
  float health, immunity, infection;
  float strength;
  
  Victim() {
    do
      position = new PVector(random(10, width - 10), random(10, height - 10));
    while(position.x < 150 && position.y < 150);
    velocity  = new PVector(0, 0);
    health    = 1;
    immunity  = 0;
    infection = 0;
    strength  = sqrt(random(0.525, 1.0));
  }

  ArrayList<Victim> getNeighbors() {
      int x = constrain(floor(position.x / CELL_SIZE), 0, CELLS_X - 1);
      int y = constrain(floor(position.y / CELL_SIZE), 0, CELLS_Y - 1);
      return neighbors[x][y];
  }

  void tick() {
    // Behavior and movement.
    if(health > 0) {
      position.add(velocity);
      velocity.x += random(-0.25, 0.25);
      velocity.y += random(-0.25, 0.25);
      if(position.x < 10)          velocity.x += 1;
      if(position.y < 10)          velocity.y += 1;
      if(position.x > width  - 10) velocity.x -= 1;
      if(position.y > height - 10) velocity.y -= 1;
      if(position.x < 160 && position.y < 160)
        velocity.add(new PVector(1, 1));
      velocity.mult(health);
      for(Victim v : getNeighbors()) {
        if(this == v) continue;
        float d = PVector.dist(position, v.position);
        PVector p = PVector.sub(position, v.position);
        p.normalize();
        p.div(max(0.05, d));
        velocity.add(p);
      }
      velocity.limit(2.5);
    }

    // Medical progression.
    if(health > 0) {
      health += +0.001;    // Health recovery over time.
      immunity -= 0.00001; // Immune system memory fades over time.
      if(infection > 0) {
        float spreading = infection - immunity * 1.5;
        float damage    = infection / strength;
        health    -= random(damage    / 100.0); // Infection damages health.
        immunity  += random(infection / 100.0); // Infection produces natural immunity.
        infection += random(spreading / 10.0);  // Infection incubates over time.
      }
    }
    health    = constrain(health,    0, 1);
    immunity  = constrain(immunity,  0, 1);
    infection = constrain(infection, 0, 1);
    sumHealth    += health;
    sumImmunity  += immunity;
    sumInfection += infection;
    if(health <= 0)
      numDead++;
    else if(infection > 0)
      numSick++;
    else if(immunity > 0)
      numImmune++;

    // Transmission to others.
    if(infection > 0) {
      for(Victim v : getNeighbors()) {
        if(this == v) continue;
        if(v.infection > 0) continue;
        float d = PVector.dist(v.position, position);
        if(d > 10 + sqrt(1000 * infection)) continue;
        if(v.immunity > random(0, infection)) continue;
        v.infection = 0.01;
      }
    }
  }
}

class VictimList extends ArrayList<Victim> {
  // Extend the generic type to allow 2-dimensional neighbors array.
}



