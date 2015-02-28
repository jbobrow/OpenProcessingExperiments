
ArrayList[][] grid;
float gridSize = 50;

class HSPParticle extends Particle {
  
  boolean side;
  float seed;
  float t = 0;
  
  HSPParticle(float x, float y) {
    super(x, y);
    this.side = side;
    this.maxVel.x = 2;
    this.maxVel.y = 2;
    this.vel.x *= 2;
    this.vel.y *= 2;
    weight = 10;
    seed = random(1000);
    t = seed;
  }
  
  PVector getForce(Particle other) {
    PVector diff = PVector.sub(other.pos, pos);
    
    float dmag = diff.mag();
    
    if (dmag < gridSize*2) {
      return new PVector(min(sin(t) * 1000/diff.x/dmag, 1)/other.weight, min(sin(t) * 1000/diff.y/dmag, 1)/other.weight);
    }
    return new PVector(0, 0);
  }
  
  void update() {
    super.update();
    t += 0.1; 
  }
  
  void render() {
    noStroke();
    fill(255, 0, 0);
    ellipse(this.pos.x, this.pos.y, 6, 6);
  }
  
}

class AttractParticle extends Particle {
  
  boolean side;
  
  AttractParticle(float x, float y) {
    super(x, y);
    this.side = side;
    weight = 1;
  }
  
  PVector getForce(Particle other) {
    PVector diff = PVector.sub(other.pos, pos);
    
    if (diff.mag() < gridSize) {
      return new PVector(min(-0.01/diff.x, 1)/other.weight, min(-0.01/diff.y, 1)/other.weight);
    }
    return new PVector(0, 0);
  }
}

class Particle {
  PVector accel;
  PVector vel;
  PVector maxVel;
  PVector pos;
  float weight;
  
  int gj;
  int gi;
  
  Particle(float x, float y) {
    maxVel = new PVector(1, 1);
    pos = new PVector(x, y);
    accel = new PVector(0, 0);
    vel = new PVector(random(maxVel.x*2) - maxVel.x, random(maxVel.y*2) - maxVel.y);
    gj = getGridY(y);
    gi = getGridX(x);
    grid[gj][gi].add(this);
  }
  
  PVector getForce(Particle other) {
    
    return new PVector(0, 0);
  }
  
  void render() {
    noStroke();
    fill(255, 150, 100);
    ellipse(pos.x, pos.y, 3, 3);
  }
  
  void update() {
    //println(accel.x + ", " + accel.y);
    vel.x += accel.x;
    vel.y += accel.y;
    vel.x = max(-maxVel.x, min(maxVel.x, vel.x));
    vel.y = max(-maxVel.y, min(maxVel.y, vel.y));
    pos.x += vel.x;
    pos.y += vel.y;
    pos.x = pos.x % width;
    pos.y = pos.y % height;
    
    while (pos.x < 0) {
      pos.x += width;
    }
    
    while (pos.y < 0) {
      pos.y += height;
    }
    
    //println(pos.y + ", " + pos.x);
    
    int ngj = getGridY(pos.y);
    int ngi = getGridX(pos.x);
    
    if (ngj != gj || ngi != gi) {
      grid[gj][gi].remove(this);
      grid[ngj][ngi].add(this);
      gi = ngi;
      gj = ngj;
    }
    accel.x = 0;
    accel.y = 0;
    //vel.x *= 0.99;
    //vel.y *= 0.99;
  }
}

void setup() {
  size(500, 500);
  initializeGrid();
  populate();
}

void draw() {
  
  background(255, 255, 200);
  
  resolveForces();
  
  for (int j = 0; j < grid.length; j++) {
    for (int i = 0; i < grid[0].length; i++) {
      ArrayList<Particle> cell = grid[j][i];
      for (int k = 0; k < cell.size(); k++) {
        Particle p = cell.get(k);
        p.update();
        p.render();
      }
    }
  }
  
}

void populate() {
  for (int i = 0; i < random(500) + 500; i++) {
    AttractParticle p = new AttractParticle(random(width), random(height));
  }
  for (int i = 0; i < random(20) + 20; i++) {
    HSPParticle p = new HSPParticle(random(width), random(height));
  }
}

void initializeGrid() {
  int gridX = ceil(width/gridSize);
  int gridY = ceil(height/gridSize);
  grid = new ArrayList[gridY][gridX];
  for (int j = 0; j < gridY; j++) {
    ArrayList[] row = new ArrayList[gridY];
    for (int i = 0; i < gridX; i++) {
      ArrayList<Particle> cell = new ArrayList<Particle>();
      row[i] = cell;
    }
    grid[j] = row;
  }
}

int getGridX(float px) {
  return floor(min(max(0, px/width), 0.99) * ceil(width/gridSize));
}

int getGridY(float py) {
  return floor(min(max(0, py/height), 0.99) * ceil(height/gridSize));
}

void resolveForces() {
  for (int j = 0; j < grid.length; j++) {
    ArrayList[] row = grid[j];
    for (int i = 0; i < row.length; i++) {
      
      /* get cell */
      ArrayList<Particle> cell = row[i];
      
      /* for each particle in cell */
      for (int k = 0; k < cell.size(); k++) {
        Particle p = cell.get(k);
        
        /* nearest neighbors */
        for (int rj = j-1; rj < j+1; rj++) {
          for (int ri = i-1; ri < i+1; ri++) {
            
            if (rj >= 0 && rj < grid.length && ri >= 0 && ri < row.length) {
              /* neighboring cell */
              ArrayList<Particle> ocell = grid[rj][ri];
              
              for (int m = 0; m < ocell.size(); m++) {
                
                Particle op = ocell.get(m);
                if (op != p) {
                  
                  PVector force = op.getForce(p);
                  p.accel.add(force);
                  //println(force.x + ", " + force.y);
                }
              }
            }
          }
        }
      }
    }
  }
}
