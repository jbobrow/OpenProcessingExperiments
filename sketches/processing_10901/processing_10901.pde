
/* Osmosis
   Future Data Lab - futuredatalab.com
   Version 1.0 - 2010/07/15 */

// Global variables
World world;

// Setup the Processing Canvas
void setup() {
  size(700, 500);
  frameRate(15);

  world = new World();
  world.addCell(new Cell(0, width*0.5, height*0.5, 3));
  // Add an initial set of cells into the system
  for (int i = 0; i < 5; i++) {
    int type = world.generateType();
    world.addCell(new Cell(type, random(width), random(height), ceil(random(10))));
  }
  smooth();
}

// Main draw loop
void draw() {
  // Fill canvas black
  background(0);

  if (world.cells.size() < 20 && round(random(5)) == 0.0) {
    int type = world.generateType();
    int rand = round(random(2));
    if (rand == 0) { 
      world.addCell(new Cell(type, random(width), round(random(1))*height, ceil(random(5))));
    }
    if (rand == 1) { 
      world.addCell(new Cell(type, random(width), random(height), ceil(random(2))));
    }
    if (rand == 2) { 
      world.addCell(new Cell(type, round(random(1))*width, random(height), ceil(random(5))));
    }
  }
  
  world.run();
}

// Set cell's next destination
void mousePressed() {
  world.setTarget(mouseX, mouseY);
}

class World {
  ArrayList cells;

  // Constructor
  World() {
    cells = new ArrayList();
  }

  // Update each cell
  void run() {
    for (int i = 0; i < cells.size(); i++) {
      Cell cell = (Cell) cells.get(i);  
      cell.run(cells);  // Passing the entire list of cells to each cell individually
    }
  }

  // Add a cell
  void addCell(Cell cell) {
    cells.add(cell);
  }

  // Randomly generate a cell type
  int generateType() {
    switch (floor(random(1)*4)) {
      case 0: return 1;
      case 1: return 1; 
      case 2: return 2; 
      case 3: return 3; 
      default: return 1;
    }
  }

  // Set cell target
  void setTarget(float x, float y) {
    for (int i = 0; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      if (c.type == 0) {
        c.target(x, y);
      }
    }
  }
}

class Cell {
  float radius; // Cell size
  float mass; // Cell mass
  float food; // Absorbed mass
  float[] pos = new float[2]; // Position
  float[] vel = new float[2]; // Velocity
  float[] destination = new float[2]; // Target location
  boolean goal = false; // If is moving
  boolean dead = false; // If is dead
  int delay = 16; // Delay for pulses
  int type; // Cell type

  // Constructor
  Cell(int t, float x, float y, float m) {
    type = t;
    mass = m; // Mass
    food = 0.0;
    radius = mass*10; // Size
    pos[0] = x; // X position
    pos[1] = y; // Y position
    vel[0] = random(-0.5, 0.5); // X speed
    vel[1] = random(-0.5, 0.5); // Y speed
  }

  // Simulate
  void run(ArrayList cells) {
    update(cells);
    borders();
    render();
  }

  // Update cell
  void update(ArrayList cells) {
    cleanup(cells); // Remove dead cells
    runaround(); // Some dash around randomly
    predator(cells); // Some preys on others
    move(); // Moves toward a target
    osmosis(cells); // Check for osmosis
  }

  // Floats around randomly
  void wander() {
    metabolism(0.001);

    pos[0] += vel[0]; // X position
    pos[1] += vel[1]; // Y position

    // Randomly change direction
    if (random(1) == 0.0) {
      vel[0] = random(-0.5, 0.5); // X speed
      vel[1] = random(-0.5, 0.5); // Y speed
    }
  }

  // Move to a specific location
  void move() {
    // If there is a set target
    if (goal) {
      if (type == 0) metabolism(0.003);
      else metabolism(0.007);

      if (!dead) {
        // Add easing effect
        vel[0] = (destination[0] - pos[0])/delay; // X speed
        vel[1] = (destination[1] - pos[1])/delay; // Y speed

        pos[0] += vel[0]; // X position
        pos[1] += vel[1]; // Y position

        // If reached the target
        if (dist(pos[0], pos[1], destination[0], destination[1]) < radius) {
          goal = false;
        }
      }
    }
    else wander(); // Wanders around aimlessly
  }

  // Sets target
  void target(float x, float y) {
    goal = true;
    destination[0] = x;
    destination[1] = y;
  }

  // Bigger ones absorb smaller ones
  void osmosis(ArrayList cells) {
    for (int i = 0 ; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      float distance = dist(pos[0], pos[1], c.pos[0], c.pos[1]);
      if (distance < (radius + c.radius)*0.5 && mass > c.mass && mass < 10) {
        food = c.mass; // Absorbs the mass
        c.dead = true;
      }
    }
  }

  // The player is revived
  void revive(ArrayList cells) {
    cells.add(new Cell(0, random(width), random(height), 3));
  }

  // Grows and shrinks
  void metabolism(float energy) {
    // If is eaten
    if (dead) {
      mass -= 0.5;
      radius = mass*10;
    }

    // Moving uses up energy
    if ((type == 0 && mass > 2) || (type != 0 && mass > 1)) {
      mass -= mass*energy;
      radius = mass*10;
    }

    // Food makes one grow
    if (food > 0) {
      float digested = food/mass*0.1;
      mass += digested;
      food -= digested;
    }

    radius += sin(frameCount*0.25); // Pulses
  }

  // Remove dead cells
  void cleanup(ArrayList cells) {
    for (int i = 0 ; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      if (c.mass < 0) {
        if (c.type == 0) revive(cells); // Revive the player
        cells.remove(i); // Remove dead cell
      }
    }
  }

  // Dash around randomly
  void runaround() {
    if (type == 2 && round(random(100)) == 0) {
      float angle = random(0, TWO_PI);
      float randx = pos[0] + radius*cos(angle);
      float randy = pos[1] + radius*sin(angle);
      target(randx, randy);
    }
  }

  // Chases after others
  void predator(ArrayList cells) {
    if (type == 3 && mass < 10 && round(random(200)) == 0) {
      // Find the closest prey
      for (int i = 0; i < cells.size(); i++) {
        Cell c = (Cell) cells.get(i);        
        // If it's smaller, set it as target
        if (c.radius < radius) target(c.pos[0], c.pos[1]);
      }
    }
  }

  // Wrap around
  void borders() {
    if (pos[0] < -radius) pos[0] = width + radius;
    if (pos[0] > width + radius) pos[0] = -radius;
    if (pos[1] < -radius) pos[1] = height + radius;
    if (pos[1] > height + radius) pos[1] = -radius;
  }

  // Render everything
  void render() {
    float width = 5*(radius*0.01);
    if (width < 0.0) width = 0.0;
    strokeWeight(width);

    if (type == 0) fill(64, 128, 187, 100); // Set fill-color to blue
    else if (type == 1) fill(64, 187, 128, 100); // Set fill-color to green
    else if (type == 2) fill(128, 64, 187, 100); // Set fill-color to purple
    else if (type == 3) fill(187, 64, 128, 100); // Set fill-color to red
    // Set stroke-color white
    stroke(255, 255, 255, 140);
    // Draw circle
    ellipse(pos[0], pos[1], radius, radius);
  }
}



